# -*- coding: utf-8 -*-
"""
Created on Mon Aug 23 10:41:33 2021

@author: rom21
"""


import scipy
import matplotlib.pyplot as plt
from scipy import signal
import numpy as np

#plot stem with color 
def stem_plot(n,val,color):
    markerline1, stemlines1, baseline1 = plt.stem(n,val)
    plt.setp(markerline1, 'markerfacecolor', color)
    plt.setp(stemlines1, linestyle="-", color=color, linewidth=2 )
    
    
    
#Create Stem plot with color
def plotStem(title,ylabel,xlabel,color,x,y):
    plt.figure()
    plt.title(title)
    plt.ylabel(ylabel)
    plt.xlabel(xlabel)
    stem_plot(x,y,color)
    plt.show() 
    
#%%
""""

Q - 3

"""
w=np.arange(0,2*np.pi,2*np.pi/1000)
z=np.exp(1j*w)
H=(z**2+3*z+1)/(z**2+z+0.2)
plt.figure()
plt.title("System freq response - HPF")
plt.ylabel("magnitude")
plt.xlabel("freq [red/smp]")
plt.plot(w,abs(H))
plt.show()
#%% Q - 6 
""""

Q - 6 

"""
#X[n] 
x  = np.ones(22)
for n in range(22):
    x[n]=0.1**n*x[n]
    
y = np.zeros(22)
y[0] = x[0]
y[1] = x[1] + 3*x[0] - y[0]
for n in range(2,22):
    y[n]=x[n]+3*x[n-1]+x[n-2]-y[n-1]-0.2*y[n-2]
plt.figure()
n = np.arange(len(y))#get the axis x for plot 
plotStem("system output","amplitude","Sample points",'blue',n,y)
plt.show()