#%%
import EasyGui
import Common_function

SPT_LOGO_PATH = EasyGui.os.path.join(EasyGui.SCRIPT_PATH,"spt_logo.png")
PY_EXEC = Common_function.sys.executable
#%%

class SptGui:
    def __init__(self):
        #Folders & files create:
        self.configFilePath,self.pidDIr,self.resultsDir,self.logsDir,self.exported_configurationsDir = self.__initSptDirTree()
        # Spt properties
        self.logLevel = 5
        # Spt root window init
        self.rootWindow = EasyGui.Gui('root','Spt Gui',logoPath=SPT_LOGO_PATH)
        self.rootWindow = self.initMainWindowPanel(self.rootWindow)
        self.rootWindow.printSubPanelsList()
        self.rootWindow.printSubSindowsList()
        self.rootWindow.startWindow()

    def __initSptDirTree(self):
        # configDir
        Common_function.safeFolderCreate(EasyGui.SCRIPT_PATH,"exported_params")
        configFile = EasyGui.os.path.join(EasyGui.SCRIPT_PATH,"spt_params.json")
        # pidDir
        pidDIr = Common_function.safeFolderCreate(EasyGui.SCRIPT_PATH,"pids")
        # resultsDir:
        resultsDir = Common_function.safeFolderCreate(EasyGui.SCRIPT_PATH,"results")
        # logsDir:
        logsDir = Common_function.safeFolderCreate(EasyGui.SCRIPT_PATH,"logs")
        # exported_configurationsDir:
        exported_configurationsDir = Common_function.safeFolderCreate(EasyGui.SCRIPT_PATH,"exported_configurations")
        return configFile,pidDIr,resultsDir,logsDir,exported_configurationsDir

    # Init main window:
    def initMainWindowPanel(self,window):
        """
        panels: Img,LogLevelRow
        """
        # Init img:
        imgPanel = window.CreateNewSubPanel("Img")
        imgPanel.initImg('spt_logo.png', "sptlogo", "top", 120, 120)
        # Init Panels:
        commandPanel = self.initCommandPanel(window,False)      # Init invisible commandPanel
        commandEntry = commandPanel.getEntity(EasyGui.EntryText, "command")     # Get commandEntry entity 
        LogLevelPanel = self.initLogLevelPanel(window,commandEntry)          # Init LogLevelPanel
        #logFilesPanel = self.initLogFilesPanel(window)          # Init LogFilesPanel
        operationsPanel = self.initOperationsPanel(window)      # Init operationPanel
        commandPanel.show()                                     # Set commandPanel visible

        #Temp:
        # commandlineSubPanel=window.CreateNewSubPanel("command")
        # commandlineSubPanel.addLabel("label1", "left", "Command")
        # commandlineSubPanel.addEntryText("commandline", "left", '20', "tetetete", EasyGui.DISABLED)
        # commandlineSubPanel.setEntryText("commandline", "test2222")
        # commandlineSubPanel.addButton("clear_btn", "right", "clear", EasyGui.BaseWindow.clearEntryText,
        #                               (commandlineSubPanel, "commandline"))
        # textBox = window.CreateNewSubPanel("textBox")
        # textBox.addTextBox("loadBox", "top", 20, 70)
        # textBox.insertTextBox("loadBox", "lalalal")

        # buttonsPanel = window.CreateNewSubPanel("command")
        # buttonsPanel.addButton("add_btn", EasyGui.LEFT, "add", self.tempWindowPanel, window)
        # buttonsPanel.addEntryText("demo_entrytext", EasyGui.LEFT, width=12, text="", state=EasyGui.NORMAL)
        # buttonsPanel.addCheckBox("demo_chk", EasyGui.LEFT, True)
        # buttonsPanel.setCheckBoxValue("demo_chk", False)

        # print(buttonsPanel.getCheckBoxValue("demo_chk"))
        # window.hideSubPanel("command")
        return window
    
    # Main Window Panels Init:
    def initLogLevelPanel(self,window,commandEntry,visibleVal=True):
        print(self.logsDir)
        LogLevelPanel = window.CreateNewSubPanel("LogLevel",showFlag=visibleVal)
        LogLevelPanel.addLabel("logLevel", EasyGui.LEFT, text="Log level:")
        logEntry = LogLevelPanel.addEntryText("logLevel",EasyGui.LEFT,width=5,text=self.logLevel,state=EasyGui.DISABLED)
        LogLevelPanel.addButton("upLevel",EasyGui.LEFT,fg_color='blue',width=1,text='+',func=self.btnCountUp,args=logEntry)
        LogLevelPanel.addButton("downLevel",EasyGui.LEFT,fg_color='red',width=1,text='-',func=self.btnCountDown,args=logEntry,padx=(0,200))
        LogLevelPanel.addButton("resultsFolder",EasyGui.LEFT,width=12,text='Open results folder',func=EasyGui.BaseWindow.openFolder,args=(self.resultsDir,commandEntry))
        LogLevelPanel.addButton("logFileFolder",EasyGui.LEFT,width=12,text='Open log folder',func=EasyGui.BaseWindow.openFolder,args=(self.logsDir,commandEntry))
        return LogLevelPanel
    
    def initLogFilesPanel(self,window,visibleVal=True):
        LogFilesPanel = window.CreateNewSubPanel("logFiles",showFlag=visibleVal)
        LogFilesPanel.addLabel("logFiles", EasyGui.LEFT,fg_color='blue',text='Runload log',func=self.btnCountUp,args=logEntry)
        LogFilesPanel.addButton("runStoreLog",EasyGui.LEFT,fg_color='blue',text='Spt_store_tool log',func=self.btnCountUp,args=logEntry)
        LogFilesPanel.addButton("runQueryLog",EasyGui.LEFT,fg_color='red',text='Spt_query_tool log',func=self.btnCountDown,args=logEntry,padx=(0,250))
        LogFilesPanel.addButton("logFileFolder",EasyGui.LEFT,text='Common function log',func=EasyGui.BaseWindow.openFolder,args=self.logsDir)
        return LogLevelPanel
    
    def initOneStudyRow(self,window,visibleVal=True):
        oneStudyPanel = window.CreateNewSubPanel("oneStudyPanel",showFlag=visibleVal)
        
    def initCommandPanel(self,window,visibleVal=True):
        commandPanel = window.CreateNewSubPanel("commandPanel",showFlag=visibleVal)
        commandPanel.addLabel("command", EasyGui.LEFT, text="Command:")
        commandEntry = commandPanel.addEntryText("command",EasyGui.LEFT,width = 70,text="",state=EasyGui.DISABLED,padx=(0,10))
        commandPanel.addButton("commandClear",EasyGui.LEFT, width=10, text='clear',func=commandPanel.clearEntryText,
                                      args =("command"))
        return commandPanel
    
    def initOperationsPanel(self,window,visibleVal=True):
        operationsPanel = window.CreateNewSubPanel("LogLevel",showFlag=visibleVal)
        # Config Btn
        operationsPanel.addButton("config", EasyGui.TOP, "config", self.initConfigWindow,
                               (window,self.configFilePath), bg="dark blue", fg_color="white")
        # Operations Btn
        operationsPanel.addButton("run_all", EasyGui.TOP, "Run All", self.initConfigWindow,
                               (window,self.configFilePath), bg="light blue", fg_color="dark blue")
        operationsPanel.addButton("toolVerify", EasyGui.LEFT, "Tool Verify", self.initConfigWindow,
                               (window,self.configFilePath), bg="light blue", fg_color="dark blue")
        operationsPanel.addButton("runLoad", EasyGui.LEFT, "Run Load", self.initConfigWindow,
                               (window,self.configFilePath), bg="light blue", fg_color="dark blue")
        operationsPanel.addButton("runStore", EasyGui.LEFT, "Run Store", self.initConfigWindow,
                               (window,self.configFilePath), bg="light blue", fg_color="dark blue")
        operationsPanel.addButton("runQuery", EasyGui.LEFT, "Run Query", self.initConfigWindow,
                               (window,self.configFilePath), bg="light blue", fg_color="dark blue")
        operationsPanel.addButton("killProcesses", EasyGui.LEFT, "Kill Processes", self.initConfigWindow,
                               (window,self.configFilePath), bg="black", fg_color="white")

        return operationsPanel
    


    # CALLBACKS:
    #Loglevel-Callbacks:
    def btnCountUp(self,logLevelEntry):
        lvl = int(logLevelEntry.getText())
        if (lvl < 7 and lvl >= 1):
            lvl += 1
            self.logLevel = lvl
            logLevelEntry.setText(f'{self.logLevel}')

    def btnCountDown(self,logLevelEntry):
        lvl = int(logLevelEntry.getText())
        if (lvl <= 7 and lvl > 1):
            lvl -= 1
            self.logLevel = lvl
            logLevelEntry.setText(f'{self.logLevel}')

    # OpenUrlInBrowser:
    def openURlInBrowser(strUrl,commandEntry=None):
        command = f"start chrome {strUrl}"
        try:
            EasyGui.BaseWindow.RunCmdCommand(command, False, False ,False)
        except:
            webbrowser.open(strUrl, new=2, autoraise=True)
    
    ############## CONFIG WINDOW FUNCTIONS ###############
    # CALLBACKS:
    def generatePatientUid(part_text):
        try:
            val = RunSQL("select max(patient_db_uid) from medistore.didb_patients")
        except:
            val = -1
        part_text.set(val)
    
    
    def generateStudyUid(part_text):
        val = RunSQL("select max(study_db_uid) from medistore.didb_studies")
        part_text.set(val)

    def cancel(self,window):
        pass

    def applyChanges(self):
        pass

    # DEBUG ON NSAT:
    def exportConfiguration(self,window,jsonFileToExport):
        export_dir = EasyGui.os.path.join(EasyGui.SCRIPT_PATH, r'exported_configurations')
        export_host_dir = Common_function.safeFolderCreate(export_dir,Common_function.TargetHostName)
        hostname, error = Common_function.ExecuteExe("hostname")
        hostname = str(hostname)
        hostname = hostname.replace(" ", "")
        hostname = hostname.replace("\r\n", "")
        print(f"Saving file: {EasyGui.os.path.join(export_host_dir,hostname)}")
        window.copyJsonFile(jsonFileToExport,"Save configuration file",export_host_dir,hostname)
    
    def importConfiguration(self,window,initialDir,uiElementDict):
        importedDict = window.importFromJsonFile(initialDir)
        for title in uiElementDict.keys():
            for key in uiElementDict[title].keys():
                try:                     self.updateConfigRow(uiElementDict[title][key] ,importedDict[title][key])
                except Exception as e:
                    print(f"Upadte {key} failed!, {e}\nFile has miss match type value")
        
    def configRowManager(self, panel, key, value, row=0, col=0):
        if not isinstance(value, bool):
            uiElementkey, uiElementVal = self.__addConfigRow(panel, key, value, row, col)
        else:
            uiElementkey, uiElementVal = self.__addConfigRowWithChkbox(panel, key, value, row, col)
        return uiElementkey, uiElementVal

    def updateConfigRow(self, uiElement, value):
        if (isinstance(value, list)):
            # Does not support nummbers, each item in this list is str!
            value = str(value).replace('\'', '').replace(' ', '')
            value = value[1:len(value) - 1]
        uiElement.set(value)

    def __addConfigRow(self, panel, key="", value="", row=0, col=0, pady=2):
        lbl = panel.addLabel(key, EasyGui.Grid(row, col + 1), text=key, pady=pady)
        part_text = panel.addEntryText(key, EasyGui.Grid(row, col + 2), text=value)
        if (isinstance(value, list)):
            # Does not support nummbers, each item in this list is str!
            value = str(value).replace('\'', '').replace(' ', '')
            value = value[1:len(value) - 1]
            part_text.setText(value)
            #part_text.clearTxt()
        # Clear and Import buttons
        if (key == 'INITIAL_STUDY_DB_UID'):
            # importStudyBtn = panel.addButton("study_import", EasyGui.Grid(row, col+3), text='Import',func=generateStudyUid,args=part_text,pady=pady)
            clear = panel.addButton("study_clear",EasyGui.Grid(row, col+4), text='Clear', func=part_text.clearText)
        elif (key == 'INITIAL_PATIENT_DB_UID'):
            # importPatientBtn = panel.addButton("patient_import", EasyGui.Grid(row, col+3), text='Import',func=generatePatientUid,args=part_text,pady=pady)
            clear = panel.addButton("patient_clear",EasyGui.Grid(row, col+4), text='Clear', func=part_text.clearText)
        return key, part_text

    def __addConfigRowWithChkbox(self, panel, key="", chkValue=False, row=0, col=0, pady=0):
        lbl = panel.addLabel(key, EasyGui.Grid(row, col + 1), text=key, pady=pady)
        chk = panel.addCheckBox(key, EasyGui.Grid(row, col + 2), checkedFlag=chkValue, pady=pady)
        return key, chkValue

    def __readTxtboxByCorrectType(self, originalInput,txtBoxInput):
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
                    lst.append(self.readTxtboxByCorrectType(originalInputLst[i], txtBoxInputLst[i]))
                return lst
        else:
            return txtBoxInput

    def initConfigWindow(self, window, configFilePath, numOfColumn=4):
        try:
            fileDict = window.readConfigFile(configFilePath)
        except Exception as e:
            EasyGui.BaseWindow.showMessageBox("error",str(e) , "error")
        
        configWindow,isWindowExists = window.createChildWindow("ConfigWindow", "config", "configuration")
        if (fileDict and not isWindowExists):  
            titles = list(fileDict.keys())
            totalRows = configWindow.longestRow(titles, fileDict)
            configPanel = configWindow.CreateNewSubPanel("configPanel")
            row = 0
            col = 0
            uiElementDict = {}
            for title in titles:
                lbl = configPanel.addLabel(title, EasyGui.Grid(row, col), title + ":", font='bold', pady=5)
                row += 1
                tempUiDict = {}
                for key in fileDict[title]:
                    value = fileDict[title][key]
                    uiElementkey, uiElementVal = self.configRowManager(configPanel, key, value, row, col)
                    tempUiDict[uiElementkey] = uiElementVal
                    row += 1
                    if (row > totalRows):
                        row = 0
                        col += numOfColumn + 1
                uiElementDict[title] = tempUiDict
                # TODO: CONTINUE FUNCTION
                # TODO: TEST ENTRY TEXT GETTEXT FUNCTION
                # configSubPanel.addEntryText("value", tk.LEFT, 12, "tetetete", tk.DISABLED)
            # Import\Export subPanel
            subPanel = configWindow.CreateNewSubPanel("import-export")
            subPanel.addButton("export", EasyGui.RIGHT, "Export Configuration", configWindow.exportConfiguration, (window),
                               padx=0,pady=30)  # Update args by applyChanges args (before bg)
            subPanel.addButton("import", EasyGui.RIGHT, "Import Configuration", configWindow.importConfiguration, (window, uiElementDict),
                               padx=(700,0),pady=30)  # Update args by applyChanges args (before bg)

            # Lower subPanel: ([apply,cancel] buttons)
            lowerSubPanel = configWindow.CreateNewSubPanel("lowerSubPanel")
            lowerSubPanel.addButton("apply", EasyGui.LEFT, "Apply",bg="light green", func=configWindow.applyChanges,
                                    padx=(250,0))  # Update args by applyChanges args (before bg)
            lowerSubPanel.addButton("cancel", EasyGui.LEFT, "Cancel", window.destroy,configWindow.name,
                                    padx=(0,250))  # Update args by cancel args (before bg)
        elif(isWindowExists):
            window.destroy(configWindow.name)

if __name__ == '__main__':
    sptGui = SptGui()