#%%   
from Common_function import *
import argparse
import time
import os 
from time import sleep
from multiprocessing import Process, Pipe ,Manager 
from threading import Thread
import psutil

#%%
MonitorFilePath=os.path.join(loadResultPath,f"spt_load_monitor_{TargetHostName}_{hostname}.CSV")
CsvFilePath=os.path.join(loadResultPath,f"spt_load_result_{TargetHostName}_{hostname}.CSV")
plist=[]
pids=[]
TailPath = os.path.join(SCRIPT_PATH,MonitorFilePath)
flag_csv=CSV_PARAMS
dnow=datetime.datetime.now()
hourTimeToRun =round(TimeToRun/60,2)
calledAE=defaultAE
#%% 

def checkDBUID():
    """
    get max study_db_uid
    """
    szSql = "select max(study_db_uid) from medistore.didb_studies"
    return RunSQL(szSql,"checkDBUID")[0][0]


def initlogger():			
    SCRIPT_NAME = os.path.basename(__file__)
    LOG_FILE = f"spt_load_study_{TargetHostName}.log"
    logFilePath = os.path.join(logdFolder,f"{LOG_FILE}")
    handler = logging.FileHandler(filename=logFilePath,mode='a')
    handler.setFormatter(formatter)
    logger.addHandler(handler)
    
        
def calc_FirstImageTime_ImagesPerSecond(DataDict):
    NumberOfHeaders = DataDict['headers were loaded']
    if NumberOfHeaders == 0:
        logger.critical(f"Load failed!, {NumberOfHeaders} headers were loaded")
        print(f"Load failed!, {NumberOfHeaders} headers were loaded")
        return None,None
    TotalHeadersLoadTime=DataDict['Total headers load time is[seconds]']
    FirstHeaderLoadTime=DataDict['First header load time is[seconds]']
    NumberOfImages=DataDict['images were loaded']
    TotalLoadTime = DataDict['Total load time is[seconds]']
    FirstImageTimeOld = DataDict['First image time is[seconds]']
    ImagesPerSecondIncFirst = DataDict['images per second [with first image]']
    #if NumberOfImages=='0' and NumberOfHeaders=='0':
        #print("failed load")
    FirstImageTime = (FirstImageTimeOld - TotalHeadersLoadTime + FirstHeaderLoadTime)
    logger.info(f"{FirstImageTime} = ({FirstImageTimeOld} - {TotalHeadersLoadTime} + {FirstHeaderLoadTime}")
    
    if NumberOfImages == 1:
        ImagesPerSecond=ImagesPerSecondIncFirst
    else:
        ImagesPerSecond = (NumberOfImages/(TotalLoadTime - FirstImageTime))
    #ImagesPerSecond =DataDict['images per second [without first image]']
    logger.info(f"{ImagesPerSecond} = ({NumberOfImages}/({TotalLoadTime} - {FirstImageTime}))")
    logger.info(f"ImagesPerSecond : {ImagesPerSecond},FirstImageTime : {FirstImageTime}")
    return round(FirstImageTime,2),round(ImagesPerSecond,2)

    
def CreateMonitorfile(headerslist,datalist):
    CreateCSV(MonitorFilePath,headerslist,datalist)


def SendToCsv_load_result(DataDict,StudyModality):
    try:
        date = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        headerslist=["Date","Modality","FirstImageTime","ImagesPerSecond"]
        datalist=[date,StudyModality]
        FirstImageTime,ImagesPerSecond=calc_FirstImageTime_ImagesPerSecond(DataDict)
        if not FirstImageTime:
            return None
        datalist.append(FirstImageTime)
        datalist.append(ImagesPerSecond)
        CreateMonitorfile(headerslist,datalist)
        for key,value in DataDict.items():
            headerslist.append(key)
            datalist.append(value)
        CreateCSV(CsvFilePath,headerslist,datalist)
    except Exception as e:
        print(e)
        logger.error(f"SendToCsv_load_result error {e}\nData dict:\n{DataDict}") 
    return True


def SendToinflux_load_result(DataDict,StudyModality):
    try:
        FirstImageTime,ImagesPerSecond=calc_FirstImageTime_ImagesPerSecond(DataDict)
        if not FirstImageTime:
            return
        data_SPT_Load_Rate = [
            {
                "measurement": "SPT_Load_Rate",
                "tags": {
                    "target": f"{TargetHostName}",
                    "source":f"{hostname}"
                },
                "fields": {
                    f"{StudyModality}": ImagesPerSecond
                }
            }
        ]
        data_SPT_Load_TimeToFirst = [
            {
                "measurement": "SPT_Load_TimeToFirst",
                "tags": {
                    "target": f"{TargetHostName}",
                    "source":f"{hostname}"
                },
                "fields": {
                    f"{StudyModality}":FirstImageTime
                }
            }
        ]
        SendToInfluxDB(data_SPT_Load_Rate)
        SendToInfluxDB(data_SPT_Load_TimeToFirst)
    except:
        logger.error(f"SendToinflux_load_result error {DataDict} ")



def parser_tool_load(output):
    DataDict={}
    outlines = output.split("\r\n")
    for line in outlines:
        nr = re.findall("(\d+.\d+|-\d+|\d+)",line)
        if nr:
            listnu= re.findall("[a-zA-Z][a-z\sA-Z]+",line)
            if (len(listnu)==2):
               name,unit = listnu
               if unit=="Sending Delete request":
                   name=name
               else:
                   name= name + "[" + unit + "]"   
            else:
                name = listnu[0]
            DataDict[name]=float(nr[0])
    return DataDict

def run_tool_load(command):
    try:
        cp = " ".join(command)
        logger.info(f"spt_load_study command : {cp}")
        tick_start =  time.time()
        output,error = ExecuteExe(command)
        tick_end =  time.time()
        t=tick_end-tick_start
        if error:
            logger.error(f"Run_spt_load_study error spt_load_study_output: {output}")
        else:
            logger.info(f"Run_spt_load_study spt_load_study_output: \n {output} ")
        if "error" in output:
             logger.error(f"Run_spt_load_study spt_load_study_output contain error: \n {output} ")
        if output:     
            timer=tick_end-tick_start
            logger.info(f"Tool_Load.exe took {timer} seconds")
            if len(output)>0:
                DataDict = parser_tool_load(output)
            else :
                logger.info("Tool_Load.exe output empty")
                print("failed output is empty")   
            logger.info(f"Tool_Load.exe DataDict parser: {DataDict}")
            return DataDict,timer,output
        else:
            return None,None,None
    except Exception as e:
        logger.info(f"run_tool_load raise exception : {e} {output}")
        return None,None,None


def spt_load_study(command="",oneStudy=False):
    if command:
        command=command.split(" ")
        command[0]=f"{FILES_OS['tool_load']}"
        DataDict,timer,output=run_tool_load(command)
        if DataDict:
            FirstImageTime,ImagesPerSecond=calc_FirstImageTime_ImagesPerSecond(DataDict)
            return FirstImageTime,ImagesPerSecond 
    StudyInstanceUid,StudyModality = GetRandomStudySmallSite()
    if not (StudyInstanceUid):
        return None
    sleeptime = SleepTimeDict[StudyModality+"_SLEEP_TIME"]
    logger.info(f"Modality : {StudyModality} sleep time : {sleeptime}")
    if LOADINGMETHOD=="STEAMING":
       command = [f"{FILES_OS['tool_load']}",'-mpfl','-g','3','-v','-i','-c',f"{calledAE}",'-z',f"{StudyInstanceUid}",'-x','x','-y','x','-w',sleeptime]
       DataDict,timer,output=run_tool_load(command)
       if DataDict:
            if influxmode==True:
               SendToinflux_load_result(DataDict,StudyModality)
            check = SendToCsv_load_result(DataDict,StudyModality)
    elif LOADINGMETHOD=="FLOAD":
        #command = f"{FILES_OS['tool_load']} -mpfl -g 3 -v -i -c {calledAE} -z {StudyInstanceUid} -x x -y x"   
        command = [f"{FILES_OS['tool_load']}",'-mpfl','-g','3','-v','-i','-c',f"{calledAE}",'-z',f"{StudyInstanceUid}",'-x','x','-y','x']
        DataDict,timer,output=run_tool_load(command)
        if DataDict:
            if influxmode==True:
                SendToinflux_load_result(DataDict,StudyModality)
            check = SendToCsv_load_result(DataDict,StudyModality)
    #elif LOADINGMETHOD=="WADO pixel data":
    #    Command="py FILES_OS{'WadoRS_tester'} --args --called_ae $szCalledAe --username x --password x --ip $TargetIP --db_ip $TargetDBIP --test_plan_path \"\" --output_format cmd --export_response_output \"False\" --scenario \"pixel data\" \"\"  $szStudyInstanceUid";
    #elif LOADINGMETHOD=="WADO metadata": 
    #elif LOADINGMETHOD=="WADO CSV": 
    #elif LOADINGMETHOD=="WADO series":
    #print(f"check = {check}")
    if not oneStudy:
        sleep(sleeptime) 
    if not check:
        return None
    return DataDict

def SendEvent_finishloadusers():
    data_Event_influx = [
        {
            "measurement": "Events",
            "tags": {
                "target": f"{TargetHostName}"
            },
            "fields": {
                "title":"Finished loading all users" 
            }
        }
    ]
    SendToInfluxDB(data_Event_influx)
    
#create user       
def spt_load_tool(user_number = 0,LOGGER_LEVEL=logging.INFO,stdout = False):
    # if stdout:
    #     import builtins as __builtin__
    #     from functools import partial
    #     __builtin__.print = partial(print, flush=True)
    logFilePath= init_logs(f"spt_load_study_{TargetHostName}.log")
    logger.setLevel(LOGGER_LEVEL)
    logger.info(f"spt_load_tool {calledAE}")
    endtime=GetEndTime()
    nCurrLoad=1
    countFails=0
    checkFail2=0
    max_time_toExecute_load=60*1
    while(datetime.datetime.now()<endtime):
        try:
            time_now = datetime.datetime.now()
            check = spt_load_study()
            if not check:
                print("FIALED,***")
                countFails+=1
                WriteFailureToCSV(MonitorFilePath,4)
                WriteFailureToCSV(CsvFilePath,24)
            else:
                countFails=0
            if countFails==10:
                exit()
            logger.info(f"spt_load_tool{user_number} Study load command executed - Random Study Loaded - Load Number {nCurrLoad} ")
            nCurrLoad+=1
        except Exception as e:
            logger.error(f"exception : {e}")
            WriteFailureToCSV(MonitorFilePath,4)
            WriteFailureToCSV(CsvFilePath,24)
            checkFail2+=1
            if (checkFail2 == 10):
                print("spt_load_study failed")
                exit()


def GetRandomStudySmallSite():
    logger.info("GetRandomStudySmallSite Entered")
    MaxStudyDBUID=""
    if MAX_STUDY_DB_UID!=0:
        MaxStudyDBUID = f"and STUDY_DB_UID < {MAX_STUDY_DB_UID}"
    #Getting random study db uid and then get the study instance uid - this is faster because there is index on the column
    sql = f"SELECT study_db_uid FROM (SELECT /*+NOPARALLEL(didb_studies) */ study_db_uid FROM medistore.didb_studies WHERE STUDY_ONLINE={STUDY_ONLINE} and STUDY_DB_UID > {INITIAL_STUDY_DB_UID} {MaxStudyDBUID} ORDER BY dbms_random.value) WHERE rownum = 1"
    randomStudyDbUid = RunSQL(sql,"GetRandomStudySmallSite")
    logger.info(f"GetRandomStudySmallSite randomStudyDbUid {randomStudyDbUid}")
    sql = f"select study_instance_uid,study_modality from medistore.didb_studies where study_db_uid = {randomStudyDbUid}"
    queryResults = RunSQL(sql,"GetRandomStudySmallSite")
    if queryResults:
        studyInstanceUid = queryResults[0][0]
        studyModality = queryResults[0][1] 
        studyModality = re.findall('(CT|MR|US|CR|MG|DBT)',studyModality)[0]
        if not studyModality:
            Logger.info("GetModalityType Modality NOT Found - ERROR ")
        logger.info(f"GetRandomStudySmallSite studyInstanceUid {studyInstanceUid}")
#####find series_instance_uid######
    #szSql = "SELECT series_instance_uid FROM (SELECT series_instance_uid FROM medistore.didb_serieses_table WHERE study_instance_uid = '{zStudyInstanceUid}'  ORDER BY dbms_random.value) WHERE rownum = 1"
    #seriesUid = RunSQL(sql,"GetRandomSeries")
    #logger.info("query Results query Results series uid : {seriesUid}")
    if (studyInstanceUid):
        logger.info(f"GetRandomStudySmallSite Found matching study {studyInstanceUid}")
    else:
        logger.critical(f"GetRandomStudySmallSite No study_instance_uid for study_db_uid {randomStudyDbUid}")
       # exit()
    logger.info(f"GetRandomStudySmallSite Finished (studyInstanceUid={studyInstanceUid},studyModality={studyModality}).")    
    return studyInstanceUid,studyModality
      

def write_processid_file(pids):
    path_processid_file=os.path.join(f'{SCRIPT_PATH}\pids',"processID_user_load.txt")
    with open(path_processid_file,"w") as f:
            f.writelines(",".join([str(i) for i in pids]))     
     
        
def addStudyTask(dict_share,user) :
     p=Process(target=spt_load_tool,args=(dict_share,user))
     p.start()
     pids.append(p.pid)
     
     
def CreateConnectionFile():
    conFileData =["cfg_type=synced_file",
    "xml_file=tool_load.bin",
    f"url=jdbc:oracle:thin:@{TargetIP}:1521:mst1",
    "user=cfg",
    "remote_server_port=2104",
    f"host_mapping={TargetIP}:{TargetIP}",
    "remote_server_port_ssl=22104",
    f"remote_server_name={TargetIP}"]
    con_file_location=os.path.join(FILES_OS['tmp_dir'], f"confile_{TargetHostName}.txt")
    with open(con_file_location,'w') as f:
        for row in conFileData: 
            f.write(row+'\n')
    os.environ["IMAGINET_CFG_FILE"] = con_file_location
    
    
def runOneLoad():
    res_load = spt_load_study("",True)
    print("spt_load_study result:")
    if res_load:
        for key,value in res_load.items():
            print(f"{key} : {value}")          
        FirstImageTime,ImagesPerSecond = calc_FirstImageTime_ImagesPerSecond(res_load)
        print(f"FirstImageTime : {FirstImageTime}")
        print(f"ImagesPerSecond : {ImagesPerSecond}")
            
            
def MonitorLoad():
    endtime=GetEndTime() 
    monitor_deltatime=180
    checkNum=0
    while (datetime.datetime.now()<endtime):
        logger.info("monitor")
        if (not HealthCheck(TargetDBIP,calledAE)):
            checkNum+=1
            if(checkNum==5):
                print("exit program healcheck failed 5 times")
                for p in plist:
                    p.terminate()
                exit()
        else:
            checkNum=0
        cpu_usage=psutil.cpu_percent()
        if cpu_usage>=95:
            print(f"{cpu_usage}%+♣ cpu usage!!!!!!!!!")
            logger.critical(f"{cpu_usage}% cpu usage!!!!!!!!!")
        memory_usage=dict(psutil.virtual_memory()._asdict())['percent']
        if memory_usage>=95:
            print(f"{memory_usage}% memory usage!!!!!!!!!")
            logger.critical(f"{memory_usage}%+♣ memory usage!!!!!!!!!")
        sleep(monitor_deltatime)
     
#%%
if __name__ == '__main__':
    CreateConnectionFile()
    logFilePath = init_logs(f"spt_load_study_{TargetHostName}.log")
    logger.critical("====================================== running run_load.py ======================================")
    print("====================================== running run_load.py ======================================")
    allowlogs=[i for i in range(1,8)]
    parser = argparse.ArgumentParser(description='Philips Algotec SPT_runLoad')
    parser.add_argument('--c', '-called_ae', required=False,default=defaultAE,type=str, help="called_AE - hostnameFIR")
    parser.add_argument('--l', '-log_level', required=False, type=int,choices=allowlogs, help="logger level",default=5)
    parser.add_argument('--u','-users',required=False,type=int,default=LoadingUsers,help='number of users')
    parser.add_argument('--tl','-test_spt_load_study',required=False,action="store_true",default=False,help='run spt_load_study')
    parser.add_argument('--command','-run_load_tool',required=False,type=str,default=False,help='run spt_load_study')
    parser.add_argument('--stdout','-stdout',required=False,action="store_true",default=False,help='')

    args = parser.parse_args()
    calledAE = args.c
    users = args.u
    LOGGER_LEVEL = logDict[args.l]
    logger.setLevel(LOGGER_LEVEL)
    print(f"Logging level: {logger}")
    logger.info(f"Logging level: {LOGGER_LEVEL}")
    HealthCheck(TargetDBIP,calledAE)
    maxStudy,maxPatient=getMaxStudyAndPatient()
    if maxStudy==INITIAL_STUDY_DB_UID or maxPatient==INITIAL_PATIENT_DB_UID:
      print("No studies to load please first store study or change the init study\patient uid")
      logger.critical("No studies to load please first store study or change the init study\patient uid")
      exit()
      
    if args.command:
        x,y=spt_load_study(args.command)      
        print(x,y)
        sys.exit()
    if args.tl:
        runOneLoad()
        sys.exit()
    pids.append(os.getpid())
    print(f"start time: {dnow}")
    print(f"TimeToRun: {hourTimeToRun} Hours")
    print(f"start upload users (Sleep_between_loads: {Sleep_between_loads} [sec])")
    for user in range(users+1):
        p=Process(target=spt_load_tool,args=(user,LOGGER_LEVEL,args.stdout))
        p.start()
        pids.append(p.pid)
        plist.append(p)
        print(f"user {user}")
        if flag_csv and os.path.exists(TailPath):
            thread = Thread(target=cmdExecute,args=(f"start tail -f {TailPath}",True))
            thread.start()
            flag_csv=False
        write_processid_file(pids)
        time.sleep(Sleep_between_loads)
    print("RunLoad Finished loading all users")
    logger.info("RunLoad Finished loading all users")
    if(influxmode):
        dEvent_finishloadusers()
    write_processid_file(pids)
    MonitorLoad()
    for p in plist: 
        p.join()
    print("====================================== runload finish ====================================== ")
	


