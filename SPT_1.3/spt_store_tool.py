# -*- coding: utf-8 -*-
"""
Created on Wed Jun  2 16:01:54 2021

@author: Administrator
"""

from Common_function import *
import argparse
import time
from time import sleep
from multiprocessing import Process
from random import randrange

#%% Global variable
CsvFilePath=os.path.join(storeResultPath,f"spt_store_result_{TargetHostName}_{hostname}.CSV")
MODALITY_STORE_RATIO = 0
STUDY_DIR			= "study_dir_"
MODALITY_COUNT_CR	= 0
MODALITY_COUNT_CT	= 0
MODALITY_COUNT_US	= 0
MODALITY_COUNT_MR	= 0
MODALITY_RATIO_CR	= 450
MODALITY_RATIO_CT	= 650
MODALITY_RATIO_US	= 850
MODALITY_RATIO_MR	= 950
MODALITY_RATIO_MG   = 975
MODALITY_RATIO_DBT  = 1000

MODALITY_ARR_CR	= [1,2,3,4]
MODALITY_ARR_CT	= [1,2,3,4]
MODALITY_ARR_US	= [1,2,3,4]
MODALITY_ARR_MR	= [1,2,3,4]
nCurrStore	= 1
nContLoop	= 1
try:
    if(len(PARAMS["globalParams"]["SiteRange"])==3):
        SiteRange = (i for i in range(int(PARAMS["globalParams"]["SiteRange"][0]),int(PARAMS["globalParams"]["SiteRange"][1]),int(PARAMS["globalParams"]["SiteRange"][2])))
    else:
        SiteRange = (i for i in range(int(PARAMS["globalParams"]["SiteRange"][0]),int(PARAMS["globalParams"]["SiteRange"][1])))
except:
    SiteRangeList = False
#%%

def rotate(l, n=1):
    return l[1:] + l[:1]


def SendToinflux_store_result(StudyModality,StoreImagesPerSecond,TotalStoreTime):
    data_SPT_Store_Rate = [
        {
            "measurement": "SPT_Store_Images_Per_Second",
            "tags": {
                "target": f"{TargetHostName}",
                "source":f"{hostname}"
            },
            "fields": {
                f"{StudyModality}": StoreImagesPerSecond
            }
        }
    ]
    data_SPT_Store_TotalStoreTime = [
        {
            "measurement": "SPT_Store_Total_Time",
            "tags": {
                "target": f"{TargetHostName}",
                "source":f"{hostname}"
            },
            "fields": {
                f"{StudyModality}":TotalStoreTime
            }
        }
    ]
    SendToInfluxDB(data_SPT_Store_Rate)
    SendToInfluxDB(data_SPT_Store_TotalStoreTime)
 
      
def GetRandomModalityDir():
    nRandom=randrange(1000)
   # logger.info(f"GetRandomModalityDir","Random Number: {nRandom}")
    global MODALITY_ARR_CR	
    global MODALITY_ARR_CT	
    global MODALITY_ARR_US	
    global MODALITY_ARR_MR	
    global MODALITY_COUNT_CR
    global MODALITY_COUNT_CT
    global MODALITY_COUNT_US
    global MODALITY_COUNT_MR
    global MODALITY_STORE_RATIO
    global MODALITY_RATIO_CR
    global MODALITY_RATIO_MG
    global MODALITY_RATIO_DBT
    
    if (nRandom <= MODALITY_RATIO_CR):
       # logger.info("GetRandomModalityDir","Modality Chosen - CR")
        ModalityCode	= "CR_"
        nCurrModDir=MODALITY_ARR_CR[0]
        MODALITY_ARR_CR=rotate(MODALITY_ARR_CR)
        MODALITY_COUNT_CR += 1
        MODALITY_STORE_RATIO = MODALITY_COUNT_CR / nCurrStore * 100
    elif (nRandom <= MODALITY_RATIO_CT):
        #logger.info("GetRandomModalityDir","Modality Chosen - CT")
        ModalityCode	= "CT_"
        nCurrModDir=MODALITY_ARR_CT[0]
        MODALITY_ARR_CT=rotate(MODALITY_ARR_CT)
        MODALITY_COUNT_CT += 1
        MODALITY_STORE_RATIO = MODALITY_COUNT_CT / nCurrStore * 100
    elif (nRandom <= MODALITY_RATIO_US):
        #logger.info("GetRandomModalityDir","Modality Chosen - US")
        ModalityCode	= "US_";
        nCurrModDir=MODALITY_ARR_US[0]
        MODALITY_ARR_US=rotate(MODALITY_ARR_US)
        MODALITY_COUNT_US += 1;
        MODALITY_STORE_RATIO = MODALITY_COUNT_US / nCurrStore * 100;
    elif (nRandom <= MODALITY_RATIO_MR):
        #logger.info("GetRandomModalityDir","Modality Chosen - MR")
        ModalityCode	= "MR_";
        nCurrModDir=MODALITY_ARR_MR[0]
        MODALITY_ARR_MR=rotate(MODALITY_ARR_MR)
        MODALITY_COUNT_MR += 1;
        MODALITY_STORE_RATIO = MODALITY_COUNT_MR / nCurrStore * 100
    elif (nRandom <= MODALITY_RATIO_MG):
        #logger.info("GetRandomModalityDir","Modality Chosen - MR")
        ModalityCode	= "MG_";
        nCurrModDir="1"
        print(f"MG study");

    elif (nRandom <= MODALITY_RATIO_DBT):
        #logger.info("GetRandomModalityDir","Modality Chosen - MR")
        ModalityCode	= "DBT_";
        nCurrModDir="1"
        print(f"DBT study");

	# Build modality directory
    ModalityDir = f"{FILES_OS['study_dir']}{STUDY_DIR}{ModalityCode}0{nCurrModDir}"
    print(ModalityDir)
    # logger.info(f"GetRandomModalityDir Finished (ModalityDir={ModalityDir}).")
    return ModalityDir


def generateSiteId():
    global SiteRange
    try:
        return next(SiteRange)
    except:
        if(len(PARAMS["globalParams"]["SiteRange"])==3):
            SiteRange = (i for i in range(int(PARAMS["globalParams"]["SiteRange"][0]),int(PARAMS["globalParams"]["SiteRange"][1]),int(PARAMS["globalParams"]["SiteRange"][2])))
        else:
            SiteRange = (i for i in range(int(PARAMS["globalParams"]["SiteRange"][0]),int(PARAMS["globalParams"]["SiteRange"][1])))
        return next(SiteRange)
         
def BuildChangeTagFileNZ():
    date =datetime.datetime.now()
    szDate=date.strftime("%Y%m%d")
    szTime=date.strftime("%H%M%S")
    szDateTag = f"A: 00080020 {szDate}\n"
    TimeTag = f"A: 00080030 {szTime}\n"
    
    path = os.path.join(os.getenv("temp"), f"spt_dicomtag_{szDate}_ {szTime}.txt")
    logger.info("Opening TagsFile for writing...")
    with open(path,"w") as f:            
        f.write(szDateTag)
        f.write(TimeTag)
        if SiteRangeList:
            siteId=generateSiteId()
            site = f"C: 07A10050 {siteId}"
            f.write(site)
            print(f"siteID ={siteId}")
            logger.info(f"siteID ={siteId}")
            
    if os.path.exists(path):
        return path
    else:
        return False
    
    
def SendToCsv_store_result(szModalityStored,szModalityType,ImagesInStudy,StoreRate,StoreTime):
    try:

        date = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        headerslist=["Date","Modality","ModalityStored","ImagesInStudy","StoreRate","StoreTime"]
        datalist=[date,szModalityStored,szModalityType,ImagesInStudy,StoreRate,StoreTime]
        CreateCSV(CsvFilePath,headerslist,datalist)
    except:
        logger.error("SendToCsv_store_result error ")

        
def spt_store_study(DicomDir,CalledAe,LOGGER_LEVEL=logging.INFO):
    #logFilePath= init_logs(f"spt_store_study_{TargetHostName}.log")
    logger.setLevel(LOGGER_LEVEL)
    TagsFile = BuildChangeTagFileNZ()
    szModalityStored=DicomDir.split("_")[2]
    szModalityType=DicomDir.split("_")[3]
    command=[FILES_OS['tool_change_push'],"-a",f"{hostname}FIR","-c",CalledAe,"-t",TagsFile,"-r",DicomDir,"-s"]
    cp=" ".join(command)
    logger.info(f"command : {cp}")
    tick_start =  time.time()    
    output,error = ExecuteExe(command)
    tick_end =  time.time()
    logger.info(f"Output from tool_change_push: \n {output} ,\n{error}")
    StoreTime=round(tick_end-tick_start,2)
    logger.info(f"Store took {StoreTime} sec")
    ImagesInStudylist=re.findall("Stored SOP .+AE <\w+>\.",output)
    if (ImagesInStudylist) and not re.findall("Failed storing SOP",output):
        ImagesInStudy = len(re.findall("Stored SOP .+AE <\w+>\.",output))
    else:
        print("Store failed!!!!")
        logger.critical(f"Store failed !!!")
        printCommand = " ".join(command)
        logger.critical(f"command : {printCommand}")
        logger.critical(f"Output from tool_change_push: \n {output} ,\n{error}")
        WriteFailureToCSV(CsvFilePath,6)
        return None,None,None,None
    StoreRate = round(ImagesInStudy / StoreTime,2)
    logger.info(f"Store result szModalityStored,szModalityType,ImagesInStudy,StoreRate,StoreTime")
    logger.info(f"Store result {szModalityStored},{szModalityType},{ImagesInStudy},{StoreRate},{StoreTime}")
    if influxmode==True:
        SendToinflux_store_result(szModalityStored,StoreRate,StoreTime)
        logger.info("send to influx")
    try:
        os.remove(TagsFile)
        logger.info("Remove TagsFile")
    except:
        logger.error(f"can't remove Tagsfile : {TagsFile}")
    SendToCsv_store_result(szModalityStored,szModalityType,ImagesInStudy,StoreRate,StoreTime)    
    return szModalityStored,szModalityType,ImagesInStudy,StoreRate,StoreTime


def threadCheck(endtime):
    while(datetime.datetime.now()<endtime):
        if (not HealthCheck(TargetDBIP,calledAE)):
            checkNum+=1
            if(checkNum==10):
                print("exit program healcheck failed 10 times")
                exit()
        sleep(30)
                
        
def write_processid_file(pid):
    path_processid_file=os.path.join(f'{SCRIPT_PATH}\pids',"processID_user_store.txt")
    with open(path_processid_file,"w") as f:
            f.write(str(pid)) 
#%% Main

if __name__ == '__main__':
    write_processid_file(os.getpid())
    logFilePath = init_logs(f"spt_store_tool_{TargetHostName}.log")
    logger.critical("====================================== running spt_store_tool.py ======================================")
    print("====================================== spt_store_tool.py ======================================")
    allowlogs=[i for i in range(1,8)]
    #===========================================args===========================================
    parser = argparse.ArgumentParser(description='Philips Algotec SPT_store_tool')
    parser.add_argument('--c', '-called_ae', required=False,default=defaultAE,type=str, help="called_AE - hostnameFIR")
    parser.add_argument('--l', '-log_level', required=False, type=int,choices=allowlogs, help="logger level",default=5)
    parser.add_argument('--d','-dicomdir',required=False,type=int,help='dicomdir')
    parser.add_argument('--tl','-test_spt_store_study',required=False,action="store_true",default=False,help='run spt_store_study')
    parser.add_argument('--s','-site_range',required=False,action="store_true",default=False,help='generate site range')

    args = parser.parse_args()
    calledAE = args.c
    LOGGER_LEVEL = logDict[args.l]
    logger.setLevel(LOGGER_LEVEL)    
    print(f"Logging level: {logger}")
    logger.info(f"Logging level: {LOGGER_LEVEL}")
    SleepDuration = round(GetSleepDuration(YearlyProcs,WORKING_DAYS_YEARLY,WORKING_HOURS_PER_DAY,1),2)
    print(f"Sleep duration: {SleepDuration}")
    logger.info(f"Sleep duration: {SleepDuration}")
    HealthCheck(TargetDBIP,calledAE)
    if(args.s): #generate site range
        pass
    if args.tl or args.d:
        if args.d:
            StoreDir=args.d
        else:
            StoreDir = GetRandomModalityDir()
        res = spt_store_study(StoreDir,defaultAE)
        print(f"Store result szModalityStored,szModalityType,ImagesInStudy,StoreRate,StoreTime")
        print(f"Store result: {res}")
        sys.exit() 
    flag_csv=CSV_PARAMS
    endtime=GetEndTime()
    TailPath = os.path.join(SCRIPT_PATH,CsvFilePath)
    while (datetime.datetime.now()<endtime):
        if (flag_csv):
            if (os.path.exists(TailPath)):
                flag_csv = False
                thread = Thread(target=cmdExecute,args=(f"start tail -f \"{TailPath}\"",True))
                thread.start()    
                
        StoreDir = GetRandomModalityDir()
        logger.info(f"GetRandomModalityDir {StoreDir}")
        p =Thread(target=spt_store_study,args=(StoreDir,calledAE,LOGGER_LEVEL))
        #p = Process(target=spt_store_study,args=(StoreDir,calledAE,LOGGER_LEVEL))
        p.start()
        dirS=StoreDir.split("\\")[-1]
        print(f"Study store command execute - Store Number {nCurrStore} (Modality  {dirS} Ratio {round(MODALITY_STORE_RATIO,2)}%>")
        logger.info(f"Study store command execute - Store Number {nCurrStore} (Modality  {dirS} Ratio {MODALITY_STORE_RATIO}%>");
        logger.info("Sleep Duration : {SleepDuration} seconds, NOW sleeping...")
        #bug fix (-0.9) sleep is more fast in perl 
        sleep(SleepDuration)
        nCurrStore += 1


