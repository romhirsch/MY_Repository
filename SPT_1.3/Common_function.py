#%%
from random import randrange
import cx_Oracle
import logging
import socket
import os 
import subprocess
import json
import datetime
import sys
import multiprocessing
from threading import Thread
import re
import csv 

def safeFolderCreate(folderPath,foldername = None):
    if foldername:
        folder = os.path.join(folderPath,foldername)
    else:
        folder = folderPath
    if not os.path.exists(folder):
        try:
            os.mkdir(folder)
        except Exception as error:
            logger.info(f"{folder} Unable to create folder, {error}")
    return folder


timenow =  datetime.datetime.now()
SCRIPT_PATH = os.path.abspath(os.path.dirname(__file__))
isInfluxExtentionInstalled = False
# %%
logDict = {
    1 : logging.CRITICAL,
    2 : logging.CRITICAL,
    3 : logging.CRITICAL,
    4 : logging.ERROR,
    5 : logging.WARNING,
    6 : logging.INFO,
    7 : logging.DEBUG
}
SCRIPT_NAME = os.path.basename(__file__)
version = '1.0'
logFolder = safeFolderCreate(SCRIPT_PATH,"logs")
logName=os.path.basename(__file__).replace("py", "log")
logFilePath = os.path.join(logFolder,f"{logName}")
qidoFilePath = os.path.join(SCRIPT_PATH,"qido_wado")
logger = logging.getLogger(__name__)
formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
handler_main = logging.FileHandler(filename=logFilePath,mode='a')
handler_main.setFormatter(formatter)
logger.addHandler(handler_main)
hostname=socket.gethostname()
hostname=socket.gethostname()
JSON_PATH= os.path.join(SCRIPT_PATH,r'spt_params.json')

#%%
def ExecuteExe(actualCommand):
    timeoutexecmd=60*5
    cmdCommand = subprocess.Popen(actualCommand, stderr=subprocess.PIPE, stdout=subprocess.PIPE )
    try:
         o,e = cmdCommand.communicate(timeout=timeoutexecmd)
    except:
       try:
           cmdCommand.kill()
           print(f"kill process {cmdCommand.pid} tool : {actualCommand[0]}")
           logger.critical(f"kill process {cmdCommand.pid} tool : {actualCommand[0]}")
       except:
           logger.critical(f"dont able to kill process {cmdCommand.pid} tool : {actualCommand[0]}")
       return None,None
    if type(o) == bytes:
        decO = o.decode('utf-8')
    if type(e) == bytes:
        decE = e.decode('utf-8')  
    logger.info(f"ActualCommand: {actualCommand}")
    return decO,decE 

def install_modules(extra_modules_path=f"{SCRIPT_PATH}\extra_modules",requiredModulesFile=["Pillow","psutil","influxdb"]):
    """
    Function install nessasry module offline using whl only if moudles are missing.
    --------------------------------------------------------------------------
    To add package for offline install:
        1.Download package for offline isntall by cmd command: py -m pip download influxdb -d "c:/SPT/extra_modules/moduleName_whl"
        2.Add package name to requiredModulesFile list.
        3.Import package under this function or in another file.
    --------------------------------------------------------------------------
    """
    #run on file and take only moudle names
    #check if all
    freeze,error = ExecuteExe([sys.executable,'-m','pip','freeze'])
    freeze = freeze.replace("=="," == ")
    freeze = freeze.replace("\r\n"," \r\n ")
    for module in requiredModulesFile:
        if module not in freeze:
            modulePath = f"{extra_modules_path}\{module}_whl"
            installModules = os.listdir(modulePath)
            for installModule in installModules:
                pathModule=os.path.join(modulePath,installModule)
                try:
                    # Install module
                    installoutput,error =ExecuteExe([sys.executable,'-m','pip','install',pathModule])
                    if error:
                        logger.info(error)
                except:
                    logger.info("Failed to install {installModule}")

def installInfluxExtention():
    """
    To add module to install use: py -m pip download influxdb -d "c:/SPT/extra_modules/influx_extentions/moduleName_whl
    ------

    """
    isInfluxExtentionInstalled = True
    install_modules(extra_modules_path=f"{SCRIPT_PATH}\extra_modules\influx_extentions",requiredModulesFile=['selenium','chromedriver-autoinstaller'])
    
def createResultFolder(targetHost):
    folderResLst = ['Load','Store','Query']
    resPath = safeFolderCreate(SCRIPT_PATH,'results')
    hostResPath = safeFolderCreate(resPath,targetHost)
    for folder in folderResLst:
        safeFolderCreate(hostResPath,folder)
    return hostResPath

def loadParams():
    global Sleep_between_loads,TargetHostName,SiteRangeList,DB_USERNAME,TargetDBIP,DB_USER_PASSWORD,DB_LOGICAL_NAME,TimeToRun,FILES_OS,LOADINGMETHOD,influxhost,influxport,influxmode,MAX_STUDY_DB_UID,STUDY_ONLINE,INITIAL_STUDY_DB_UID,INITIAL_PATIENT_DB_UID,CSV_PARAMS,SleepTimeDict,defaultAE,LoadingUsers,YearlyProcs,WORKING_DAYS_YEARLY
    global WORKING_HOURS_PER_DAY,READS_PER_STUDY,TargetIP,Qido_User,QIDO_TEST,hostResultPath,loadResultPath,storeResultPath,queryResultPath
    global PARAMS
    
    if os.path.exists(JSON_PATH):
        with open(JSON_PATH) as file:
            PARAMS = json.load(file)   
        Sleep_between_loads=PARAMS['SleepTime']['Sleep_between_loads']
        TargetHostName = PARAMS['globalParams']['TargetHostName']
        DB_USERNAME	= PARAMS['DB']['DB_USERNAME']
        TargetDBIP = PARAMS['DB']['TargetDBIP']
        DB_USER_PASSWORD	= PARAMS['DB']['DB_USER_PASSWORD']
        DB_LOGICAL_NAME	= f"(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(Host={TargetDBIP})(Port=1521)))(CONNECT_DATA=(SID=mst1)))"
        logger.setLevel(logging.DEBUG)
        TimeToRun = PARAMS['globalParams']['TimeToRun']
        FILES_OS = {	'tool_query' : f"{os.environ['IMAGINET_ROOT']}utils\\tool_query.exe",
                        'study_dir'	:f"{SCRIPT_PATH}\\studies\\",
                        'tool_change_push':	f"{os.environ['IMAGINET_ROOT']}utils\\tool_change_push.exe",
                        'tool_load'	:	f"{os.environ['IMAGINET_ROOT']}loader\\exe\\tool_load.exe",
                        'WadoRS_tester'	:	f"{qidoFilePath}\\WadoRS_tester.py",
                        'tmp_dir'	:	f"{os.environ['TEMP']}",
                        'tool_verify' :	f"{os.environ['IMAGINET_ROOT']}utils\\tool_verify.exe",
                        'QidoRS_tester'  :  f"{qidoFilePath}\\QidoRS_tester.py"}
        LOADINGMETHOD=PARAMS["globalParams"]["LOADINGMETHOD"]
        influxhost = PARAMS['InfluxDb']['influxdb_host']
        influxport = PARAMS['InfluxDb']['influxdb_port']
        influxmode = PARAMS['InfluxDb']['influxmode']
    
        MAX_STUDY_DB_UID = PARAMS["globalParams"]["MAX_STUDY_DB_UID"]
        STUDY_ONLINE=PARAMS["globalParams"]["STUDY_ONLINE"]
        INITIAL_STUDY_DB_UID=PARAMS["globalParams"]["INITIAL_STUDY_DB_UID"]
        INITIAL_PATIENT_DB_UID=PARAMS["globalParams"]["INITIAL_PATIENT_DB_UID"]
        CSV_PARAMS=PARAMS["globalParams"]["CSV"]
        SiteRangeList = PARAMS["globalParams"]["SiteRange"] 
        
        SleepTimeDict = PARAMS["SleepTime"]
        defaultAE = TargetHostName + "FIR"
        LoadingUsers=PARAMS["globalParams"]["LoadingUsers"]
        YearlyProcs=PARAMS["globalParams"]["YearlyProcs"]
        WORKING_DAYS_YEARLY=PARAMS["globalParams"]["WORKING_DAYS_YEARLY"]
        WORKING_HOURS_PER_DAY=PARAMS["globalParams"]["WORKING_HOURS_PER_DAY"]
        READS_PER_STUDY=PARAMS["globalParams"]["READS_PER_STUDY"]
        TargetIP=PARAMS["globalParams"]["TargetIP"]

        #QIDO:
        Qido_User = PARAMS["Qido"]["QIDO_USER"]
        QIDO_TEST = PARAMS ["Qido"]["QIDO_TEST"]
        
        # Build folder tree:
        hostResultPath = createResultFolder(TargetHostName)
        loadResultPath=os.path.join(hostResultPath,'Load')
        storeResultPath=os.path.join(hostResultPath,'Store')
        queryResultPath=os.path.join(hostResultPath,'Query')
    else :
        print(f"{JSON_PATH} not exist ")
        exit()

loadParams()
# Install influx extention if influx is enabled
if(influxmode):
    installInfluxExtention()
    import grafana_dashboard
    from influxdb import InfluxDBClient
    import influxdb 
    import psutil   
    import webbrowser

#%%            
"""
install not default module 

"""
install_modules()

#%%


def init_logs(logName):
    logger.handlers.clear()
    logFilePath = os.path.join(logFolder,f"{logName}")
    formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    handler = logging.FileHandler(filename=logFilePath,mode='a')
    handler.setFormatter(formatter)
    logger.addHandler(handler)
    return logFilePath

def GetEndTime():
    if (TimeToRun):
        Timedelta = datetime.timedelta(minutes=TimeToRun)
        endtime = timenow + Timedelta
    return endtime

def GetSleepDuration(NumberOfYearlyProcs,WORKING_DAYS_YEARLY,WORKING_HOURS_PER_DAY,READS_PER_STUDY):
#     if(QIDO_DURATION_TIME > 0 ):
# 	    return QIDO_DURATION_TIME
#     else:
    return round((60 / (NumberOfYearlyProcs * 1000 / WORKING_DAYS_YEARLY / WORKING_HOURS_PER_DAY) * 60 / READS_PER_STUDY),2)

def getMaxStudyAndPatient():
    szSql = "select max(study_db_uid) from medistore.didb_studies"
    maxStudy=RunSQL(szSql)
    szSql = "select max(patient_db_uid) from medistore.didb_patients"
    maxPatient = RunSQL(szSql)
    return maxStudy,maxPatient
    

def HealthCheck(ip,CalledAe):
   # ping_test(ip)
    return Tool_verify_test(CalledAe)


def Tool_verify_test(CalledAe):
    Output,Error = cmdExecute(f"{FILES_OS['tool_verify']} -c {CalledAe}")
    if ("is responding" in Output):
        logger.info(f"Tool_verify_test {CalledAe} is  responding to DICOM verify")
        return True
    else:
        logger.critical(f"Tool_verify_test {CalledAe} is not responding to DICOM verify, please check target server ")
        print(f"Tool_verify_test {CalledAe} is not responding to DICOM verify, please check target server ")
        exit()


def ping_test(ip):
    Output,Error =cmdExecute(f"ping {ip}")
    if Error:
       logger.critical(f"command Error: {Error}") 
    logger.info(f"output command: {Output}")
    if "Request timed out." in Output or Error:
        messerr= " ping_test appears to be down or icmp packets are blocked by their server, exiting script!"
        logger.critical(messerr)
        raise Exception(messerr)
    else :
        logger.info(f"ping_test HealthCheck Host {ip} is alive")
        return True



def CreateCSV(filename,headers,row,dirpath=os.path.dirname(__file__)):
    CSVpath = os.path.join(dirpath, filename)
    sniffer = csv.Sniffer()
    logger.info(f"Create Csv - Create CSV Path : {CSVpath}")             
    with open(CSVpath,"a",newline='') as f:
        writer = csv.writer(f)
        if not (open(CSVpath).read(32)):
            writer.writerow(headers)
        writer.writerow(row)
        logger.info(f"Create Csv - append to Csv : {row}")   
          
def WriteFailureToCSV(filename,numOfHeaders,dirpath=os.path.dirname(__file__)):
    CSVpath = os.path.join(dirpath, filename)
    if(os.path.exists(filename)):
        with open(CSVpath,"a",newline='') as f:
            writer = csv.writer(f)
            if (open(CSVpath).read(32)):
                row =[]
                row.append(datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))
                for i in range(1,numOfHeaders):
                    row.append("Failed")
                writer.writerow(row)
                

                


       
def cmdExecute(actualCommand,appear=False,pid_flag=False):
    timeoutexecmd=60*10
    if appear:
        appear="k"
    else:
        appear="c" 
    logger.info(f"ActualCommand: {actualCommand}")
    
    cmdCommand = subprocess.Popen(f"cmd /{appear}" + actualCommand, shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE )
   # o,e = cmdCommand.communicate(timeout=timeoutexecmd)
    o,e = cmdCommand.communicate()
    #try:
    #     o,e = cmdCommand.communicate(timeout=timeoutexecmd)
  #  except subprocess.TimeoutExpired:
   #    print(f"kill process {cmdCommand.pid}")
    #   cmdCommand.kill()
     #  return 0,0
    if type(o) == bytes:
        decO = o.decode('utf-8')
    if type(e) == bytes:
        decE = e.decode('utf-8')  
    logger.info(f"ActualCommand: {actualCommand}")
    if pid_flag:
        pid = cmdCommand.pid 
        return decO,decE,pid
    return decO,decE

def connect_influxDB(influxhost,influxport):
    try:
        client = InfluxDBClient(host=influxhost, port=influxport)
        client.switch_database('telegraf')
        logger.info("connect_influxDB connected ")

    except Exception as err:
        logger.critical("connect_influxDB connect FAILED")
        logger.critical(f"connect_influxDB Error: \n {err}")
    return client
def CreateInfluxData(measurement,tags,fields):
     json_body = [
    {
        "measurement": measurement,
        "tags": tags,
        "fields": fields,
    }
    ]
   
def SendToInfluxDB(data):
    try:
        client = InfluxDBClient(host=influxhost, port=influxport)
        client.switch_database('telegraf')
        logger.info("connect_influxDB connected ")

    except Exception as err:
        logger.Warning("connect_influxDB connect FAILED")
        logger.info(f"connect_influxDB Error: \n {err}")
    if (type(client)==influxdb.client.InfluxDBClient):
        try:
            logger.info(f"SendToInfluxDB Send: {data}")
            client.write_points(data)
            logger.info("SendToInfluxDB Succeed!")

        except Exception as err:
            print(f"SendToInfluxDB FAILED: {data}")
            logger.warning(f"SendToInfluxDB FAILED:  {data}")
            logger.info(f"SendToInfluxDB Error: \n {err}")
    client.close()

def executeQuery(query):
    con = cx_Oracle.connect(DB_USERNAME, DB_USER_PASSWORD, DB_LOGICAL_NAME,encoding="UTF-8")
    cur = con.cursor()
    cur.execute(query)  #Example of query for execution: "SELECT series_instance_uid FROM medistore.didb_serieses_table WHERE rownum = 1"
    res = cur.fetchall()
    con.close() ###
    return res

def oracleConnect():
    con = cx_Oracle.connect(DB_USERNAME, DB_USER_PASSWORD, DB_LOGICAL_NAME,encoding="UTF-8")
    return con

def RunSQL(query,function=""):
    try:
        logger.info(f"RunSQL query: {query} ,function: {function}")
        con = cx_Oracle.connect(DB_USERNAME, DB_USER_PASSWORD, DB_LOGICAL_NAME,encoding="UTF-8")
        logger.info(f"RunSQL connected to {DB_LOGICAL_NAME}")
        cur = con.cursor()
    except:
        logging.ERROR("Error FAILED connect ORA DB")
        print("Error FAILED connect ORA DB")
        return None
    try:
        cur.execute(query)  # Example of query for execution: "SELECT series_instance_uid FROM medistore.didb_serieses_table WHERE rownum = 1"
        logger.info(f"RunSQL run query {query}")
    except cx_Oracle.DatabaseError as e:
        logging.ERROR("QUERY FAILED")
        return None
    res = cur.fetchall()
    logger.info(f"RunSQL result {res}")
    con.close
    if len(res)==1 and len(res[0])==1:
        res=res[0][0]
    return res

### Execute Queries ###
def getStudies():
    query = "SELECT series_instance_uid FROM medistore.didb_serieses_table WHERE rownum = 1"
    return executeQuery(query)

def storeStudies():
    query = "insert into ['tablename'] Values:[]  "  #add store query
    return executeQuery(query)

def queryStudies(query):
     return executeQuery(query)
######################

# %%
def getRandomStudy(sql,maxUid,minUid):
    randomStudyQuery = "SELECT study_db_uid FROM (SELECT /*+NOPARALLEL(didb_studies) */ study_db_uid FROM medistore.didb_studies WHERE STUDY_ONLINE={STUDY_ONLINE} and STUDY_DB_UID > {INITIAL_STUDY_DB_UID} $sMaxStudyDBUID ORDER BY dbms_random.value) WHERE rownum = 1"
    print(randomStudyQuery)
#%%
class ThreadWithReturnValue(Thread):
    def __init__(self, group=None, target=None, name=None,args=(), kwargs={}, Verbose=None):
        Thread.__init__(self, group, target, name, args, kwargs)
        self._return = None
    def run(self):
        if self._target is not None:
            self._return = self._target(*self._args,**self._kwargs)
    def join(self,*args):
        Thread.join(self, *args)
        return self._return
#%% logger 


        

    