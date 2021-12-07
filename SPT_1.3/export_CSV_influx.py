# -*- coding: utf-8 -*-
"""
Created on Tue Jun  1 14:53:19 2021

@author: romh
"""
from Common_function import * 
from datetime import timedelta
from datetime import datetime
import re
import random
import time
import os
import csv
import numpy as np
from csv import reader
import argparse
from influxdb import client as influxdb
from influxdb import InfluxDBClient
from threading import Thread
#%%
RES_FOLDER = os.path.join(SCRIPT_PATH,'results')
INFLUX_MANAGEDATA_DIR = os.path.join(RES_FOLDER,"CsvToInflux_ManageData")
INFLUX_MANAGEDATA_FILE = os.path.join(INFLUX_MANAGEDATA_DIR,f"CsvToInflux_ManageData.CSV")
#covertDate varaibles
previousDay = False
deltaTime1 = 3
#%%
def convert_date(in_date,orignalDate_flag=False):
    global previousDay,deltaTime1
    date_form= datetime.strptime(in_date,"%Y-%m-%d %H:%M:%S")  
    if not orignalDate_flag:
        if not previousDay:
            previousDay = date_form.day
        elif previousDay != date_form.day:
            deltaTime1=deltaTime1-timedelta(1)
            previousDay=date_form.day
        newdate = datetime.now() - deltaTime1
        date_form=date_form.replace(year=newdate.year)
        date_form=date_form.replace(month=newdate.month)
        date_form=date_form.replace(day=newdate.day)
    return date_form

def generateDeltaTime(startTime,endTime):
    startTime= convert_date(startTime,True) 
    endTime= convert_date(endTime,True) 
    return (endTime-startTime)+timedelta(1)
    
def SendToInfluxDB(data,client):
    client.switch_database('telegraf')
    x=client.write_points(data)


def generateHostname():
    now = datetime.now()
    dt_string = now.strftime("%d-%m-%Y_%H-%M-%S")
    return f"Csv_{dt_string}"


def sendToInflux(client,**kwargs):
    if set(kwargs.keys()) == set(["measurement","time","tags","fields"]):
        data = [
            {
                "measurement": kwargs["measurement"],
                "time" : kwargs["time"],
                "tags": kwargs["tags"],
                "fields": kwargs["fields"]
            }
        ]
        SendToInfluxDB(data,client)
    else:
        print("sendToInflux error")

def Send_CSV_ToInflux(pathcsv,targetHost,generatedHostName,operation,originalDate_flag=False):
    printflag=False
    with open(pathcsv, newline='') as csvfile:
        client = InfluxDBClient(host=influxhost, port=influxport)
        global deltaTime1
        readerlines = csvfile.readlines()
        startTime = readerlines[1].split(",")[0]
        endTime = readerlines[-1].split(",")[0]
        deltaTime1 = generateDeltaTime(startTime,endTime)
    with open(pathcsv, newline='') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            Date = convert_date(row['Date'],originalDate_flag)
            if operation == "load":
                FirstImageTime = row['FirstImageTime']
                StudyModality=row['Modality']
                ImagesPerSecond=row['ImagesPerSecond']
                if ImagesPerSecond != 'Failed':
                    sendToInflux(client,measurement="SPT_Load_Rate",time=Date,tags={"target": f"{targetHost}","source":f"{generatedHostName}"},fields = {f"{StudyModality}": float(ImagesPerSecond)})
                    sendToInflux(client,measurement="SPT_Load_TimeToFirst",time=Date,tags={"target": f"{targetHost}","source":f"{generatedHostName}"},fields = {f"{StudyModality}": float(FirstImageTime)})
            elif operation == "store":
                StoreImagesPerSecond = row['StoreRate']
                StudyModality=row['Modality']
                TotalStoreTime=row['StoreTime']
                if TotalStoreTime != 'Failed':
                    sendToInflux(client,measurement="SPT_Store_Images_Per_Second",time=Date,tags={"target": f"{targetHost}","source":f"{generatedHostName}"},fields = {f"{StudyModality}": float(StoreImagesPerSecond)})
                    sendToInflux(client,measurement="SPT_Store_Total_Time",time=Date,tags={"target": f"{targetHost}","source":f"{generatedHostName}"},fields = {f"{StudyModality}": float(TotalStoreTime)})
            elif operation == "query":
                QueryType=row['QueryType']
                QueryTime=row['QueryTime']
                if QueryTime != 'Failed':
                    sendToInflux(client,measurement="SPT_Query_ResponseTime",time=Date,tags={"target": f"{targetHost}","source":f"{generatedHostName}"},fields = {f"{QueryType}": float(QueryTime)})
    client.close()
    saveGeneratedHostDetails(pathcsv,generatedHostName,targetHost,startTime,endTime)
    
def getTargetHost(resFileName,totalResFileFlag=False):
    """
    Parameters
    ----------
    filename : Str
        DESCRIPTION: function receive file name and extract from the file the target host

    Returns : Str / None.
    -------
    """
    try:
        temp = resFileName.split("_")
        if(not totalResFileFlag):
            name = temp[-2]
        else:
            name = temp[-1].split(".CSV")[0]

    except:
        raise Exception("Wrong file name format.")
    return name

def getSatHost(resFilePath):
    """
    Parameters
    ----------
    filename : Str
        DESCRIPTION: function receive file name and extract from the file the Sat host

    Returns : Str / None.
    -------
    """
    file = extractFileFromPath(resFilePath)
    try:
        temp = file.split("_")
        satHost = temp[-1].split(".CSV")[0]
    except:
        raise Exception("Wrong file name format.")
    return satHost


def extractFileFromPath(path):
    file = os.path.split(path)[-1]
    return file

def findAllTotalResFiles(path):
    csvFilesPath={}
    operations = ["load","store","query"]
    csvFilesPath["load"],csvFilesPath["store"],csvFilesPath["query"],hosts = collectResCsvToLists(path,".*load_total_results.*\.CSV",".*store_total_results.*\.CSV",".*query_total_results.*\.CSV",True) 
    return csvFilesPath,hosts

def collectResCsvToLists(path,load_pattern=".*load_monitor.*\.CSV",store_pattern=".*store_result.*\.CSV",query_pattern=".*query_result.*\.CSV",totalResFileFlag=False): 
    """
    Parameters
    ----------
    path : Str
        DESCRIPTION.

    Returns
    -------
    loadCsvFilesPath : dict
        DESCRIPTION: dict of key=host: list of all load result files by same host 
    storeCsvFilesPath : dict
        DESCRIPTION: dict of key=host: list of all store result files by same host 
    queryCsvFilesPath : dict
        DESCRIPTION: dict of key=host: list of all query result files by same host 
    targetHosts : list
        DESCRIPTIO: list of all targethosts in the folder.

    """
    loadCsvFilesPath={}
    storeCsvFilesPath={}
    queryCsvFilesPath={}
    targetHosts=set()
    for root, dirs, files in os.walk(path):
        for file in files:
            filepath = os.path.join(root,file)
            if (re.findall(load_pattern, file)):
                currenthost = getTargetHost(file,totalResFileFlag) 
                targetHosts.add(currenthost)
                if not totalResFileFlag:
                    multipleValueDictInsert(loadCsvFilesPath,currenthost,filepath)
                else:
                    loadCsvFilesPath[currenthost] = filepath
            elif(re.findall(store_pattern, file)):
                currenthost = getTargetHost(file,totalResFileFlag) 
                targetHosts.add(currenthost)
                if not totalResFileFlag:
                    multipleValueDictInsert(storeCsvFilesPath,currenthost,filepath)
                else:
                    storeCsvFilesPath[currenthost] = filepath
            elif(re.findall(query_pattern, file)):
                currenthost = getTargetHost(file,totalResFileFlag) 
                targetHosts.add(currenthost)
                if not totalResFileFlag:
                    multipleValueDictInsert(queryCsvFilesPath,currenthost,filepath)
                else:
                    queryCsvFilesPath[currenthost] = filepath
    return loadCsvFilesPath,storeCsvFilesPath,queryCsvFilesPath,targetHosts

def multipleValueDictInsert(dictionary,key,value):
    """
    Metod init list to dict[key] and insert value into the list.
    In case dict[key] already exist, append the list by value.

    Parameters
    ----------
    dictionary : TYPE dict
        DESCRIPTION.
    key : TYPE Str
        DESCRIPTION.
    value : TYPE Str (file path)
        DESCRIPTION.

    Returns
    -------
    None.

    """
    if(key not in dictionary.keys()):
        dictionary[key] = [value]
    else:
        dictionary[key].append(value)
        

def buildTotalTargetDict(dictionary,key,satHostFlag=False):
    """
    Method checks if dictionary contains host results, in case it does for each file in dict[host]
    open the file and add its content to new dictionary (key= hostname : Value=csv content of all results by ame host)
    Parameters
    ----------
    dictionary : dict
        DESCRIPTION: dict of key=host: list of all result files by same host
    key : Str
        DESCRIPTION: hostname

    Returns
    -------
    dictionary : TYPE
        DESCRIPTION.

    """
    if(key in dictionary.keys()):
        values=[]
        headers = []
        for file in dictionary[key]:
            if(satHostFlag):
                satHost = getSatHost(file)
            else:
                satHost = None
            if(headers == []):
                res,headers = buildResDict(file,True,satHost) 
                values.extend(res)
                if(satHostFlag):
                    headers.append("satHost")
            else:
                values.extend(buildResDict(file,False,satHost))
        x = OrderByTime(values)
        dictionary[key] = x
        return dictionary,headers
    else:
        return None,None
                              
def createTargetTotalCsv(dictionary,key,filename,path = os.path.dirname(__file__),satHostFlag=False):
    targetTotalCsv,headers = buildTotalTargetDict(dictionary,key,satHostFlag=satHostFlag)
    if(targetTotalCsv):
        rows = dictionary[key]
        CreateUnifiedCSV(filename, headers, rows, path)

def OrderByTime(rows):
    lrows=[]
    nrows= np.array(rows)
    rows = nrows[np.argsort(nrows[:,0])] 
    rows = rows.tolist()
    return rows

def generateTotalResCsv(path,satHostFlag=False):
    csvFilesPath = {}
    csvFilesPath["load"],csvFilesPath["store"],csvFilesPath["query"],targetHosts = collectResCsvToLists(path)
    print(f"##########\nAGGREGATE FILES FINISHED!\n##########\n=============\nTOTAL HOSTS: {targetHosts}\n=============\n**********\nloadCsvFilesPath:\n{csvFilesPath['load']}\n**********\nstoreCsvFilesPath:\n{csvFilesPath['store']}\n**********\nqueryCsvFilesPath:\n{csvFilesPath['query']}\n**********")
    fileType = ".CSV"
    threadLst=[]
    operationTypes = ["load","store","query"]
    resCsvFiles={"load" : {}, "store": {}, "query" : {}}
    for host in targetHosts:
        hostResFolder = safeFolderCreate(RES_FOLDER,host)
        total_res_path = safeFolderCreate(hostResFolder,"Total_Results")
        for operation in operationTypes:
            filePrefix = f"spt_{operation}_total_results_"
            if(csvFilesPath[operation]):
                resCsvFiles[operation][host] = os.path.join(total_res_path,filePrefix+host+fileType)    # collect file that creates to one dict
            t=Thread(target=createTargetTotalCsv,args=(csvFilesPath[operation],host,filePrefix+host+fileType,total_res_path,satHostFlag))
            threadLst.append(t)
            t.start()
    for thread in threadLst:
        thread.join()
    return resCsvFiles,targetHosts


def csvToInflux(path,satHostFlag=False,createUnifiedCsv=True,sendToInfluxFlag=True,originalDate_flag=False):
    if(createUnifiedCsv):
        resCsvFiles,targetHosts = generateTotalResCsv(path,satHostFlag)
    else:
        resCsvFiles,targetHosts = findAllTotalResFiles(path)
    print(f"result files:\n{resCsvFiles}")
    if(sendToInfluxFlag):
        print("Exporting To Influx In Progress Please Wait...")
        threads = []
        generateHostNameDict ={}
        for tHost in targetHosts:
            generateHostNameDict[tHost] = generateHostName()
        print(f"generated hosts: {generateHostNameDict}")
        
        for operation,targetHostName in resCsvFiles.items():
            for tHost,pathcsv in targetHostName.items():
                t=Thread(target=Send_CSV_ToInflux,args=(pathcsv,tHost,generateHostNameDict[tHost],operation,originalDate_flag))
                threads.append(t)
                t.start()
        for t in threads:
            t.join()
                # For debug only:
                # Send_CSV_ToInflux(pathcsv,tHost,generateHostNameDict[tHost],operation,originalDate_flag)
        #(f"result files: {generateHostNameDict}")
        print("------------------ UPLOADING TO INFLUX FINISHED ------------------")
        return generateHostNameDict
    
def generateHostName():
    now = datetime.now()
    dt_string = now.strftime("%d%m%y%H%M%S")
    return f"{dt_string}_CSV"
    #Create CSV file with to find hostname

def saveGeneratedHostDetails(path,hostname,targetHost,startTime,endTime):
    resfolder = safeFolderCreate(RES_FOLDER)
    csvFilefolder = safeFolderCreate(INFLUX_MANAGEDATA_DIR)
    csvFilePath = INFLUX_MANAGEDATA_FILE
    fileName = extractFileFromPath(path)
    headers = ["filename","hostName","targetHostName","startTime","endTime"]
    CreateCSV(csvFilePath, headers, [fileName,hostname,targetHost,startTime,endTime])

    
# def sendToInflux(targetHosts):
#     threads = []
#     for host in targetHosts:
#         hostname = genrateHostName(host)
#         T1=Thread(target=Send_CSV_Load,args=(hostname,dayflag,deltatime1))
#         T2=Thread(target=Send_CSV_Store,args=(hostname,dayflag,deltatime1))
#         T3=Thread(target=Send_CSV_Query,args=(hostname,dayflag,deltatime1))
#         T1.start()
#         T2.start()
#         T3.start()
#         threads.extend([T1,T2,T3])
#     for thread in threads:
#         thread.join()
    
    
def buildResDict(filepath,headersRequest_flag,satHost=None):
    printflag=False
    csvDict = []
    headers = []
    with open(filepath,'r') as csvfile:
        reader=csv.DictReader(csvfile)
        for row in reader:
            if(headers==[] and headersRequest_flag):
                headers = list(row.keys())
            #print(row["Date"])
            try:
                date = convert_date(row["Date"],True)
            except:
                continue
            row["Date"] = date
            if(satHost):
                row["path"] = satHost
            row = list(row.values())
            csvDict.append(row) 
    if(headersRequest_flag):    
        return csvDict,headers
    else:
        return csvDict
    

def CreateUnifiedCSV(filename,headers,rows,dirpath=os.path.dirname(__file__)):
    CSVpath = os.path.join(dirpath, filename)
    sniffer = csv.Sniffer()
    logger.info(f"Create Csv - Create CSV Path : {CSVpath}")             
    with open(CSVpath,"w",newline='') as f:
        writer = csv.writer(f)
        writer.writerow(headers)
        for row in rows:
            row[0] = row[0].strftime("%Y-%m-%d %H:%M:%S")
            writer.writerow(row)
        logger.info(f"Create Csv - append to Csv : {row}")   
#%%   

def readInfluxMangaeDataRows(generateHostNameDict):
    headerKey = "hostName"
    resDict = {}
    for tHost in generateHostNameDict.keys():
        resDict[f"TargetHost = {tHost}"] = CsvFindRowsByValue(INFLUX_MANAGEDATA_FILE,headerKey,generateHostNameDict[tHost])
    return resDict    

def CsvFindRowsByValue(filePath,headerKey,value):
    headers = []
    res=[]
    with open(filePath,'r') as csvfile:
        reader=csv.DictReader(csvfile)
        for row in reader:
            if(headers==[]):
                headers = list(row.keys())
            if row[headerKey] == value:
                # Extract values from row
                operation = row[headers[0]].split("_")[1]
                startTime = f"startTime = {row[headers[3]]}"
                endTime = f"endTime = {row[headers[4]]}"
                resRow = [operation,f"genetatedHost = {value}",startTime,endTime]
                res.append(resRow)
    return res


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Philips Algotec SPT_export_CSV_influx')
    parser.add_argument('--p','-path',required=True,type=str,help="Csv results folder path")
    parser.add_argument('--h','-satHost',required=False,action="store_true",help="Add to total csvRes column of which nsat provide the result",default=False)
    parser.add_argument('--c','-createUnifiedCsv',required=False,action="store_true",help="create unifiedCsv",default=False)
    parser.add_argument('--s','-sendToInflux',required=False,action="store_true",help="upload to influx",default=False)
    parser.add_argument('--o','-originalDate',required=False,action="store_true",help="upload to influx",default=False)
    args = parser.parse_args()
    path = args.p
    csvToInflux(path,args.h,args.c,args.s,args.o)

    # ONLY FOR SCRIPT DEBUGING:
    # path = r"C:\Users\Administrator\Desktop\SPT\results\wfmpri"
    # csvToInflux(path,True,True,True,False)
    # csvToInflux(path,True,False,False,False)
    # csvToInflux(path)