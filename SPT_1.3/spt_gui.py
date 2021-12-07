# -*- coding: utf-8 -*-
"""
Created on Sun May 30 10:45:16 2021

@author: Administrator
Version: 1.3 (store MG,DBT studies added, zip results added).
"""

#%%
from Common_function import *
from export_CSV_influx import csvToInflux,readInfluxMangaeDataRows,INFLUX_MANAGEDATA_FILE
from PIL import Image as PIL_Image
from PIL import ImageTk
from tkinter import *
from tkinter import ttk
from tkinter import messagebox
from tkinter import filedialog as fd
from zipfile import ZipFile
from time import sleep 
import re, os
import threading
import shutil
#from tkFileDialog import askdirectory, askopenfilename

APP_BACKGROUND_COLOR='white'
cmdPid=[]
influx_function_flag = False
plot_pane_flag = False
config_window_opened = None
#%%

from winreg import *
def CheckIFNopadplusExits():
    key_to_read = r'SOFTWARE\Wow6432Node\Notepad++'
    key_to_read2 = r'SOFTWARE\Notepad++'
    try:
        reg = ConnectRegistry(None, HKEY_LOCAL_MACHINE)
        k = OpenKey(reg, key_to_read)
        return True     
    except:
        try:
            reg = ConnectRegistry(None, HKEY_LOCAL_MACHINE)
            k = OpenKey(reg, key_to_read2)
            return True   
        except:
            logger.warning("notepad++ not exits")
            return False
            
    

#%%

# TODO: 
    # Fix cmdKill
    # Continue graph btn
    # 

def zipFilesInDir(dirName, zipFileName):
    # create a ZipFile object
    with ZipFile(zipFileName, 'w') as zipObj:
        # Iterate over all the files in directory
        for root, folders, filenames in os.walk(dirName):
            for filename in filenames:
                # create complete filepath of file in directory
                filePath = os.path.join(root, filename)
                # Add file to zip
                zipObj.write(filePath, os.path.basename(filePath))
                os.remove(filePath)

    
    
def zipResults(app):
    resultsPath = os.path.join(SCRIPT_PATH,'results')
    res_bck = safeFolderCreate(resultsPath,f"results_backup")
    date = datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    filename = os.path.join(res_bck,f"{TargetHostName}_{date}.zip")    
    zipFilesInDir(hostResultPath,filename)
    messagebox.showwarning(title="Zip file created", message=f"Zip file created successfully.\nFile:\n{filename}\nlocate in:\n{res_bck}.",parent=app)  

def runFuncByThread(target, *args):
    t = threading.Thread(target=target, args=args)
    t.start()

def exportConfiguration(window):
    export_dir = os.path.join(SCRIPT_PATH,r'exported_configurations')
    export_host_dir = os.path.join(export_dir,f'{TargetHostName}')
    try:
        os.mkdir(export_host_dir)
    except:
        print(f"{export_host_dir}\ndir already exist")
    hostname,error = ExecuteExe("hostname")
    hostname = str(hostname)
    hostname = hostname.replace(" ","")
    hostname = hostname.replace("\r\n","")
    print(hostname)
    exportFile = fd.asksaveasfilename(title="Save configuration file",
                                        filetypes=[("Json File", "*.json")],
                                        initialfile=hostname,
                                        confirmoverwrite=True,
                                        initialdir=export_host_dir,
                                        parent=window)
    
    if(exportFile): 
        print(exportFile)
        shutil.copy2(JSON_PATH,f"{exportFile}.json")
    #app.iconify()

def importConfiguration(window,params_uiElement_dict):
    export_dir = os.path.join(SCRIPT_PATH,r'exported_configurations')
    importFile = fd.askopenfilename(title="Select configuration file",filetypes=[("Json File", "*.json")],
                                        initialdir=export_dir,
                                        parent=window)
    try:
        print(f"imported file:{importFile}")
        with open(importFile) as file:
            updated_params = json.load(file)
    except:
        print(f"imported file:{importFile}\nUnable to open file")
    for title in params_uiElement_dict.keys():
        for k in params_uiElement_dict[title].keys():
            try:
                updateConfigRow(params_uiElement_dict[title][k],updated_params[title][k])
            except Exception as e:
                print(f"Upadte {k} failed!, {e}\nFile has miss match type value")
    
def openGrafanaDashboard():
    try:
        grafana_dashboard.graphanaDashboardDisplay()
    except Exception as e:
        msg = f"Grafana dashboard display failed!\t error:{e}"
        print(msg)
    
def bulidChronografQuery(query):
    query = query.replace("\r\n","")
    query = query.replace(" ", "%20")
    query = query.replace(",", "%2C")
    query = query.replace("'", "%27")
    query = query.replace("=", "%3D")
    query = query.replace(":", "%3A")
    query = query.replace("\"", "%22")
    query = query.replace(">", "%3E")
    return query

def openChronografWebpath(operationType):
    # TODO: Finish all operations queries
    baseUrl = "http://10.2.21.150:8888"
    if(operationType == 'load'):
        querys = ["",""]
    elif(operationType == 'store'):
        querys = ["",""]
    elif(operationType == 'query'):
        hostname,error = ExecuteExe("hostname")
        querys = [bulidChronografQuery(f"SELECT \"1\", \"10\", \"11\", \"3\", \"2\", \"ct\", \"9\", \"7\", \"8\" FROM \"telegraf\".\"autogen\".\"SPT_Query_ResponseTime\" WHERE time > :dashboardTime: AND \"source\"=\'{hostname}\' AND \"target\"=\'{TargetHostName}\'")]
    for query in querys:
        url = f"{baseUrl}/sources/1/chronograf/data-explorer?query={query}"
        openURlInBrowser(url)

    
def openURlInBrowser(strUrl):
    #TODO: Test  in env without chrome browser
    try:
        cmdExecute(f"start chrome {strUrl}",False,False)
    except:
        webbrowser.open(strUrl,new=2,autoraise=True)


def readTxtboxByCorrectType(originalInput,txtBoxInput):
    if(not isinstance(originalInput, type(txtBoxInput))): #check if original and input types are diffrent
        if(isinstance(originalInput, int)):
                return int(txtBoxInput)
        elif(isinstance(originalInput, float)):
            return float(txtBoxInput)
        elif(isinstance(originalInput, str)):
            return str(txtBoxInput)
        elif(isinstance(originalInput, list)):
            originalInputLst = txtBoxInput.split(",")
            txtBoxInputLst = txtBoxInput.split(",")
            lst = []
            for i in range (len(originalInputLst)):
                lst.append(readTxtboxByCorrectType(originalInputLst[i], txtBoxInputLst[i]))
            return lst
    else:
        return txtBoxInput

def cmdExecute(actualCommand,appear=False,stdoutToFile=False,out=None,err=None):
    timeoutexecmd=60*10
    if appear:
        appear="k"
        start="start"
    else:
        appear="c" 
        start=""

    logger.info(f"ActualCommand: {actualCommand}")
    if(not stdoutToFile):
        cmdCommand = subprocess.Popen(f"{start} cmd /{appear}" + actualCommand, shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
    else:
        with open(out,"w") as fOut, open(err,"w") as fErr:
            cmdCommand = subprocess.Popen(actualCommand,stderr=subprocess.PIPE, stdout=subprocess.PIPE, bufsize=0)
            output, errors = p.communicate()
            
            # while True:
            #     nextline = cmdCommand.stdout.readline()
            #     if nextline == '' and cmdCommand.poll() is not None:
            #         break
            #     sys.stdout.write(nextline)
            #     sys.stdout.flush()
    #logger.info(f"ActualCommand: {actualCommand}")
    return cmdCommand.pid 

def openByExcel(filePath,fileExtention=None,commandRow=None):
    if(fileExtention):
        command=f'start Excel {filePath}{fileExtention}'
    else:
        command=f'start Excel {filePath}'
    if(commandRow):
        commandRow.set(command)
    cmdExecute(command,False)

def openByNotepad(filePath,fileExtention=None,commandRow=None):
    if(fileExtention):
        command=f'start Notepad {filePath}{fileExtention}'
    else:
        command=f'start Notepad {filePath}'
    if(commandRow):
        commandRow.set(command)
    cmdExecute(command,False)
    
    
def openByNotepadPlusPlus(filePath,fileExtention=None,commandRow=None):
    print("in")
    if(fileExtention):
        command=f'start notepad++ {filePath}{fileExtention}'
    else:
        command=f'start notepad++ {filePath}'
    if(commandRow):
        pass
        #commandRow.set(command)
    cmdExecute(command,False)
    
def openLogFile(filePath,fileExtention=None,commandRow=None):
    # get hostName from PARAMS
    # TODO: fix open only in notepad++
    targetHostName = PARAMS['globalParams']['TargetHostName']
    if("Common_function" not in filePath):
        filePath = f'{filePath}_{targetHostName}'
    print(f"Opening log file: {filePath}")
    # try:
    if CheckIFNopadplusExits():
        openByNotepadPlusPlus(filePath,fileExtention,commandRow)
    else:
    # except:
        openByNotepad(filePath,fileExtention,commandRow)

def openCsvFile(filePath,commandRow=None):
    
    if(os.path.exists(filePath)):
        print(os.path.exists(filePath))
        try:
            openByExcel(filePath,commandRow)
        except:
            try:
                openByNotepadPlusPlus(filePath,commandRow)
            except:
                openByNotepad(filePath,commandRow)
    else:
        print(f"Path: {filePath} not exist!")

#*************CallBacks*************:
    
def openInfluxManageDataBtn(commandRow):
    resFolder = os.path.join(SCRIPT_PATH, "results")
    influxManageDataFolder = os.path.join(resFolder, "CsvToInflux_ManageData")
    influxManageDataFile = os.path.join(influxManageDataFolder, "CsvToInflux_ManageData.CSV")
    openCsvFile(influxManageDataFile,commandRow)
    
def runCsvToInflux(app,main_pane,satHostFlag,createUnifiedCSVFlag,sendToInfluxFlag,originalDateFlag,commandRow):
    csv_res_folder = fd.askdirectory(title="Select csv result folder",
                                 initialdir=os.path.join(SCRIPT_PATH,"results"))
    if(csv_res_folder):
        print(f"selected folder: {csv_res_folder}")
        command = f"{sys.executable} {SCRIPT_PATH}\export_CSV_influx.py --p {csv_res_folder}"
        if(satHostFlag):
            command += " --h"
        if(createUnifiedCSVFlag):
            command += " --c"
        if(sendToInfluxFlag):
            command += " --s"
        if(originalDateFlag):
            command += " --o"
        commandRow.set(command)
        title="Export To Influx"
        msg=f"Export to influx finished!"
        progress = IndependentProgressBar(app,main_pane,title,615,'indeterminate')
        progress.startRunLoop(0.025)
        generateHostNameDict = csvToInflux(csv_res_folder,satHostFlag,createUnifiedCSVFlag,sendToInfluxFlag,originalDateFlag)
        if(sendToInfluxFlag):
            manageDataDict=readInfluxMangaeDataRows(generateHostNameDict)
            print(manageDataDict)
            numOfFiles = len(manageDataDict.values())
            msg+=f"\nCsvToInflux_ManageData file path: {INFLUX_MANAGEDATA_FILE}\n----------------------------------\n{numOfFiles} Files uploaded.\nUpload details:\n"
            msg+=str(manageDataDict)
        progress.stopRunLoop()
        messagebox.showinfo(title=title, message=msg)

##############################################
################ PROGRESSBAR: ################
##############################################
class IndependentProgressBar:
    def __init__(self,app,main_pane,title,barLen,mode):
        self.app = app
        self.pane = PanedWindow(main_pane)  
        self.pane.configure(bg=APP_BACKGROUND_COLOR)
        self.pane.pack(fill = X,expand = True) 
        self.progress = ttk.Progressbar(self.pane, orient = HORIZONTAL,
    length = barLen, mode = mode)
        self.progress.pack()
        self.isRunning = False
 
    def runLoop(self,timeInterval):
        self.isRunning = True
        while(self.isRunning):
            value=0
            for value in range(0,100,1):
                self.progress['value'] = value
                sleep(timeInterval)
                self.app.update()
        
    def startRunLoop(self,timeInterval):
        self.isRunning = True
        t = runFuncByThread(self.runLoop,timeInterval)

    def stopRunLoop(self):
        self.isRunning = False
        self.pane.pack_forget()   
##############################################        

def openWarningMessage(app,title,msg):
    app.messagebox.showwarning(title=title, message=msg, **options)

def influxPaneToggle(panes):
    global influx_function_flag
    influx_function_flag = PaneToggle(influx_function_flag,panes)
    
def plotPaneToggle(panes):
    global plot_pane_flag
    plot_pane_flag = PaneToggle(plot_pane_flag,panes)
    
def PaneToggle(toggleFlag,panes):
    if(toggleFlag):
        toggleFlag = False
        #unpack
        for pane in panes:
            pane.pack_forget()
    else:
        toggleFlag = True
        #pack
        for pane in panes:
            pane.pack(fill = X, expand = True)
    return toggleFlag

def Tool_verify_test_run(CalledAe):
    # Consider run tool_verify by thread
    msg = ""
    title = "Tool_verify_test"
    try:
        test_result = Tool_verify_test(CalledAe)
    except Exception as error:
        msg = error
        test_result=False
    if(test_result):
        msg = f"Tool_verify_test {CalledAe} is responding to DICOM verify"
        messagebox.showinfo(title=title, message=msg)
    else:
        msg = f"Tool_verify_test {CalledAe} is not responding to DICOM verify, please check target server "
        messagebox.showerror(title=title, message=msg)

def btnLogFile(logFileName,commandRow):
    filePath = f'{logFolder}\\{logFileName}'
    openLogFile(filePath,'.log',commandRow)
def btnCountUp(logLevelPartTxt):
    lvl = int(logLevelPartTxt.get())
    if(lvl<7 and lvl>=1):
        lvl += 1
        logLevelPartTxt.set(f'{lvl}')

def btnCountDown(logLevelPartTxt):  
    lvl = int(logLevelPartTxt.get())
    if(lvl<=7 and lvl>1):
        lvl -= 1
        logLevelPartTxt.set(f'{lvl}')
    
def clearTxt(part_text):
    part_text.set("")
    

def generatePatientUid(part_text):
    try:
        val = RunSQL("select max(patient_db_uid) from medistore.didb_patients")
    except: 
        val = -1
    part_text.set(val)

def generateStudyUid(part_text):
    val = RunSQL("select max(study_db_uid) from medistore.didb_studies")
    part_text.set(val)
    
def invokeExecCmd(action,logLevelPartTxt,oneStudyFlag,commandRow,stdoutToFile=True):
   if('start' in action):
       command = action
       cmdExecute(command,False)
       commandRow.set(f'{command}')
   else:
        logLevel = int(logLevelPartTxt.get())
        print(f'Log level:{logLevel}')
        print(f'Invoke {action} cmd command')
        if(action == 'kill'):
            killProcess(commandRow)
        elif(action == 'kill cmd'):
            killCmd(commandRow)
        else:
            ################# Run Py Scripts #################
            global cmdPid
            # if(not stdoutToFile):
            command = f'{sys.executable} {SCRIPT_PATH}\{action}.py --l {logLevel}'
            command_postfix = ""
            # else:
            #     #command = f'{sys.executable} {SCRIPT_PATH}\{action}.py --l {logLevel}'
            #     command =  f'{sys.executable} -u {SCRIPT_PATH}\{action}.py --l {logLevel}'
            #     tempFilesFolder = safeFolderCreate(SCRIPT_PATH,"temp_files")
            #     out = os.path.join(tempFilesFolder,f"{action}_out.txt")
            #     err = os.path.join(tempFilesFolder,f"{action}_err.txt")
            #     #command_postfix = f" 1> {out} 2> {err}"
            if(oneStudyFlag.get() == True):
                command += ' --tl '
            #command += command_postfix
            print(command)
            commandRow.set(command)
            cmdPid.append(cmdExecute(command,True))
            print(f"cmdPid= {cmdPid}")
            #cmdPid.append(cmdExecute(command,True,True,out,err))
            #################################################


def runAll(actionList,logLevelPartTxt,oneStudyFlag,commandRow):
    for action in actionList:
        invokeExecCmd(action,logLevelPartTxt,oneStudyFlag,commandRow)
    
def killCmd(commandRow):
    command = f'taskkill /T /F /IM cmd.exe'
    global cmdPid
    for pid in cmdPid:
        print(f"cmd pid = {pid}")
        #command = f'taskkill /T /F /PID {pid}'
        runFuncByThread(cmdExecute,command,False)
        #runFuncByThread(cmdExecute,f'taskkill /T /F /IM "cmd"',False)
        cmdPid.remove(pid)
    commandRow.set(f"taskkill cmd")      
    
    
def killProcess(commandRow):
    #spt_proccess_file = os.path.join(SCRIPT_PATH, r'processID_user_load.txt')
    spt_proccess_files = getProcessIDFileList()
    print(f"Process Files:\n{spt_proccess_files}")
    for file in spt_proccess_files:
        with open(file, 'r') as fp:
            data = fp.read()  
            pids = data.split(",")
            print(f"Killing pids:{pids}")
            for pid in pids:
                command = f'taskkill /F /PID {pid}'
                runFuncByThread(cmdExecute,command,False)
    commandRow.set(f"taskkill /F /PID {pids[len(pids)-1]}")
    runFuncByThread(cmdExecute,'taskkill /F /IM tool.exe',False)
    runFuncByThread(cmdExecute,'taskkill /F /T /IM tail.exe',False)


def getProcessIDFileList():
    spt_proccess_files = []
    for file in os.listdir(f'{SCRIPT_PATH}\pids'):
        if("processID_" in file):
            spt_proccess_files.append(os.path.join(f'{SCRIPT_PATH}\pids', file))
    print(spt_proccess_files)
    return spt_proccess_files
    #spt_proccess_file = os.path.join(SCRIPT_PATH, r'processID_user_load.txt')
    
    
#Configuration window functions
def cancel(window=None):
    global config_window_opened
    if(window != None):
        window.destroy()
        window = None
    else: 
        if(config_window_opened!=None):
            config_window_opened.destroy()
    config_window_opened = window
    
def updateSptParams(app,main_pane,updatedParams,updatedInfluxMode):
    spt_file = os.path.join(SCRIPT_PATH, r'spt_params.json')
    if(not influxmode and updatedInfluxMode):
        # Run common function influxExtentionsInstall
        global isInfluxExtentionInstalled
        if(installInfluxExtention):
           runFuncByThread(target=installInfluxExtention)
           import grafana_dashboard
    with open(spt_file, 'w') as fp:
                json.dump(updatedParams, fp, indent=4)
                
def readSptUpdatedParams(params_uiElement_dict):
    updatedParams = {}
    for title in params_uiElement_dict.keys():
        item = params_uiElement_dict[title]
        tempDict = {}
        originalParam = PARAMS[title]
        for k in item.keys():
                if not isinstance(originalParam[k],bool):
                    tempDict[k] = readTxtboxByCorrectType(originalParam[k],item[k].get())
                else: 
                    tempDict[k] = item[k].get()            
        updatedParams[title] = tempDict
    return updatedParams

def applyChanges(app,main_pane,window,params_uiElement_dict):
    legalInput = True
    try:
        updatedParams = readSptUpdatedParams(params_uiElement_dict)
    except ValueError as e:
        print(e)
        legalInput = False
        val = messagebox.showerror(title="Illegal input type!", message=e,parent=window)
    updatedInfluxMode = updatedParams['InfluxDb']['influxmode']
    if(legalInput == True):
        updateSptParams(app,main_pane,updatedParams,updatedInfluxMode)
        loadParams()
        val = messagebox.showinfo(title="Configuration saved", message="Params files updated!",parent=window)




def biggestRow(spt_parmas_title, spt_parmas):
    biggest = 0
    for key in spt_parmas_title:
        if(biggest<len(spt_parmas[key].keys())):
            biggest = len(spt_parmas[key].keys())
    return biggest

def safeOpenConfigurationWindow(app,main_pane):
    global config_window_opened
    if(config_window_opened == None):
        config_window_opened = openConfigurationWindow(app,main_pane)
    else:
        cancel(config_window_opened)
        
def openConfigurationWindow(app,main_pane):  
    if os.path.exists(JSON_PATH):
        with open(JSON_PATH) as file:
            PARAMS = json.load(file)
            newWindow = Toplevel(app)
            newWindow.protocol('WM_DELETE_WINDOW', cancel)  # Override X button
            maxCol = 4
            # Toplevel widget
            newWindow.title("Common_function Configuration")
            newWindow.resizable(False,False)
            #newWindow.geometry("300x600")
            pane = Frame(newWindow)
            pane.pack(fill = X, expand = True)
            spt_parmas_title = PARAMS.keys()
            totalRows=biggestRow(spt_parmas_title, PARAMS)
            i=0
            c=0
            params_uiElement_dict = {}
            for title in spt_parmas_title:
                lbl = Label(pane, text=f'{title}:',font=('bold')).grid(row=i,column=c, sticky = W, pady=5)
                i+=1
                spt_parmas = PARAMS[title]      #Read spt_params json into dict
                uiElementDict = {}
                for k,v in spt_parmas.items():
                    uiElementkey,uiElementVal = configRowManager(pane,k,v,i,c)
                    uiElementDict[uiElementkey] = uiElementVal
                    i+=1
                    if(i>totalRows):
                        i=0
                        c+=maxCol+1
                params_uiElement_dict[title] = uiElementDict
            lastRow=totalRows+1
            #LOWER PANE_EXPORT\IMPORT:
            low_btn_pane1 = Frame(newWindow)
            low_btn_pane1.pack(side="top", fill = X, expand = True,pady=(40,0))
            #IMPORT_BTN:
            btn=Button(low_btn_pane1,text='Import Configuration',command=lambda: importConfiguration(newWindow,params_uiElement_dict))
            btn.pack(side="left", fill="x", expand=True,padx=(700,0))
            #EXPORT_BTN:
            btn=Button(low_btn_pane1,text='Export Configuration',command=lambda: runFuncByThread(exportConfiguration,newWindow))
            btn.pack(side="left", fill="x", expand=True,padx=(0,0))
            #LOWER PANE_APPLY\CANCEL:
            low_btn_pane2 = Frame(newWindow)
            low_btn_pane2.pack(side="top", fill = X, expand = True,pady=(40,0))
            #APPLY_BTN:
            btn=Button(low_btn_pane2,bg='light green',text='Apply changes',command=lambda: applyChanges(app,main_pane,newWindow,params_uiElement_dict))
            btn.pack(side="left", fill="x", expand=True,padx=(240,0))
            #CANCEL_BTN:
            btn=Button(low_btn_pane2,text='Cancel',command=lambda: cancel(newWindow))
            btn.pack(side="left", fill="x", expand=True,padx=(0,240))
    return newWindow
    
def configRowManager(pane,key,value,row,col):
    if not isinstance(value,bool):
        uiElementkey,uiElementVal = addConfigRow(pane,key,value,row,col)
    else:    
        chkValue = BooleanVar()
        chkValue.set(value)
        uiElementkey,uiElementVal = addConfigRowWithChkbox(pane,key,chkValue,row,col)
    return uiElementkey,uiElementVal
    
def updateConfigRow(uiElement,value):
    if(isinstance(value,list)):
        # Does not support nummbers, each item in this list is str!
        value = str(value).replace('\'', '').replace(' ','')
        value = value[1:len(value)-1]
    uiElement.set(value)
        
def addConfigRow(pane ,key= "",value="" ,row=0,col=0, pady=2):
    lbl = Label(pane, text=key).grid(row=row,column=col+1, sticky = W, pady=pady)
    part_text = StringVar()
    if(isinstance(value,list)):
        # Does not support nummbers, each item in this list is str!
        value = str(value).replace('\'', '').replace(' ','')
        value = value[1:len(value)-1]
    part_entry =Entry(pane,textvariable=part_text).grid(row=row,column=col+2, pady=pady)
    part_text.set(value)
    if(key == 'INITIAL_STUDY_DB_UID'):
        btn = Button(pane ,text='Import',command=lambda: generateStudyUid(part_text)).grid(row=row,column=col+3, pady=pady)
        clear = Button(pane ,text='Clear',command=lambda: clearTxt(part_text)).grid(row=row,column=col+4, pady=0)
    elif(key == 'INITIAL_PATIENT_DB_UID'):
        Button(pane ,text='Import',command=lambda: generatePatientUid(part_text)).grid(row=row,column=col+3, pady=pady)
        clear = Button(pane ,text='Clear',command=lambda: clearTxt(part_text)).grid(row=row,column=col+4, pady=0)
    return key,part_text

def addConfigRowWithChkbox(pane ,key= "",chkValue=False,row=0,col=0, pady=0):
    lbl = Label(pane, text=key).grid(row=row,column=col+1, sticky = W, pady=pady)
    chk = Checkbutton(pane, text='', variable=chkValue).grid(row=row,column=col+2, pady=pady) 
    return key,chkValue

#UI components:
def initLogSection(app,main_pane,commandRow):
    log_label_pane = PanedWindow(main_pane, width="4")  
    log_label_pane.configure(bg=APP_BACKGROUND_COLOR)
    log_label_pane.pack(fill = X,expand = True) 
    logLevelPartTxt = initLogLevelRow(app,log_label_pane,commandRow)
    initLogsRow(log_label_pane,commandRow)
    return logLevelPartTxt

def initImg(main_pane,img,xSize,ySize,app=None):
    img = ImageTk.PhotoImage(PIL_Image.open(f"{SCRIPT_PATH}\\{img}").resize((xSize, ySize),PIL_Image.ANTIALIAS))
    #if(app):
        #app.iconphoto(False,img)
    panel = Label(main_pane, bg=APP_BACKGROUND_COLOR, image = img)
    panel.image = img
    panel.pack(side = "top", fill = "both", expand = "yes")
    
    
def initLogLevelRow(app,main_pane,commandRow):
    resFolder = os.path.join(SCRIPT_PATH, "results")
    log_pane = PanedWindow(main_pane, width="4")
    log_pane.configure(bg=APP_BACKGROUND_COLOR)
    log_pane.pack(fill = X, expand = True)  
    #text entry
    part_text = StringVar()
    part_entry = Entry(log_pane, textvariable=part_text, width = "5")
    part_entry.config(state=DISABLED, disabledbackground=APP_BACKGROUND_COLOR, disabledforeground='black')
    logLevel = 5
    part_text.set(f'{logLevel}')
    lbl = Label(log_pane, bg=APP_BACKGROUND_COLOR, text='Log level:')
    lbl.pack(side="left", fill="x", expand=True, padx=(7,0))
    part_entry.pack(side="left", fill="x", expand=True)
    # +,- Loglevel Btn:
    upLevel=Button(log_pane,bg=APP_BACKGROUND_COLOR,fg='blue',width='1',text='+',command=lambda: btnCountUp(part_text))
    upLevel.pack(side="left", fill="x", expand=True)
    downLevel=Button(log_pane,bg=APP_BACKGROUND_COLOR,fg='red',width='1',text='-',command=lambda: btnCountDown(part_text))
    downLevel.pack(side="left", fill="x", expand=True)
    #zip results folder
    browseLog=Button(log_pane,bg=APP_BACKGROUND_COLOR,text='Zip results folder',width=17, command=lambda: zipResults(app))
    browseLog.pack(side=LEFT, fill="x", expand=True,padx=(45,0))
    #Open results folder
    browseRes=Button(log_pane,bg=APP_BACKGROUND_COLOR,text='Open results folder',width=17, command=lambda: invokeExecCmd(f'start {resFolder}',part_text,False,commandRow))
    browseRes.pack(side=LEFT, fill="x", expand=True,padx=(0,0))
    #Open log folder
    browseLog=Button(log_pane,bg=APP_BACKGROUND_COLOR,text='Open log files folder',width=17, command=lambda: invokeExecCmd(f'start {logFolder}',part_text,False,commandRow))
    browseLog.pack(side=LEFT, fill="x", expand=True,padx=(0,0))
    return part_text

def initCheckBoxRow(main_pane,oneStudyFlag):
     cb_pane = PanedWindow(main_pane)
     cb_pane.configure(bg=APP_BACKGROUND_COLOR)
     cb_pane.pack(fill = X, expand = True)  
     chk = Checkbutton(cb_pane,bg=APP_BACKGROUND_COLOR ,text='one study only', variable=oneStudyFlag)  
     chk.pack(side="left", fill="x", expand=True)

def initCommandRow(main_pane):
     command_pane = PanedWindow(main_pane)
     command_pane.configure(bg=APP_BACKGROUND_COLOR)
     #lbl
     lbl = Label(command_pane,bg=APP_BACKGROUND_COLOR, text='Command:')
     lbl.pack(side="left", fill="x", expand=True)
     #part text
     part_text = StringVar()
     part_entry = Entry(command_pane,textvariable=part_text,width='75')
     part_entry.config(state=DISABLED, disabledbackground=APP_BACKGROUND_COLOR, disabledforeground='black')
     part_entry.pack(side="left", fill="x", expand=True)
     #clear btn
     clear=Button(command_pane,bg=APP_BACKGROUND_COLOR,text='Clear window',command=lambda: clearTxt(part_text))
     clear.pack(side=LEFT, fill="x", expand=True,padx=(10,0))
     return part_text,command_pane
 
def plotView(plotType):
    if plotType == "load":
        pass
    if plotType == "store":
        pass
    if plotType == "query":
        pass
 
def extendedPlotGui(app,main_pane):
    extended_pane = PanedWindow(main_pane) 
    extended_pane.configure(bg=APP_BACKGROUND_COLOR)
    # PLOTPANE_BTN:
    plotPane_btn=Button(main_pane ,bg='light blue',fg='dark blue',text='PlotViewer Extention',width=12,command=lambda: 
                       plotPaneToggle([extended_pane]))
    plotPane_btn.pack(side="top", fill="x", expand=True)
    # LOAD_PLOT:
    load_plot_btn=Button(extended_pane ,bg=APP_BACKGROUND_COLOR,width=12,text='View load plot',command=lambda: plotView('load'))
    load_plot_btn.pack(side="left", fill="x", expand=True)
    # LOAD_PLOT:
    store_plot_btn=Button(extended_pane ,bg=APP_BACKGROUND_COLOR,width=12,text='View store plot',command=lambda: plotView('store'))
    store_plot_btn.pack(side="left", fill="x", expand=True)
    # LOAD_PLOT:
    query_plot_btn=Button(extended_pane ,bg=APP_BACKGROUND_COLOR,width=12,text='View query plot',command=lambda: plotView('query'))
    query_plot_btn.pack(side="left", fill="x", expand=True)
    
def extendedInfluxGui(app,main_pane,commandRow):
    if(influxmode):
        extended_pane = PanedWindow(main_pane) 
        extended_pane.configure(bg=APP_BACKGROUND_COLOR)
        influx_extended_pane = PanedWindow(main_pane) 
        influx_extended_pane.configure(bg=APP_BACKGROUND_COLOR)
        influx_btn_pane = PanedWindow(main_pane)
        influx_btn_pane.configure(bg=APP_BACKGROUND_COLOR)
        influx_btn_pane.pack(fill = X, expand = True) 
        #PACK\UNPACK_BTN
        influx_extention_btn=Button(influx_btn_pane ,bg='white',fg='black',width=12,text='Influx Extention',command=lambda: influxPaneToggle([extended_pane,influx_extended_pane]))
        influx_extention_btn.pack(side="bottom", fill="x", expand=True)
        #CSV_SCRIPT_BTN
        if(PARAMS['InfluxDb']['influxmode'] == True):
            lbl = Label(influx_extended_pane,bg=APP_BACKGROUND_COLOR,width=10,text='Csv To Influx:')
            lbl.pack(side="left", fill="x", expand=True)
            #satHost flag - if True Add at Unified CSV column of Nsat who provided load to TargetHost
            satHostFlag = BooleanVar()
            satHostFlag.set(True)
            chk = Checkbutton(influx_extended_pane,bg=APP_BACKGROUND_COLOR ,width=10,text='satHost', variable=satHostFlag) 
            chk.pack(side="left", fill="x", expand=True)
            #Create Unified CSV flag
            createUnifiedCSVFlag = BooleanVar()
            createUnifiedCSVFlag.set(True)
            chk = Checkbutton(influx_extended_pane,bg=APP_BACKGROUND_COLOR,width=12,text='Create unified csv', variable=createUnifiedCSVFlag) 
            chk.pack(side="left", fill="x", expand=True)
            #sendToInflux flag
            sendToInfluxFlag = BooleanVar()
            sendToInfluxFlag.set(True)
            chk = Checkbutton(influx_extended_pane,bg=APP_BACKGROUND_COLOR,width=10,text='sendToInflux', variable=sendToInfluxFlag) 
            chk.pack(side="left", fill="x", expand=True)
            #Create OriginalDate flag
            originalDateFlag = BooleanVar()
            originalDateFlag.set(False)
            chk = Checkbutton(influx_extended_pane,bg=APP_BACKGROUND_COLOR,width=10,text='Original date', variable=originalDateFlag) 
            chk.pack(side="left", fill="x", expand=True)
            #Run Csv To Influx Script
            csv_btn=Button(influx_extended_pane ,bg=APP_BACKGROUND_COLOR,width=14,text='Run CsvToInflux',command=lambda: runFuncByThread(runCsvToInflux, app,main_pane,satHostFlag.get(),createUnifiedCSVFlag.get(),sendToInfluxFlag.get(),originalDateFlag.get(),commandRow))
            csv_btn.pack(side="top", fill="x", expand=True)
            #Open Csv To Influx ManageData open 
            csv_manageData_btn=Button(influx_extended_pane ,bg=APP_BACKGROUND_COLOR,width=14,text='Open ManageData',command=lambda: runFuncByThread(openInfluxManageDataBtn,commandRow))
            csv_manageData_btn.pack(side="bottom", fill="x", expand=True)
            #INFLUX_OPEN:
            influx_btn_load=Button(extended_pane ,bg=APP_BACKGROUND_COLOR,width=12,text='Open Chronograf load',command=lambda: openChronografWebpath('load'))
            influx_btn_load.pack(side="left", fill="x", expand=True)
            influx_btn_store=Button(extended_pane ,bg=APP_BACKGROUND_COLOR,width=12,text='Open Chronograf store',command=lambda: openChronografWebpath('store'))
            influx_btn_store.pack(side="left", fill="x", expand=True)
            influx_btn_query=Button(extended_pane ,bg=APP_BACKGROUND_COLOR,width=12,text='Open Chronograf query',command=lambda: openChronografWebpath('query'))
            influx_btn_query.pack(side="left", fill="x", expand=True)
            #GRAFANA_OPEN:
            grafana_btn=Button(extended_pane ,bg=APP_BACKGROUND_COLOR,width=12,text='Open Grafana',command=lambda: runFuncByThread(target=openGrafanaDashboard))
            grafana_btn.pack(side="left", fill="x", expand=True)
        
def initBtns(app,main_pane,logLevelPartTxt,oneStudyFlag,commandRow):
    #buttons:
    btn_pane = PanedWindow(main_pane) 
    btn_pane.configure(bg=APP_BACKGROUND_COLOR)
    btn_pane.pack(fill = X, expand = True)    
    paneList=[]
    #COFIGURATION_BTN:
    config_btn=Button(btn_pane ,bg='dark blue',fg='white',text='Cofiguration',command=lambda: safeOpenConfigurationWindow(app,main_pane))
    config_btn.pack(side="top", fill="x", expand=True)
    #RUNALL_BTN:
    runAll_btn=Button(btn_pane ,bg='light blue',fg='dark blue',text='RunAll',width=12,command=lambda: 
                       runAll(["runload","spt_store_tool","spt_query_tool"],logLevelPartTxt,oneStudyFlag,commandRow))
    runAll_btn.pack(side="top", fill="x", expand=True)
    #HEALTH_CHECK_BTN:
    healthCheck_btn=Button(btn_pane ,bg='light blue',fg='dark blue',text='Tool verify',width=12,command=lambda: 
                       runFuncByThread(Tool_verify_test_run,defaultAE))
    healthCheck_btn.pack(side="left", fill="x", expand=True)
    #RUNLOAD_BTN:
    runLoad_btn=Button(btn_pane ,bg='light blue',fg='dark blue',text='RunLoad',width=12,command=lambda: 
                       invokeExecCmd("runload",logLevelPartTxt,oneStudyFlag,commandRow))
    runLoad_btn.pack(side="left", fill="x", expand=True)
    #RUNSTORE_BTN:
    runLoad_btn=Button(btn_pane ,bg='light blue',fg='dark blue' ,text='RunStore',width=12,command=lambda: invokeExecCmd("spt_store_tool",logLevelPartTxt,oneStudyFlag,commandRow))
    runLoad_btn.pack(side="left", fill="x", expand=True)
    #RUNQUERY_BTN:
    runLoad_btn=Button(btn_pane ,bg='light blue',fg='dark blue' ,text='RunQuery',width=12,command=lambda: invokeExecCmd("spt_query_tool",logLevelPartTxt,oneStudyFlag,commandRow))
    runLoad_btn.pack(side="left", fill="x", expand=True)
    #KILL_BTN:
    kill_btn=Button(btn_pane ,fg="white",bg='black',text='Kill Processes',width=12,command=lambda: invokeExecCmd("kill",logLevelPartTxt,oneStudyFlag,commandRow))
    kill_btn.pack(side="left", fill="x", expand=True)
    # #CLOSE_CMD_BTN:
    # closeCmd_btn=Button(btn_pane ,fg="white",bg='black',text='Kill cmd',width=12,command=lambda: invokeExecCmd("kill cmd",logLevelPartTxt,oneStudyFlag,commandRow))
    # closeCmd_btn.pack(side="left", fill="x", expand=True)
    ##########################
    # Extended pane
    # extendedPlotGui(app,main_pane)
    extendedInfluxGui(app,main_pane,commandRow)
    ##########################
def initLogsRow(main_pane,commandRow):
    log_pane = PanedWindow(main_pane, width="4") 
    log_pane.configure(bg=APP_BACKGROUND_COLOR)
    log_pane.pack(fill = X, expand = True) 
    log_pane.configure(bg=APP_BACKGROUND_COLOR)
    lbl = Label(log_pane, bg=APP_BACKGROUND_COLOR, text='Log Files:')
    lbl.pack(side="left", fill="x", expand=True)
    #RUNLOAD_LOG:
    runLoad_btn=Button(log_pane, bg=APP_BACKGROUND_COLOR ,text='Runload log',width=14,command=lambda: btnLogFile(logFileName="spt_load_study",commandRow=commandRow))
    runLoad_btn.pack(side="left", fill="x", expand=True)
    #RUNSTORE_LOG:
    runLoad_btn=Button(log_pane, bg=APP_BACKGROUND_COLOR ,text='Spt_store_tool log',width=15,command=lambda: btnLogFile(logFileName="spt_store_tool",commandRow=commandRow))
    runLoad_btn.pack(side="left", fill="x", expand=True)
    #TOOLQUREY_LOG:
    runLoad_btn=Button(log_pane ,bg=APP_BACKGROUND_COLOR, text='Spt_query_tool log',width=15,command=lambda: btnLogFile(logFileName="spt_query_tool",commandRow=commandRow))
    runLoad_btn.pack(side="left", fill="x", expand=True)
    #COMMON_FUNCTION_LOG:
    runLoad_btn=Button(log_pane, bg=APP_BACKGROUND_COLOR, text='Common function log',width=15,command=lambda: btnLogFile(logFileName="Common_function",commandRow=commandRow))
    runLoad_btn.pack(side="left", fill="x", expand=True)

def noteLbl(main_pane):
    if(PARAMS['InfluxDb']['influxmode'] == 'True'):
        note_pane = PanedWindow(main_pane)
        note_pane.configure(bg=APP_BACKGROUND_COLOR)
        note_pane.pack(fill = X, expand = True) 
        #CSV_SCRIPT_LBL
        lbl = Label(note_pane,bg=APP_BACKGROUND_COLOR, text='NOTE: run csv to influx only in case of offline test (after test is finished)!')
        lbl.pack(side="left", fill="x", expand=True)
        
def initGui():
    app = Tk() 
    row = 0
    main_pane = PanedWindow()
    main_pane.configure(bg=APP_BACKGROUND_COLOR)
    main_pane.pack(fill = X,expand = True) 
    initImg(main_pane,'spt_logo.png',120,120,app)
    commandRow,command_pane = initCommandRow(main_pane)
    
    logLevelPartTxt = initLogSection(app,main_pane,commandRow)
    oneStudyFlag = IntVar()
    initCheckBoxRow(main_pane,oneStudyFlag)
    initBtns(app,main_pane,logLevelPartTxt,oneStudyFlag,commandRow)
    command_pane.pack(fill = X, expand = True)
    initImg(main_pane,'philips_logo.png',80,18)
    #noteLbl(main_pane)
    #parts list
    app.title('SPT')
    #app.geometry('700x350')
    app.resizable(width=False, height=False)
    app.mainloop()
#%%  
if __name__ == '__main__':
    initGui()
    #x = cmdExecute("dir",True)
    #print(x)