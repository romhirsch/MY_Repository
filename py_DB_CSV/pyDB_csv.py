# -*- coding: utf-8 -*-
"""
Created on Tue Dec  7 17:05:54 2021

@author: rom21
"""
import os
import pandas as pd
from constants import *
import csv
#%%
#Costants:
#SCRIPT_PATH = os.path.abspath(os.path.dirname(__file__))
SCRIPT_PATH = fr"C:\Users\rom21\OneDrive\Documents\GitHub\MY_Repository\py_DB_CSV"
def connentDB(path):  
   pass 

class CsvDB:
    
    def __init__(self,name,headers,path=SCRIPT_PATH):
        self.name = name   
        self.path = path
        self.fullPath = os.path.join(self.path,self.name+".csv")
        self.collections=__getCollectons()
    def appendColumn(self,columnName):
        newColumn = pd.DataFrame({columnName:[]})
        self.data.append(newColumn)
        self.data.to_csv(self.fullPath)
    def insertRow(self,row):
        """
        Parameters
        ----------
        row : TYPE LIST
            DESCRIPTION.
        """
        if len(row)==len(self.data.columns):
            with open(self.fullPath,'a') as f:
                row.insert(0,"")
                w = f.write(",".join(row))
            self.data = self.__updateData()
        else:
            print("quantity of the variables should be equal to quantity of the headers")
        
    def select(self,selectedColumns,condition_symbol=None,column_filter=None,con_val=None):
        """
        Parameters
        ----------
        command : STRING
            select <column1>,<column2> where <condition> 
            for example : select * where username == 'rom'
            DESCRIPTION.

        Returns
        -------
        None.

        """
        #selectedColumns,condition_symbol,column_filter,con_val =self.__parseCommands(command)
        if not (isinstance(selectedColumns, list)):
            selectedColumns = [selectedColumns]
        data = pd.read_csv(self.path)
        if condition_symbol:
            data = data[OPERATOR_SYMBOLS[condition_symbol](data[column_filter],con_val)]            
        return data[selectedColumns]
    
    def __parseCommands(command,typeCommand):
        pass
    def __updateData(self):
        if os.path.exists(self.fullPath):
            return pd.read_csv(self.path)
        else:
            data = pd.DataFrame(columns=self.headers)
            data.to_csv(self.fullPath)
            return data
        
        
class collection(CsvDB):
    def __init__(self,name,CollectionPath = os.path.join(SCRIPT_PATH,"collections")):
        self.name = name
        self.path = CollectionPath
        self.fullPath = os.path.join(CollectionPath,name +'.csv')
        self.headers = ""
            
            
    @staticmethod
    def addcomma(number):
        content = ""
        for i in range(number):
           content= content+"," 
        return content
     

    @property
    def headers(self):
        return self._headers
    
    @headers.setter
    def headers(self,headers):
        if headers:
            SetHeaders(headers)
            self.headers = headers
        else:
            if not os.path.exists(self.fullPath):
                open(self.fullPath,"w")
                self._headers = []
            else:
                with open(self.fullPath,"r") as file:
                     self._headers  = file.readline().split(",")
                     
    def appendHeaders(self,headers):
        with open(self.fullPath,"r+") as file:
            reader = file.readlines()
            if reader:
                for i,line in enumerate(reader):
                    if i ==0 : 
                        reader[0]=",".join(headers)
                    else:
                        reader[i]=line + self.addcomma(len(headers))
            else:
                reader=[",".join(headers)]
                file.writelines(reader)
            
    def SetHeaders(self,headers):
        with open(self.fullPath,"r+") as file_read:
            reader = file_read.readlines()
            if reader:
                for i,line in enumerate(reader):
                    if i ==0 : 
                        reader[0]=",".join(headers) + '\n'
                    else:
                        
                        reader[i]=line + self.addcomma(len(headers)) + '\n'
            else:
                reader=[",".join(headers)]
        print(reader)
        with open(self.fullPath,"w") as file_write:
            file_write.writelines(reader)

                
        return 
        
    def printlines(self):
        with open(self.fullPath,"w+") as file:
            file.write(",".join(headers))
            reader = file.readlines()
            for line in reader:
                print(line)
        
    
    def getHeaders(self):
        with open(self.fullPath,"r") as file:
            reader = file.readline()
        return reader.split(",")
    
            
#%% main 


# csvfile = open(fr"C:\Users\rom21\OneDrive\Documents\GitHub\MY_Repository\py_DB_CSV\collections\text1.csv",newline = '')
# reader = csv.DictReader(csvfile)

# c1 = collection("text1")
# c1.SetHeaders(["username","id"])


        
#csv1 = CsvDB("test",["users","id"])


    
            