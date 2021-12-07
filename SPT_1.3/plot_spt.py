import pandas as pd 
import os 
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
import numpy as np
from datetime import datetime
from multiprocessing import Process
#%% Function : 
def OrderByTime(rows):
    lrows=[]
    nrows= np.array(rows)
    rows = nrows[np.argsort(nrows)] 
    rows = rows.tolist()
    return rows

"""

SPT_LOAD_RATE

"""

def SPT_LOAD_ImagePerSecond(data,filterC=None):
    if filterC:
        data = data [(data ["Modality"] == filterC)]
    data.Date = data['Date'].dt.floor('Min')
    date = set(data['Date'])
    date = OrderByTime(list(date))
    data  = data.groupby(["Date"]).mean()
    return data.ImagesPerSecond,date 

def SPT_LOAD_RATE(data,filterC=None):
    if filterC:
        data = data [(data ["Modality"] == filterC)]
    data.Date = data['Date'].dt.floor('Min')
    date = set(data['Date'])
    date = OrderByTime(list(date))
    data  = data.groupby(["Date"]).count()
    return data,date


def plot_SPT_LOAD_ImagePerSec(sptLoadTotal,dateTotal,crLoad,dateCR,ctLoad,dateCT,mrLoad,dateMR):
    plt.figure() 
    plt.gca().xaxis.set_major_formatter(mdates.DateFormatter("%Y-%m-%d %H:%M:%S"))
    plt.plot(dateTotal,list(sptLoadTotal))
    plt.plot(dateCR,list(crLoad))
    plt.plot(dateCT,list(ctLoad))
    plt.plot(dateMR,list(mrLoad))
    plt.title("SPT_LOAD_ImagePerSec")
    plt.xlabel("Date")
    plt.ylabel("Image Per Second")
    plt.legend([f"ToTal {round(sptLoadRateTotal.mean(),2)[0]}",f"CR {round(crLoadRate.mean(),2)[0]}",f"CT {round(ctLoadRate.mean(),2)[0]}",f"MR {round(mrLoadRate.mean(),2)[0]}"])
    plt.gcf().autofmt_xdate()
    plt.show()

     
def plot_SPT_LOAD_RATE(sptLoadRateTotal,dateTotal,crLoadRate,dateCR,ctLoadRate,dateCT,mrLoadRate,dateMR):
    plt.figure() 
    plt.gca().xaxis.set_major_formatter(mdates.DateFormatter("%Y-%m-%d %H:%M:%S"))
    plt.plot(dateTotal,list(sptLoadRateTotal.Modality))
    plt.plot(dateCR,list(crLoadRate.Modality))
    plt.plot(dateCT,list(ctLoadRate.Modality))
    plt.plot(dateMR,list(mrLoadRate.Modality))
    plt.title("SPT_LOAD_RATE(LOAD PER MIN)")
    plt.xlabel("Date")
    plt.ylabel("Count")
    plt.legend([f"ToTal {round(sptLoadRateTotal.Modality.mean(),2)}",f"CR {round(crLoadRate.Modality.mean(),2)}",f"CT {round(ctLoadRate.Modality.mean(),2)}",f"MR {round(mrLoadRate.Modality.mean(),2)}"])
    plt.gcf().autofmt_xdate()
    plt.show()

# def SPT_LOAD_RATE(sptLoadRate):
#     #ToTal
#     sptLoadRate.Date = sptLoadRate['Date'].dt.floor('Min')
#     dateTotal = set(sptLoadRate['Date'])
#     dateTotal = OrderByTime(list(dateTotal))
#     sptLoadRateTotal  = sptLoadRate.groupby(["Date"]).count()
    
#     crLoadRate = sptLoadRate [(sptLoadRate ["Modality"] == "CR")]
#     dateCR = set(crLoadRate['Date'])
#     crLoadRate  = crLoadRate.groupby(["Date"]).count()
#     dateCR = OrderByTime(list(dateCR))

#%%
#path = r"C:\Users\romh\Desktop\Total_Results"

#files=os.listdir(path)

# for file in files:
#     pathFile= os.path.join(path,file)
#     fileData = pd.read_csv(pathFile)



LoadResults = pd.read_csv(r"C:\Users\Administrator\Desktop\SPT\results\wfmpri\Load\spt_load_monitor_wfmpri_wfmsat0.CSV")

LoadResults.Date = pd.to_datetime(LoadResults['Date'], format="%Y-%m-%d %H:%M:%S")

#SPT_LOAD_RATE:
sptLoadRateTotal,dateTotal= SPT_LOAD_RATE(LoadResults)
crLoadRate,dateCR= SPT_LOAD_RATE(LoadResults,"CR")
ctLoadRate,dateCT= SPT_LOAD_RATE(LoadResults,"CT")
mrLoadRate,dateMR= SPT_LOAD_RATE(LoadResults,"MR")
plot_SPT_LOAD_RATE(sptLoadRateTotal,dateTotal,crLoadRate,dateCR,ctLoadRate,dateCT,mrLoadRate,dateMR)
p = Process()
#SPT Load image per second:
sptLoadTotalImagepersec,dateTotal=SPT_LOAD_ImagePerSecond(LoadResults)
crLoadImagepersec,dateCR= SPT_LOAD_ImagePerSecond(LoadResults,"CR")
ctLoadImagepersec,dateCT= SPT_LOAD_ImagePerSecond(LoadResults,"CT")
mrLoadImagepersec,dateMR= SPT_LOAD_ImagePerSecond(LoadResults,"MR")
plot_SPT_LOAD_ImagePerSec(sptLoadTotalImagepersec,dateTotal,crLoadImagepersec,dateCR,ctLoadImagepersec,dateCT,mrLoadImagepersec,dateMR)
  




#%%
