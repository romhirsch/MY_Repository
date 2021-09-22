# -*- coding: utf-8 -*-
"""
Created on Mon Aug 30 14:17:59 2021

@author: rom21
"""
import matplotlib.pyplot as plt
from scipy import signal
import numpy as np

#%%
"""
Q - 

x[n]=delta[n+2]+delta[n-1]+delta[n-2]
y[n]=-delta[n-1]+2delta[n-2]
"""

Vlen = 10 #len vector
#plot stem with color 
def stem_plot(n,val,color):
    markerline1, stemlines1, baseline1 = plt.stem(n,val)
    plt.setp(markerline1, 'markerfacecolor', color)
    plt.setp(stemlines1, linestyle="-", color=color, linewidth=2 )
    

#create Delta
def dirac(val=0):
    zero = Vlen/2
    return signal.unit_impulse(Vlen,int(zero-val))

def plotStem(title,ylabel,xlabel,color,x,y):
    plt.figure()
    plt.title(title)
    plt.ylabel(ylabel)
    plt.xlabel(xlabel)
    stem_plot(x,y,color)
    plt.show() 
#%%
n = np.arange(-5,5,1)
delta  = signal.unit_impulse(8)
x = dirac(2)+dirac(-1)+dirac(-2) # x[n]=delta[n+2]+delta[n-1]+delta[n-2]
h = -dirac(-1)+2*dirac(-2)
#y = -dirac(-1)+2*dirac(-2) # y[n]=-delta[n-1]+2delta[n-2]
y=np.zeros(10)
yx = np.convolve(h,x)
for n in range(9):
    y[n]=-x[n-1]+2*x[n-2]
ncov =  np.arange(-5,5,1)
plotStem("y[n] = x[n-1]*2x[n-2]","amplitude","n",'blue',ncov,y)