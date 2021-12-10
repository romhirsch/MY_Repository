# %%
# EasyGui module
from builtins import set
import tkinter as tk
from tkinter import LEFT,RIGHT,TOP,BOTTOM,X,Y,BOTH,NONE,NORMAL,DISABLED,ACTIVE
from tkinter import filedialog as fd
from PIL import Image as PIL_Image
from PIL import ImageTk
from time import sleep
import re, os
import threading
import subprocess
import shutil
import json

# %% Global Variable:
APP_BACKGROUND_COLOR = 'white'
APP_FOREGROUND_COLOR = 'black'

SCRIPT_PATH = os.path.abspath(os.path.dirname(__file__))
CONFIG_FILE_PATH = os.path.join(SCRIPT_PATH,"spt_params.json")

# %%

# %%
# Windows:
class BaseWindow:
    def __init__(self,creator, frame, name, title, size=None, resizable=False, bg_color=APP_BACKGROUND_COLOR, X_callback=None, args=None):
        self.frame = frame
        self.name = name
        if (creator):
            if (X_callback):
                self.frame.protocol('WM_DELETE_WINDOW', lambda: creator.destroy(self.name),
                                    lambda: BaseWindow.runFuncByThread(X_callback, args)) # Override X button
            else:
                self.frame.protocol('WM_DELETE_WINDOW', lambda: creator.destroy(self.name))  # Override X button
        if(not resizable):
            self.frame.resizable(False, False)
        self.frame.title(title)
        if(size):
            self.frame.geometry(size)
        self.main_pane = tk.PanedWindow(self.frame)
        self.main_pane.configure(bg=bg_color)
        self.main_pane.pack(fill=tk.X, expand=True)
        self.subPanelsDict = {"main_pane": self.main_pane}
        self.windows={}

    def printSubPanelsList(self):
        """
        print private variable subPanelsDict
        """
        print("SubPanels:")
        print(f"panels: {self.subPanelsDict.keys()}")
        print(f"size: {len(self.subPanelsDict.keys())}")

    def printSubSindowsList(self):
        """
        print private variable subPanelsDict
        """
        print("SubWindows:")
        print(f"windows: {self.windows.keys()}")
        print(f"size: {len(self.windows.keys())}")

    # Panel functions:
    def CreateNewSubPanel(self, name, bg_color=APP_BACKGROUND_COLOR, fg_color=APP_FOREGROUND_COLOR, width=None, showFlag=True):
        sPanel = SubPanel(name, self.main_pane, bg_color=bg_color, fg_color=fg_color, width=width, showFlag=showFlag)
        self.subPanelsDict[sPanel.name] = sPanel
        return sPanel

    def getPanel(self,subPanelName):
        panel=None
        if (subPanelName in self.subPanelsDict.keys()):
            panel=self.subPanelsDict[subPanelName]
        else:
            print("Panel not found!")
        return panel

    def hideSubPanel(self, subPanelName):
        success = False
        sPanel = self.getPanel(subPanelName)
        if (sPanel):
            sPanel.hide()
            success = True
        return success

    def showSubPanel(self, subPanelName):
        success = False
        sPanel = self.getPanel(subPanelName)
        if (sPanel):
            sPanel.show()
            success = True
        return success

    def RemoveSubPanel(self, subPanelName):
        isExist = self.hideSubPanel(subPanelName)
        if (isExist):
            del self.subPanelsDict[subPanelName]

    def getUiElement(self, subPanelName, entityType, entityName):
        sPanel = self.getPanel(subPanelName)
        if(sPanel):
            return sPanel.getEntity(entityType, entityName)

    # callbacks:
    @staticmethod
    def runFuncByThread(func, args=None):
        if(args):
            t = threading.Thread(target=func, args=args)
        else:
            t = threading.Thread(target=func)
        t.start()
        return t

    # CmdCommand callback:
    @staticmethod
    def RunCmdCommand(command, commandEntry=None, appear=False, startCmd=True, getPid=True):
        timeOut = 60 * 10
        commandPrfix = BaseWindow.__buildCommandPrefix(appear, startCmd)
        command = commandPrfix+command
        print(f"command = {command}\n commandEntry = {commandEntry}")
        cmdCommand = subprocess.Popen(command, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
        try:
            o,e = cmdCommand.communicate(timeout=timeOut)
        except:
            try:
                cmdCommand.kill()
                print(f"killing process {cmdCommand.pid} ,tool : {command[0]}")
            except:
                print(f"not able to kill process {cmdCommand.pid} ,tool : {command[0]}")
            return None, None
        if (commandEntry):
            commandEntry.setText(command)
        if type(o) == bytes:
            decO = o.decode('utf-8')
        if type(e) == bytes:
            decE = e.decode('utf-8')
        if(not getPid):
            return decO, decE
        else:
            return decO, decE, cmdCommand.pid

    @staticmethod
    def __buildCommandPrefix(appear, startCmd):
        if appear:
            appear = "k"
        else:
            appear = "c"
        if startCmd:
            startCmd = "start "
        else:
            startCmd = ""
        return f"{startCmd}cmd /{appear} "
    
    @staticmethod
    def openFolder(path,commandEntry=None):
        command = fr'start {path} '
        BaseWindow.RunCmdCommand(command, commandEntry, False, False, False)
        
    def runCommand(self, command, appear=False, startCmd=True):
        commandPrefix = self.__buildCommandPrefix(appear, startCmd)
        pass

    @staticmethod
    def clearEntryText(panel, entityName):
        print("Text cleared.")
        panel.clearEntryText(entityName)

    @staticmethod
    def setEntryText(panel, entityName):
        print("Text cleared.")
        panel.clearEntryText(entityName)

    @staticmethod
    def getEntryText(panel, entityName):
        print("Text cleared.")
        return panel.getEntryText(entityName)

    @staticmethod
    def insertBoxText(panel, entityName):
        panel.insertTextBox("textbox", entityName)

    @staticmethod
    def showMessageBox(title, msg, type="info",**options):
        """
        :param title:
        :param msg:
        :param type: info,message,error,warning,askquestion,askokcancel,askretrycancel,askyesno,askyesnocancel.
        :return:
        """
        val = None
        if (type == "info"):
            val = tk.messagebox.showinfo(title=title, message=msg, **options)
        elif (type == "message"):
            val = tk.messagebox.Message(title=title, message=msg, **options)
        elif (type == "error"):
            val = tk.messagebox.showerror(title=title, message=msg, **options)
        elif (type == "warning"):
            val = tk.messagebox.showerror(title=title, message=msg, **options)
        # Question messageBox:
        elif (type == "askquestion"):
            val = tk.messagebox.askquestion(title=title, message=msg, **options)
        elif (type == "askokcancel"):
            val = tk.messagebox.askokcancel(title=title, message=msg, **options)
        elif (type == "askretrycancel"):
            val = tk.messagebox.askretrycancel(title=title, message=msg, **options)
        elif (type == "askyesno"):
            val = tk.messagebox.askyesno(title=title, message=msg, **options)
        elif (type == "askyesnocancel"):
            val = tk.messagebox.askyesnocancel(title=title, message=msg, **options)
        return val

    # File read functions:
    def readConfigFile(self, filePath):
        """
        Function check file extension and execute the correct function to read configFile to dict.
        Fucntion support only json type for now, if there is a need function can be extend to other types.
        :param filePath:
        :return:
        """
        if(not filePath): 
            raise Exception("config file is not exist.")
        fileExtension = os.path.splitext(filePath)[1]
        if (fileExtension.lower() == ".json"):
            return dict(self.__readJsonFileToDict(filePath))
        elif (fileExtension.lower() == ".xml"):
            pass

    def __readJsonFileToDict(self,jsonFilePath):
        """
        Config file format: (title: key:value)
            {
            "title": {
                "key": "value",
                "key": "value"
            },
            "title": {
                "key": "value",
                "key": "value"
            }
        :param jsonFilePath:
        :return:
        """
        if os.path.exists(jsonFilePath):
            with open(jsonFilePath) as file:
                return json.load(file)

    def createChildWindow(self,windowType,name,title,configFilePath=None,size=None,bg_color=APP_BACKGROUND_COLOR,X_callback=None):
        """
        :param windowType: Existing optional types: (Window,ConfigWindow)
        :param title:
        :param size:
        :param bg_color:
        :param X_callback:
        :return: childWindow,alreadyExist - boolean value (True if childWindow already exist in self.windows)
        """
        alreadyExist = True
        if(name not in self.windows.keys()):
            alreadyExist = False
            print(f"Window created: (windowType={windowType.lower()}, name={name})")
            if(windowType.lower() == str(Window.__name__).lower()):
                newWindow = Window(self,self.frame,name,title,size,bg_color,X_callback)
            elif(windowType.lower() == str(ConfigWindow.__name__).lower()):
                newWindow = ConfigWindow(self,self.frame,name,title,configFilePath,size,bg_color,X_callback)
            self.windows[name]=newWindow
        self.printSubSindowsList()
        return self.windows[name],alreadyExist

    def destroy(self,windowName,callback=None,args=None):
        """
        Function remove window from self.windows dictionary and destroy window, also allow to add callback function on destroy.
        """
        win = self.windows[windowName]
        win.frame.destroy()
        del self.windows[windowName]
        print(f"{windowName} window destroyed!")
        self.printSubSindowsList()
        if(callback):
            BaseWindow.runFuncByThread(callback,args)

    def askDestroy(self,windowName,askTitle,askMsg,callback=None,args=None):
        """
        Function remove window from self.windows dictionary and destroy window, also allow to add callback function on destroy.
        """
        val = BaseWindow.showMessageBox(askTitle,askMsg,type="error")
        print(val)
        if(val==True):
            win = self.windows[windowName]
            win.frame.destroy()
            del self.windows[windowName]
            print(f"{windowName} window destroyed!")
            self.printSubSindowsList()
            if(callback):
                BaseWindow.runFuncByThread(callback,args)


class Window(BaseWindow):
    def __init__(self, creator,gui, name, title, size=None, bg_color=APP_BACKGROUND_COLOR, X_callback=None, args=None):
        frame = tk.Toplevel(gui)
        super().__init__(creator, frame, name, title, size=size, bg_color=bg_color, X_callback=X_callback, args=args)

class ConfigWindow(Window):
    def __init__(self, creator,gui, name, title, configFilePath=os.path.join(SCRIPT_PATH,"config.json"), size=None, bg_color=APP_BACKGROUND_COLOR, X_callback=None, args=None):
        super().__init__(creator, gui, name, title, size=size, bg_color=bg_color, X_callback=X_callback, args=args)
        self.configFilePath = configFilePath
    ############### CONFIG WINDOW FUNCTIONS ###############
    # import Common_fuction
    # def generatePatientUid(part_text):
    #     try:
    #         val = RunSQL("select max(patient_db_uid) from medistore.didb_patients")
    #     except:
    #         val = -1
    #     part_text.set(val)
    #
    #
    # def generateStudyUid(part_text):
    #     val = RunSQL("select max(study_db_uid) from medistore.didb_studies")
    #     part_text.set(val)

    def readSptUpdatedParams(self,uiDict,originalDict):
        updatedParams = {}
        for title in uiDict.keys():
            item = uiDict[title]
            tempDict = {}
            orig_params = originalDict[title]
            for k in item.keys():
                if not isinstance(orig_params[k], bool):
                    tempDict[k] = self.readTxtboxByCorrectType(orig_params[k], item[k].get())
                else:
                    tempDict[k] = item[k].get()
            updatedParams[title] = tempDict
        return updatedParams

    def cancel(self,window):
        pass

    def applyChanges(self):
        pass

    def exportConfiguration(self,window):
        pass

    def importConfiguration(self,window, uiElementDict):
        pass

    def readTxtboxByCorrectType(self,originalInput,txtBoxInput):
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

    def longestRow(self,titles, fileDict):
        """
        Function return the number of rows, of the longest dict in fileDict.
        """
        longestDict = 0
        for title in titles:
            if(longestDict<len(fileDict[title].keys())):
                longestDict = len(fileDict[title].keys())
        return longestDict

    def copyJsonFile(self,jsonFilePath,taskTitle,saveToPath,fileName):
        selectedPath = fd.asksaveasfilename(title=taskTitle,
                                          filetypes=[("Json File", "*.json")],
                                          initialfile=fileName,
                                          confirmoverwrite=True,
                                          initialdir=saveToPath,
                                          parent=self)
        if (selectedPath):
            print(f"Selected file path: {selectedPath}")
            shutil.copy2(jsonFilePath, f"{selectedPath}.json")
            return selectedPath

    def importFromJsonFile(self, initialdir):
        importFile = fd.askopenfilename(title="Select configuration file", filetypes=[("Json File", "*.json")],
                                        initialdir=initialdir,
                                        parent=self)
        try:
            print(f"imported file:{importFile}")
            jsonDict = self.readConfigFile(importFile)
            return jsonDict
        except:
            print(f"imported file:{importFile}\nUnable to open or read file")
    #######################################################

class Gui(BaseWindow):
    def __init__(self, name, title, logoPath=None, size=None,bg_color=APP_BACKGROUND_COLOR,X_callback=None, args=None):
        frame = tk.Tk()
        super().__init__(None, frame, name, title, size=size, bg_color=bg_color)
        if (X_callback):
            self.frame.protocol('WM_DELETE_WINDOW', lambda: BaseWindow.runFuncByThread(X_callback, args))  # Override X button
        if(logoPath):
            self.LogoApp(logoPath)

    def LogoApp(self, fileImg):
        """
           add logo to the app
           args:
               main_pane - instance of the gui.
               img - logo image.
               xSize - x size of the image.
               ySize - y size of the image.
        """
        img = tk.PhotoImage(file=fileImg)
        self.frame.iconphoto(False, img)

    def startWindow(self):
        """
        Start loop Gui
        """
        self.frame.mainloop()

# %%

############## CustomTkEntities ##############
class TogglePanelButton(tk.Button):
    """
    Button that toggle panels visability (hide\show)
    """
    def __init__(self, pane, panels, bg=APP_BACKGROUND_COLOR, fg=APP_FOREGROUND_COLOR, text="", width=None, padx=None ,pady=None):
        self.toggleFlag = False
        if(not isinstance(panels,tuple)):
            self.panels = (panels,)
        else:
            self.panels = panels
        super().__init__(pane, bg=bg, fg=fg, text=text ,width=width ,padx=padx, pady=pady, command=lambda: BaseWindow.runFuncByThread(self.togglePane))

    def togglePane(self):
        if (self.toggleFlag):
            self.toggleFlag = False
            # unpack
            for panel in self.panels:
                panel.hide()
        else:
            self.toggleFlag = True
            # pack
            for panel in self.panels:
                panel.show()

############## CheckBox ##############
class CheckBox:
    def __init__(self, pane, initValue=False, bg_color=APP_BACKGROUND_COLOR, padx=None ,pady=None):
        self.var = tk.BooleanVar(False)
        self.box = tk.Checkbutton(pane, bg=bg_color ,variable=self.var, padx=padx ,pady=pady)
        if (initValue):
            self.setState(True)

    def getState(self):
        return self.var.get()

    def setState(self,value):
        return self.var.set(bool(value))

############## EntryText ##############
class EntryText:
    def __init__(self, pane, width=None, text="", bg_color=APP_BACKGROUND_COLOR, state=tk.NORMAL, fg=APP_FOREGROUND_COLOR):
        self.part_text = tk.StringVar()
        self.part_text.set(text)
        self.part_entry = tk.Entry(pane, textvariable=self.part_text, width=width)
        self.part_entry.config(state=state, disabledbackground=bg_color, disabledforeground=fg)

    def setText(self,text):
        self.part_text.set(text)

    def getText(self):
        return self.part_entry.get()

    def clearText(self):
        self.part_text.set("")

################ PROGRESSBAR: ################
class CustomProgressBar:
    def __init__(self,pane,barLen,mode,value=0,bg=APP_BACKGROUND_COLOR):
        """
        :param pane:
        :param barLen:
        :param mode: 'indeterminate' -
        :param bg:
        """
        #self.window = window
        self.pane = tk.PanedWindow(pane)
        self.pane.configure(bg=bg)
        self.pane.pack(fill=tk.X, expand=True)
        self.value=value
        self.progress = tk.Progressbar(self.pane, orient=tk.HORIZONTAL,
                                            length=barLen, mode=mode)
        self.progress.pack()
        self.isRunning = False

    def __infinityLoop(self, timeInterval):
        self.isRunning = True
        while (self.isRunning):
            self.value = 0
            for value in range(0, 100, 1):
                self.progress['value'] = value
                sleep(timeInterval)
                self.progress.update()
                #self.window.update()

    @property
    def value(self):
        return self.__value

    @value.setter
    def value(self,val):
        if(val <= 100 and val >=0):
            self.__value = val
        else:
            raise ValueError("value must be in 0-100 range!")

    def updateProgressBarPercentage(self,value):
        self.value = value
        self.progress['value'] = self.value
        self.progress.update()

    def updateProgress(self, timeInterval):
        self.isRunning = True
        BaseWindow.runFuncByThread(self.infinityLoop, timeInterval)

    def stopRunLoop(self):
        self.isRunning = False
        self.pane.pack_forget()
##############################################
class Grid:
    def __init__(self,row,col):
        self.row = row
        self.col = col

class SubPanel:
    """
    SubPanel class can include grid or pack entities but not both at same SubPanel!
    """
    def __init__(self, name, main_pane, bg_color=APP_BACKGROUND_COLOR, fg_color=APP_FOREGROUND_COLOR, width=False,showFlag=True):
        self.name = name
        if (width):
            self.pane = tk.PanedWindow(main_pane, width=width)
        else:
            self.pane = tk.PanedWindow(main_pane)
        self.pane.configure(bg=bg_color)
        self.bg_color = bg_color
        self.fg_color = fg_color
        self.__uiEntitys = {}
        if(showFlag):
            self.show()

    def addEntity(self, entity, name, location=None, padx=None, pady=None):
        """
        Function add element to subPanelDict pack\grid it and return the entity.
        :param entity:
        :param name:
        :param location: could be grid instance or tk diriction instance
        :return:
        """
        if(location):
            if(isinstance(location, Grid)):
                if (isinstance(entity, EntryText)):
                    entity.part_entry.grid(row=location.row,column=location.col,padx=padx,pady=pady)
                elif (isinstance(entity, CheckBox)):
                    entity.box.grid(row=location.row,column=location.col,padx=padx,pady=pady)
                else:
                    entity.grid(row=location.row,column=location.col,padx=padx,pady=pady)
            else:
                if (isinstance(entity, EntryText)):
                    entity.part_entry.pack(side=location, fill="x", expand=True, padx=padx, pady=pady)
                elif (isinstance(entity, CheckBox)):
                    entity.box.pack(side=location, fill="x", expand=True, padx=padx, pady=pady)
                else:
                    entity.pack(side=location, fill="x", expand=True, padx=padx, pady=pady)

        element_type = str(type(entity).__name__).lower()
        key = f"{element_type}_{name}"
        self.__uiEntitys[key] = entity
        return entity

    def getEntity(self, classType, name):
        """
        :param type: tk ui element. exiting types: label,textbox,text,button,
        :param name
        :return:
        """
        if(f"{classType.__name__}_{name}".lower() in self.__uiEntitys.keys()):
            return self.__uiEntitys[f"{classType.__name__}_{name}".lower()]

    def getAllEntities(self):
        return self.__uiEntitys

    def addLabel(self, name, location, text, width=None, fg_color=None,size=None,font=None,padx=None,pady=None):
        if(not fg_color):
            fg_color=self.fg_color
        lbl = tk.Label(self.pane, bg=self.bg_color, width=width, fg=fg_color, text=text, size=size, font=font)
        return self.addEntity(lbl, name, location, padx=padx, pady=pady)

    def addProgressBar(self,name,location,size,mode,padx=None,pady=None):
        customProgressBar = CustomProgressBar(self.pane,size,mode,bg=self.bg_color)
        return self.addEntity(customProgressBar, name, location, padx=padx,pady=pady)

    def changeTextLabel(self, name, text):
        label = self.getEntity("label", name)
        label['text'] = text

    # EntryText:
    def addEntryText(self, name, location, width=None, text="", state=tk.NORMAL, padx=None, pady=None):
        """
        width - width of the stringbox
        location - location of the string box
        """
        entryText = EntryText(self.pane,width,text,self.bg_color,state)
        return self.addEntity(entryText, name, location, padx=padx, pady=pady)

    def setEntryText(self, name, text):
        self.getEntity(EntryText, name).setText(text)

    def getEntryText(self, name):
        return self.getEntity(EntryText, name).getText()

    def clearEntryText(self, name):
        self.getEntity(EntryText, name).clearText()

    # Button:
    def addButton(self, name, location, text, func, args=None, bg=APP_BACKGROUND_COLOR, fg_color=None, width=None,padx=None,pady=None):
        if((args) and (not isinstance(args,tuple))):
            args=(args,)
        if(not fg_color):
            fg_color=self.fg_color
        btn = tk.Button(self.pane, bg=bg, fg=fg_color, text=text, width=width, command=lambda: BaseWindow.runFuncByThread(func,args))
        return self.addEntity(btn, name, location, padx=padx, pady=pady)

    def addTogglePanelButton(self, panels, name, location, text, bg=APP_BACKGROUND_COLOR, fg_color=None, width=None,padx=None,pady=None):
        """
        Make sure create the panel that the TogglePaneButton receive with showFlag=False
        :param panels: panel or tuple of panels.
        :param name:
        :param location:
        :param text:
        :param bg:
        :param fg_color:
        :param width:
        :param padx:
        :param pady:
        :return:
        """
        toggleBtn = TogglePanelButton(self.pane, panels, bg=bg, fg=fg_color, text=text,width=width)
        return self.addEntity(toggleBtn, name, location, padx=padx, pady=pady)

    # TextBox:
    def addTextBox(self, name, location, hightP, widthP, padx=None, pady=None):
        T = tk.Text(self.pane, height=hightP, width=widthP)
        S = tk.Scrollbar(self.pane)
        S.pack(side=tk.LEFT, fill=tk.Y)
        T.pack(side=location, fill=tk.Y)
        S.config(command=T.yview)
        T.config(yscrollcommand=S.set)
        return self.addEntity(T, name, padx=padx, pady=pady)

    def insertTextBox(self, name, text):
        self.getEntity("text", name).insert("end", text)

    # CheckBox:
    def addCheckBox(self,name,location,checkedFlag,padx=None,pady=None):
        chk = CheckBox(self.pane, initValue=checkedFlag, bg_color=APP_BACKGROUND_COLOR)
        return self.addEntity(chk, name, location, padx=padx, pady=pady)

    def setCheckBoxValue(self,name,value):
        self.getEntity("checkbox", name).setState(value)

    def getCheckBoxValue(self,name):
        return self.getEntity("checkbox", name).getState()

    # Image:
    def initImg(self, img, name, location, xSize, ySize, padx=None ,pady=None):
        img = ImageTk.PhotoImage(
            PIL_Image.open(os.path.join(SCRIPT_PATH,img)).resize((xSize, ySize), PIL_Image.ANTIALIAS))
        panel = tk.Label(self.pane, bg=self.bg_color, image=img)
        panel.image = img
        return self.addEntity(panel, name, location, padx=padx, pady=pady)

    def hide(self):
        self.pane.pack_forget()

    def show(self):
        self.pane.pack(fill=tk.X, expand=True)


def tempWindowPanel(window):
    """
    ****** WORK FLOW ******

    First stage: Create Window -> subWindow = window.createChildWindow("window", "config", "temp")
    Secound stage: Create subPanel -> subPanel = subWindow.CreateNewSubPanel("subPanel", False\True)

    Three ways to work:
    1. BY WINDOW:
        NOT FULLY SUPPORT YET.

    2. BY PANEL:
        subPanel.addEntryText("commandline", "left", '20', "tetetete", tk.DISABLED)
        subPanel.setEntryText("commandline", "test2222")

    3. BY RETURNED VALUE:
        e = subPanel.addEntryText("commandline", "left", '20', "tetetete", tk.DISABLED)
        e.setText("test2222")

    """
    subWindowName = "config"
    subWindow,alreadyExist = window.createChildWindow("window", subWindowName, "temp")
    if(not alreadyExist):
        # This if prevent multiple creation of same window
        xSubPanel = subWindow.CreateNewSubPanel("x", False)
        xSubPanel.addLabel("label1", "left", "Command")
        xSubPanel.initImg('spt_logo.png', "sptlogo", "top", 120, 120)
        commandlineSubPanel = subWindow.CreateNewSubPanel("command")
        commandlineSubPanel.initImg('spt_logo.png', "sptlogo", "top", 120, 120)
        commandlineSubPanel.addLabel("label1", "left", "Command")
        e = commandlineSubPanel.addEntryText("commandline", "left", '20', "tetetete", tk.DISABLED)
        e.setText("test2222")
        commandlineSubPanel.addButton("clear_btn", "right", "clear", BaseWindow.clearEntryText,
                                      (commandlineSubPanel, "commandline"))
        commandlineSubPanel.addTogglePanelButton((xSubPanel,), "panel-control", tk.RIGHT, "panel-control")
        textBox = subWindow.CreateNewSubPanel("textBox")
        textBox.addTextBox("loadBox", "top", 20, 70)
        textBox.insertTextBox("loadBox", "lalalal")
    else:
        window.destroy(subWindow.name)


# Init gui:
def initGui():
    rootWindow = Gui('root','SPT Store Tool')
    #mainWindowPanel(rootWindow)
    rootWindow.startWindow()

if __name__ == '__main__':
    initGui()
