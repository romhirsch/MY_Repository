# -*- coding: utf-8 -*-
"""
Created on Sun Dec  5 08:44:21 2021

@author: Rom_Hirsch
"""

from tkinter import *
import numpy as np
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg, NavigationToolbar2Tk
from matplotlib.figure import Figure
from datetime import datetime, timedelta
import pandas_datareader as web
import matplotlib.pyplot as plt
import pandas as pd
import datetime
from tkinter import ttk
import tkinter as tk

#%% Costants
DATAKEY = "High"  
DAYS_TO_SUBTRACT = 5
DAYS_TO_ADD = 5 
NUM_ROUND = 4 
#variables:
start = datetime.datetime(2017, 1, 1)
end = datetime.datetime(2020, 5, 12)

#%% functions
def CreatePoints(threeYearData):
    # points where the price went up three days in a row. 
    pointsMark = {"Date":[],"High":[]}
    ifmax = True
    for i in range(2,len(threeYearData.High)):
        #find the point by 3 days 
        filterdata = DateFilter(threeYearData,threeYearData.Date[i],2,0)
        # filterdata=(filterdata.High[::-1])
        filterdata=filterdata.High
        ifmax = True
        if len(filterdata)>1: 
            for j in range(len(filterdata)-1):
                if filterdata[j] > filterdata[j+1]:
                    ifmax=False
        else:
            ifmax = False
        if ifmax:
            pointsMark["Date"].append(threeYearData.Date[i])
            pointsMark["High"].append(threeYearData.High[i])

        # if (threeYearData.High[i] > threeYearData.High[i-1]) and (threeYearData.High[i-1] > threeYearData.High[i-2]) and (threeYearData.High[i-2] > threeYearData.High[i-3]) : 
        #     #There is an increase in price
        #     pointsMark["Date"].append(threeYearData.Date[i])
        #     pointsMark["High"].append(threeYearData.High[i])
    return pointsMark

def quitApp():
    #exit from TK gui
    root.destroy()
    

def draw_ten_days(data,x,y):
    #graph of ten days according to the selected point
    fig.clear()
    ax =  fig.add_subplot(111)
    ax.set_title('Stocks nvda')
    ax.set_xlabel("Date")
    ax.set_ylabel("Stock High Price")
    line, = ax.plot(data.Date,data.High) 
    points, = ax.plot(x,y[0], 'o')     
    canvas.draw_idle()

def DateFilter(df,date,DAYS_TO_SUBTRACT,DAYS_TO_ADD):
    #filter the dataframe between 2 dates
    startDate = date - timedelta(days=DAYS_TO_SUBTRACT)
    endDate = date + timedelta(days=DAYS_TO_ADD)
    #print(date,startDate,endDate)
    filtered_dates = df.loc[datetime.date(year=startDate.year,month=startDate.month,day=startDate.day):datetime.date(year=endDate.year,month=endDate.month,day=endDate.day)]
    return filtered_dates

def onpick(event):
    #event function trigger when clicking on point 
    global filtered_dates
    thisline = event.artist
    xdata = thisline.get_xdata()
    ydata = thisline.get_ydata()
    ind = event.ind
    current_xdata = xdata[ind][0]
    currnt_ydata = ydata[ind]
    points = tuple(zip(xdata[ind], ydata[ind]))
    filtered_dates = DateFilter(threeYearData,current_xdata,DAYS_TO_SUBTRACT,DAYS_TO_ADD)
    filtered_dates["Date"] = filtered_dates.index
    draw_ten_days(filtered_dates,current_xdata,currnt_ydata)
    openNewWindow(root,filtered_dates)

    
def CreateMainGraph():
    #Create main graph (nvda stock high 2017-2020) axis x - Date \ axis y - High prise 
    fig.clear()
    ax =  fig.add_subplot(111)  
    ax.set_title('Stocks nvda')
    ax.set_xlabel("Date")
    ax.set_ylabel("Stock High Price")
    line, = ax.plot(threeYearData.Date,threeYearData.High)  
    points, = ax.plot(pointsMark["Date"],pointsMark["High"], 'o',picker=True)     
    fig.canvas.mpl_connect('pick_event', onpick)
    canvas.draw_idle()
    

def openNewWindow(root,df):
    global contacts
    style = ttk.Style()
    style.configure("mystyle.Treeview", highlightthickness=0, bd=0, font=('Calibri', 11)) # Modify the font of the body
    style.configure("mystyle.Treeview.Heading", font=('Calibri', 13,'bold')) # Modify the font of the headings
    style.layout("mystyle.Treeview", [('mystyle.Treeview.treearea', {'sticky': 'nswe'})]) # Remove the borders
    newWindow = Toplevel(root)
    newWindow.title("dataframe Table")
    global threeYearData
    frame = tk.Frame(newWindow)
    frame.pack()
    df_dict = df.to_dict()
    headers = list(df.columns)
    headers = headers[-1:] + headers[:-1]
    tree = ttk.Treeview(frame, columns=headers, show='headings')
    for header in headers:
        tree.column(header, anchor=CENTER)
        tree.heading(header, text=header)
    contacts = []
    for i in range(len(filtered_dates)):
        contacts.append((df.Date[i].strftime("%d/%m/%Y"),round(df.High[i],NUM_ROUND),round(df.Low[i],NUM_ROUND),round(df.Open[i],NUM_ROUND),round(df.Close[i],NUM_ROUND),round(df.Volume[i],2),round(df["Adj Close"][i],2)))
    for contact in contacts:
        tree.insert('', tk.END, values=contact)  
    style = ttk.Style()
    style.theme_use("default")
    style.map("Treeview")
    tree.pack() 
    
#%% main 
if __name__ == "__main__": 
    #DataReader method name is case sensitive
    threeYearData = web.DataReader("nvda", 'yahoo', start, end)
    threeYearData["Date"] = threeYearData.index 
    #draw points where the price went up three days in a row. 
    pointsMark = CreatePoints(threeYearData)
    root = Tk()
    root.title("nvda Stock")
    #Create figure and canvas 
    fig = Figure(figsize=(10, 5), dpi=100)  #Create figure  
    canvas = FigureCanvasTkAgg(fig, master=root)  # Creat canvas
    canvas.get_tk_widget().pack(side=TOP, fill=BOTH, expand=1) # Create canvas
    toolbar = NavigationToolbar2Tk(canvas, root)  # Creat canvas
    CreateMainGraph() # draw the main graph
    Button(root,text="Back to Main Graph",command=CreateMainGraph).pack()
    button = Button(text = 'QUIT', command = quitApp).pack()
    root.mainloop()







