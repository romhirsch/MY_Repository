# -*- coding: utf-8 -*-
"""
Created on Sun Jun 27 14:54:43 2021

@author: Administrator
"""
#%%
from Common_function import *
import argparse
import time
from multiprocessing import Process
from time import sleep
import datetime

CsvFilePath=os.path.join(queryResultPath,f"spt_query_result_{TargetHostName}_{hostname}.CSV") 
def SendToinflux_query_result(QueryType,QueryTime):
    data_SPT_Query_Rate = [
        {
            "measurement": "SPT_Query_ResponseTime",
            "tags": {
                "target": f"{TargetHostName}",
                "source":f"{hostname}"
            },
            "fields": {
                f"{QueryType}": float(QueryTime)
            }
        }
    ]
    SendToInfluxDB(data_SPT_Query_Rate)

def threadCheck(endtime):
    while(datetime.datetime.now()<endtime):
        if (not HealthCheck(TargetDBIP,calledAE)):
            checkNum+=1
            if(checkNum==5):
                print("exit program healcheck failed 5 times")
                sys.exit()
        sleep(30)
    
def test(calledAE,QueryType):
    
    SPT_TOOL_QUERY = f'{os.getenv("temp")}/spt_tool_query{datetime.datetime.now().second}{randrange(100)}.txt'
    successPattern = "------------------------------------------\r\nNumber of elements: [0-9]+"
    logger.debug(f'SPT_QUERY_RUN:\nQuery type = {QueryType}')
    command=""
    #Qido
    qidoLimit = 0
    qidoRandomStudyDbUid = "\"\""
    qidoIncludeField = "\"\""
    qidoRandomSeries = "\"\""
    QUERY_QIDO = "\"\""
    QIDO_USER = "x"
    
    if(QueryType == 1):     # Common modality
        BuildTagNameCommonQuery(SPT_TOOL_QUERY)
        queryLevel = 'STUDY'
        qidoQueryLevel = 'studies'
        
    elif(QueryType == 2):   # Patients Priors
        BuildTagNamePatientsPrior(SPT_TOOL_QUERY)
        queryLevel = 'STUDY'
        qidoQueryLevel = 'studies'
        
    elif(QueryType == 3):   # Explore Study
        BuildTagNameExploreStudy(SPT_TOOL_QUERY)
        queryLevel = 'SERIES'
        qidoQueryLevel = 'series'
    # Qido\Wado scenario:
    elif(QueryType == 4):
        # study limit 10-500
        qidoLimit = 10+randrange(490)
        qidoQueryLevel = 'studies'
        
    elif(QueryType == 5):
        # study limit 10-500
        qidoLimit = 10+randrange(490)
        qidoQueryLevel = 'series'
        
    elif(QueryType == 6):
        # study limit 10-500
        qidoLimit = 10+randrange(490)
        qidoQueryLevel = 'instances'
    elif(QueryType == 7):
        # study limit 10-500
        qidoLimit = 10+randrange(490)
        qidoQueryLevel = 'patients'
    elif(QueryType == 8):
        # series
        QidoGetRandomStudyandSeries(QueryType)
        qidoQueryLevel = 'series'
    elif(QueryType == 9):
        QidoGetRandomStudyandSeries(QueryType)
        qidoQueryLevel = 'instances'
    elif(QueryType == 10):
        # study+modality
        BuildTagNamePatientsPrior(SPT_TOOL_QUERY)
        qidoQueryLevel = 'patients'
    elif(QueryType == 11):
        #  Study with additional field
        BuildTagNameCommonQuery(SPT_TOOL_QUERY)
        qidoQueryLevel = 'studies'
    command = [sys.executable,f"{FILES_OS['QidoRS_tester']}",
     '--args',
     '--called_ae', 
     f'{calledAE}',
     '--username',
     f'{Qido_User}',
     '--password',
     'x',
     '--ip',
     f'{TargetIP}',
     '--db_ip',
     f'{TargetDBIP}',
     '--auth_method',
     'basic',
     '--id_token',
     '""',
     '',
     '--test_plan_path',
     '""',
     '--output_format',
     'cmd',
     '--export_response_output',
     '"False"',
     '--scenario',
     f'0',
     'json',
     f'{qidoQueryLevel}',
     f'{qidoRandomStudyDbUid}',
     f'{qidoRandomSeries}',
     f'{qidoIncludeField}',
     f'{QUERY_QIDO}']
    output,error = ExecuteExe(command)
    return command,output,error
def SendToCsv_query_result(QueryType,QueryTime):
    try:
        date = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        headerslist=["Date","QueryType","QueryTime"]
        datalist=[date,QueryType,QueryTime]
        CreateCSV(CsvFilePath,headerslist,datalist)
    except:
        logger.error("SendToCsv_query_result error")

def parser_tool_qidoQuery(output):
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

def GetQueryType():
    nRandom=randrange(10)
    hour = datetime.datetime.now().hour
    minute = datetime.datetime.now().minute
    secound = datetime.datetime.now().second
    if(nRandom%3==0):
        nQueryType=1    # Common modality
    elif(nRandom%2==0):
        nQueryType=2    # Patients Priors
    else:
        nQueryType=3    # Explore Study
    # TODO: add qido\wado nQueryType
    return nQueryType

def GetRandomStudy(): #check
    sql = f"SELECT study_db_uid FROM (SELECT /*+NOPARALLEL(didb_studies) */ study_db_uid FROM medistore.didb_studies WHERE STUDY_ONLINE={STUDY_ONLINE} and STUDY_DB_UID >{INITIAL_STUDY_DB_UID} {sMaxStudyDBUID} ORDER BY dbms_random.value) WHERE rownum = 1"
    nRandomStudyDbUid = RunSQL(sql)
    return nRandomStudyDbUid

def GetRandomStudySmallSite():
    sql = f"SELECT study_db_uid FROM (SELECT /*+NOPARALLEL(didb_studies) */ study_db_uid FROM medistore.didb_studies WHERE STUDY_DB_UID > {INITIAL_STUDY_DB_UID} AND STUDY_ONLINE='Y' ORDER BY dbms_random.value) WHERE rownum = 1" 
    nRandomStudyDbUid = RunSQL(sql)
    sql = f"select study_instance_uid from medistore.didb_studies where study_db_uid = {nRandomStudyDbUid}"
    StudyInstanceUid = RunSQL(sql)
    if(StudyInstanceUid):
        logger.info(f"GetRandomStudySmallSite Found matching study {StudyInstanceUid}")
    else:
        logger.info(f"GetRandomStudySmallSite No study_instance_uid for study_db_uid {nRandomStudyDbUid}")
    return StudyInstanceUid
    
def GetRandomPatientSmallSite():
    patientfound = 0    
    # Getting random patient db uid and then get the patient instance uid - this is faster because there is index on the column
    sql = f"SELECT patient_db_uid FROM (SELECT patient_db_uid FROM medistore.didb_patients WHERE  PATIENT_DB_UID > {INITIAL_PATIENT_DB_UID} AND NUMBER_OF_PATIENT_STUDIES > 0 ORDER BY dbms_random.value) WHERE rownum = 1"
    nRandomPatientDbUid = RunSQL(sql)
    sql = f"select FALLBACK_PID from medistore.didb_patients_view where patient_db_uid = {nRandomPatientDbUid}"
    patientId = RunSQL(sql)
    if(patientId):
        logger.info(f'GetRandomPatientSmallSite: Found matching patient {patientId}')
    else:
        logger.info(f'GetRandomPatientSmallSite: No patient_id for patient_db_uid {nRandomPatientDbUid}')
    logger.debug(f'GetRandomPatientSmallSite: Finished (PatientId={patientId}).');
    return patientId 
    
def BuildTagNameCommonQuery(SPT_TOOL_QUERY):
    # Building date string represent 3 days ago
    date_now = datetime.datetime.now()
    delta_date = (date_now - datetime.timedelta(days = 3)).strftime("%Y-%m-%d")
    delta_date = delta_date.replace("-", "")
    # Building the query string with DATE�STATUS ��� MODALITY tags
    query = f"STUDY_DATE {delta_date}-\nTAMAR_STUDY_STATUS UNREAD\nMODALITIES_IN_STUDY CR"
    # Get common modality used by this site   
    modality = ['CR','CT','MR','US']
    nRandom=randrange(3)
    randmod = modality[nRandom]
    QUERY_QIDO = f"MODALITY={randmod}"
    logger.debug(f"BuildTagNameCommonQuery: QueryQido {query}")
    logger.debug(f"BuildTagNameCommonQuery: Query {query}")
    logger.debug("BuildTagNameCommonQuery: Opening {} for writing...")
    try:
        with open(SPT_TOOL_QUERY, 'w') as f:
            f.write(query)
    except:
        logger.critical(f"BuildTagNameCommonQuery: Error opening {SPT_TOOL_QUERY} for writing, aborting!")   
        sys.exit(1)
    modality = ['CR','CT','MR','US']
    randnum = randrange(3)
    randmod = modality[randnum]
    QUERY_QIDO = f"MODALITY={randmod}";
    logger.debug(f'BuildTagNameCommonQuery: QueryQido: {query}')
    logger.debug(f'BuildTagNameCommonQuery: Query: {query}')
    logger.debug(f'BuildTagNameCommonQuery: Opening $SPT_TOOL_QUERY for writing...')
    try:
        with open(SPT_TOOL_QUERY,'w') as f:
            f.write(query)
    except:
            logger.critical(f'BuildTagNameCommonQuery: Errors opening {SPT_TOOL_QUERY} for writing, aborting!')
            sys.exit(1)

def BuildTagNamePatientsPrior(SPT_TOOL_QUERY):
    # Get random patient 
    patientId = GetRandomPatientSmallSite()
    query = f"PATIENT_ID {patientId}"
    QUERY_QIDO = f"PATIENT_ID={patientId}"
    logger.debug(f"BuildTagNamePatientsPrior: Query: {query}")
    logger.debug(f"BuildTagNamePatientsPrior: Opening {SPT_TOOL_QUERY} for writing...")
    try:
        with open(SPT_TOOL_QUERY,'w') as f:
            f.write(query)
    except:
        logger.critical(f"BuildTagNamePatientsPrior: Errors opening {SPT_TOOL_QUERY} for writing, aborting!")
        sys.exit(1)
    logger.debug("BuildTagNamePatientsPrior: finished.")
    
def BuildTagNameExploreStudy(SPT_TOOL_QUERY):
    studyInstanceUid = GetRandomStudySmallSite()
    if re.search("([0-9]+\.){9}[0-9]",studyInstanceUid):
        query = f"STUDY_INSTANCE_UID {studyInstanceUid}"
        QUERY_QIDO = f"STUDY_INSTANCE_UID={studyInstanceUid}"
    else:
        logger.info(f'BuildTagNameExploreStudy: STUDY_INSTANCE_UID is not vaild, aborting')	
        sys.exit(1)
    
    logger.debug(f"BuildTagNameExploreStudy: Query: {query}")	
    logger.debug(f"BuildTagNameExploreStudy: Opening {SPT_TOOL_QUERY} for writing...")
    try:
        with open(SPT_TOOL_QUERY,'w') as f:
            f.write(query)
    except:
        logger.critical(f"BuildTagNameExploreStudy: Errors opening {SPT_TOOL_QUERY} for writing, aborting!")
        sys.exit(1)
    logger.debug("BuildTagNameExploreStudy: Finihsed.")

#QIDO:
def QidoGetRandomStudyandSeries(QueryType):
    # Add support for max study_db_uid
    sMaxStudyDBUID = ""
    if MAX_STUDY_DB_UID:
        sMaxStudyDBUID = f"and STUDY_DB_UID < {MAX_STUDY_DB_UID}"
    # Getting random study db uid and then get the study instance uid - this is faster because there is index on the column
    sql = f"SELECT study_db_uid FROM (SELECT /*+NOPARALLEL(didb_studies) */ study_db_uid FROM medistore.didb_studies WHERE STUDY_ONLINE={STUDY_ONLINE} and STUDY_DB_UID > {INITIAL_STUDY_DB_UID} {sMaxStudyDBUID} ORDER BY dbms_random.value) WHERE rownum = 1"
    nRandomStudyDbUid = RunSQL(sql)
    sql = f"select study_instance_uid,study_modality from medistore.didb_studies where study_db_uid = {nRandomStudyDbUid}"
    studyInstanceUid = RunSQL(sql)[0][0]
    sql = f"SELECT series_instance_uid FROM (SELECT series_instance_uid FROM medistore.didb_serieses_table WHERE study_instance_uid = '{studyInstanceUid}'  ORDER BY dbms_random.value) WHERE rownum = 1"
    queryResults = RunSQL(sql)[0][0]
    seriesUid = queryResults[0]
    logger.debug(f'query Results: query Results series uid : {queryResults}')
    if(QueryType == 9):
        QidoRandomSeries = seriesUid
    return nRandomStudyDbUid,studyInstanceUid,seriesUid

def BuildTagNamePatientsPrior(SPT_TOOL_QUERY):
    patientId = GetRandomPatientSmallSite()
    query = f"PATIENT_ID {patientId}"
    QUERY_QIDO = "PATIENT_ID={patientId}"
    logger.debug(f"BuildTagNamePatientsPrior: Query:{query}")
    logger.debug(f"BuildTagNamePatientsPrior: Opening {SPT_TOOL_QUERY} for writing...")
    try:
        with open(SPT_TOOL_QUERY,'w') as f:
            f.write(query)
    except:
        logger.critical(f"BuildTagNamePatientsPrior: Errors opening {SPT_TOOL_QUERY} for writing, aborting!")
        sys.exit(1)
    logger.debug("BuildTagNamePatientsPrior: Finihsed.")
    
def spt_query_run(calledAE,QueryType):
    SPT_TOOL_QUERY = f'{os.getenv("temp")}/spt_tool_query{datetime.datetime.now().second}{randrange(100)}.txt'
    successPattern = "------------------------------------------\r\nNumber of elements: [0-9]+"
    logger.debug(f'SPT_QUERY_RUN:\nQuery type = {QueryType}')
    command=""
    #Qido
    qidoLimit = 0
    qidoRandomStudyDbUid = "\"\""
    qidoIncludeField = "\"\""
    qidoRandomSeries = "\"\""
    QUERY_QIDO = "\"\""
    QIDO_USER = "administrator"
    
    if(QueryType == 1):     # Common modality
        BuildTagNameCommonQuery(SPT_TOOL_QUERY)
        queryLevel = 'STUDY'
        qidoQueryLevel = 'studies'
        
    elif(QueryType == 2):   # Patients Priors
        BuildTagNamePatientsPrior(SPT_TOOL_QUERY)
        queryLevel = 'STUDY'
        qidoQueryLevel = 'studies'
        
    elif(QueryType == 3):   # Explore Study
        BuildTagNameExploreStudy(SPT_TOOL_QUERY)
        queryLevel = 'SERIES'
        qidoQueryLevel = 'series'
    # Qido\Wado scenario:
    elif(QueryType == 4):
        # study limit 10-500
        qidoLimit = 10+randrange(490)
        qidoQueryLevel = 'studies'
        
    elif(QueryType == 5):
        # study limit 10-500
        qidoLimit = 10+randrange(490)
        qidoQueryLevel = 'series'
        
    elif(QueryType == 6):
        # study limit 10-500
        qidoLimit = 10+randrange(490)
        qidoQueryLevel = 'instances'
    elif(QueryType == 7):
        # study limit 10-500
        qidoLimit = 10+randrange(490)
        qidoQueryLevel = 'patients'
    elif(QueryType == 8):
        # series
        QidoGetRandomStudyandSeries(QueryType)
        qidoQueryLevel = 'series'
    elif(QueryType == 9):
        QidoGetRandomStudyandSeries(QueryType)
        qidoQueryLevel = 'instances'
    elif(QueryType == 10):
        # study+modality
        BuildTagNamePatientsPrior(SPT_TOOL_QUERY)
        qidoQueryLevel = 'patients'
    elif(QueryType == 11):
        #  Study with additional field
        BuildTagNameCommonQuery(SPT_TOOL_QUERY)
        qidoQueryLevel = 'studies'
        
    if QIDO_TEST:
        command = [sys.executable,"{FILES_OS['QidoRS_tester']}",
 '--args',
 '--called_ae', 
 f'{defaultAE}',
 '--username',
 f'{Qido_User}',
 '--password',
 'x',
 '--ip',
 f'{TargetIP}',
 '--db_ip',
 f'{TargetDBIP}',
 '--auth_method',
 'basic',
 '--id_token',
 '""',
 '',
 '--test_plan_path',
 '""',
 '--output_format',
 'cmd',
 '--export_response_output',
 '"False"',
 '--scenario',
 f'{qidoLimit}',
 'json',
 f'{qidoQueryLevel}',
 f'{qidoRandomStudyDbUid}',
 f'{qidoRandomSeries}',
 f'{qidoIncludeField}',
 f'{QUERY_QIDO}']
        logger.debug(f'Qido command: {command}')
        
    else:
        # output = {QueryType, Time in sec}
        command = [FILES_OS['tool_query'],"-c",calledAE,"-l",queryLevel,"-t",SPT_TOOL_QUERY]
    logger.debug(f'command: {command}')    
    tick_start =  time.time() # Get current tick count and execute tool query   
    #QIDO fillter
    if QIDO_TEST:
        #run command
        output,error = ExecuteExe(command) 
        logger.info(f'Main: output = {output}')
        # TODO: IMPORTANT!!! -> Missing lines 224-294 in perl query_run script
        #
        #
        
    else:
        output,error = ExecuteExe(command)
    # if "fail" in output:
    #     return
    tick_end =  time.time()
    queryTime=round(tick_end-tick_start,2)
    logger.debug(f"Query took {queryTime} sec")
    os.remove(SPT_TOOL_QUERY)
    if(not re.search(successPattern,output)):
         logger.debug(f"Query Failed!")
         WriteFailureToCSV(CsvFilePath,3)
         return "Query Failed!"
    else:
        logger.debug(f"Query Results: {QueryType}, {queryTime}")
        #send performance results to influx db
        if(isinstance(QueryType,int)) and (isinstance(queryTime,float)):
            SendToCsv_query_result(QueryType, queryTime)
            if influxmode:
                SendToinflux_query_result(QueryType,queryTime)
                logger.info("sending results to influx...")
        else:   # Query failed!
            logger.info("Query failed!")
            logger.critical(f"Type or time error, res = ({QueryType,queryTime})")
            WriteFailureToCSV(CsvFilePath,3)
        return QueryType,queryTime,output

def write_processid_file(pid):
    path_processid_file=os.path.join(f'{SCRIPT_PATH}\\pids',"processID_user_query.txt")
    with open(path_processid_file,"w") as f:
        f.write(str(pid))
            
def runOneQuery():
    QueryType = GetQueryType() #generate query type
    res = spt_query_run(defaultAE,QueryType)
    if(not isinstance(res[0],int)) or (not isinstance(res[1],float)):
        print("Query failed!")
        logger.critical(f"Type or time error, res = {res}")

    else:
        print(f"Query result:\nType: {res[0]}\nTime: {res[1]}")
    sys.exit()
  #%%      
if __name__ == '__main__':
    write_processid_file(os.getpid())
    CurrQuery	= 1
    logFilePath = init_logs(f"spt_query_tool_{TargetHostName}.log")
    logger.critical("====================================== running spt_query_tool.py ======================================")
    print("====================================== spt_query_tool.py ======================================")
    allowlogs=[i for i in range(1,8)]
    #################args##################################
    parser = argparse.ArgumentParser(description='Philips Algotec SPT_query_tool')
    parser.add_argument('--c', '-called_ae', required=False,default=defaultAE,type=str, help="called_AE - hostnameFIR")
    parser.add_argument('--l', '-log_level', required=False, type=int,choices=allowlogs, help="logger level",default=5)
    parser.add_argument('--q','-query_type',required=False,type=int,help='specify query type')
    parser.add_argument('--tl','-test_spt_query_study',required=False,action="store_true",default=False,help='run spt_query_study')
    args = parser.parse_args()
    calledAE = args.c
    LOGGER_LEVEL = logDict[args.l]  
    logger.setLevel(LOGGER_LEVEL)    
    logger.info(f"Logging level: {LOGGER_LEVEL}")
    SleepDuration = GetSleepDuration(YearlyProcs,WORKING_DAYS_YEARLY,WORKING_HOURS_PER_DAY,READS_PER_STUDY);
    print(f"Sleep duration: {SleepDuration}")
    logger.info(f"Sleep duration: {SleepDuration}")
    HealthCheck(TargetDBIP,calledAE)
    maxStudy,maxPatient = getMaxStudyAndPatient()
    if maxStudy==INITIAL_STUDY_DB_UID or maxPatient==INITIAL_PATIENT_DB_UID:
      print("No studies to load please first store study or change the init study\patient uid")
      logger.critical("No studies to load please first store study or change the init study\patient uid")
      exit()
    if args.tl:
        runOneQuery()
    
    flag_csv=CSV_PARAMS
    endtime=GetEndTime()
    TailPath = os.path.join(SCRIPT_PATH,CsvFilePath)
    while (datetime.datetime.now()<endtime):
        tick_start =  time.time() # Get current tick count and execute tool query   
        if os.path.exists(TailPath) and flag_csv:
            flag_csv=False
            t = Thread(target=cmdExecute,args=(f"start tail -f {TailPath}",True))
            t.start()    
        if args.q:
            QueryType = arg.q
        else:
            QueryType = GetQueryType() #generate query type

        p = Thread(target=spt_query_run,args=(calledAE,QueryType))
        p.start() 
        print(f"Next query command executed - QueryType = {QueryType}, Query Number = {CurrQuery}")
        logger.info(f"Next query command executed - QueryType = {QueryType}, Query Number = {CurrQuery}");
        logger.info("Sleep Duration : {SleepDuration} seconds, NOW sleeping...")
        tick_end =  time.time()
        queryTime=round(tick_end-tick_start,2)
        sleep(SleepDuration)
        #sleep(int(SleepDuration))
        tick_end =  time.time()
        queryTime=round(tick_end-tick_start,2)
        logger.info(f"finishTime={queryTime}")
        CurrQuery += 1

