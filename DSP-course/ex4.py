# -*- coding: utf-8 -*-
"""
Created on Thu Aug 19 11:44:44 2021

@author: rom21
"""

import scipy
import matplotlib.pyplot as plt
from scipy import signal
import numpy as np
#%%Functions:

"""
    Function discrete time Fourier Transform 
    
"""
def custom_DTFT(f):
    W = np.arange(0,np.pi*2,0.01)
    N = len(W)

    N2 = len(f)
    F=np.zeros(N,dtype=(complex))
    for i,w in enumerate(W):
        for n in range(N2):
            F[i] += f[n] * np.exp(-1j * w*n)
    return abs(F)


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
    
    
#%%%
"""
Q3 - b
"""

x1 = [1,1,1,1,1]
h = custom_DTFT(x1)
W = np.arange(0,np.pi*2,0.01)
plt.figure()
plt.title("DTFT f[n]")
plt.ylabel("magnitude")
plt.xlabel("freq [red/smp]")
plt.plot(W,h)
plt.show()
#%%

"""
Q3 - c
"""
z=np.exp(-1*1j*W)

Fz=1 + z**-1 + 1*z**-2 + 1*z**-3 + 1*z**-4
plt.figure()
plt.title("C. DTFT f[n]")
plt.ylabel("magnitude")
plt.xlabel("freq [red/smp]")
plt.plot(W,abs(Fz))
plt.show()

#%%
"""
Q3 - d
"""


plt.figure()

h = np.fft.fft(x1)
n = np.arange(len(h))#get the axis x for plot 
plt.figure()

plotStem("d. fft- f[n]","magnitude","Sample points",'blue',n,h)
plt.show()
#%%

"""
Q4 -b and a
"""
f = 1e3 #1KHz
stepPerCycle=1/f 
step = stepPerCycle/100
t = np.arange(0,stepPerCycle*100,step)
sine1=np.sin(2*np.pi*f*t)
plt.figure()
plt.title("Sine(2*pi*1k*t)")
plt.ylabel("magnitude")
plt.xlabel("time [s]")
plt.plot(t,sine1)
plt.show()


#%%

"""
Q4 -c and d 
"""
f = 1e3 #1KHz
fsemp= 4e3
t = np.arange(0,0.1,1/fsemp)
sine1=np.sin(2*np.pi*f*t)
plt.figure()
plt.title("Sine(2*pi*1k*t) simple freq 4k")
plt.ylabel("magnitude")
plt.xlabel("time [s]")
plt.plot(t,sine1)
plt.show()
#%%
"""
Q4  -f 
"""
f = 1e3 #1KHz
fsemp= 4e3
t = np.arange(0,0.1,1/fsemp)
sine1=np.sin(2*np.pi*f*t)
h = np.fft.fft(sine1)
n = np.arange(len(h))#get the axis x for plot 

plt.figure()
plotStem("FFT Sine(2*pi*1k*t)","magnitude","Frequency [Hz]",'blue',10*n,abs(h))
plt.show()

#%%
"""
Q4  -h
"""
f = 1e3 #1KHz
fsemp= 1.25e3
t = np.arange(0,0.1,1/fsemp)
sine1=np.sin(2*np.pi*f*t)
plt.figure()
plt.title("Sine(2*pi*1k*t) simple freq 1.25k")
plt.ylabel("magnitude")
plt.xlabel("time [s]")
plt.plot(t,sine1)
plt.show()

#%%
"""
Q4  -j 
"""
f = 1e3 #1KHz
fsemp= 1.25e3
t = np.arange(0,0.1,1/fsemp)
sine1=np.sin(2*np.pi*f*t)
h = np.fft.fft(sine1)
n = np.arange(len(h))#get the axis x for plot 

plt.figure()
plotStem("FFT Sine(2*pi*1k*t)","magnitude","Frequency [Hz]",'blue',10*n,abs(h))
plt.show()
