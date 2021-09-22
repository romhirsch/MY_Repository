# -*- coding: utf-8 -*-
"""
Created on Sun Sep  5 23:27:47 2021

@author: rom21
"""

import scipy.io
import scipy
import matplotlib.pyplot as plt
from scipy import signal
import numpy as np
from pzmap import zplane
N = 1000 # samples number
fs = 5e3 # sampled rate 
ws=2*np.pi*fs
Ts = 1/fs #
T0 = N*Ts #total sampling time 
df  = 1/T0 #resolution we can get in the spectrum 
data = scipy.io.loadmat(r"C:\Users\rom21\Downloads\input_signal.mat")["s"] # import data from the mat file
data =data.reshape(N)
t = np.arange(data.shape[0])*Ts # time domain 
plt.figure()
plt.plot(t,data.T) # plot time domain 
plt.ylabel("magnitude")
plt.xlabel("time[s]")
plt.figure()
spectrum = np.fft.fft(data)/N
#freqAxis=np.linspace(0,((N-1)/N)*fs,N)
freq = np.arange(0,len(spectrum))*df
omega = 2*np.pi *(freq/fs)
logsn = 20*np.log10(abs(spectrum))
plt.plot(freq,logsn)
#%%
#Notch Filter design:
noiseFreq = 50 # noise frequince we found
N = 1000 # samples number
a = 0.9
z = np.exp(1j*omega)
omegaCutOff = 2 * np.pi*(noiseFreq/fs)
zero1 = np.exp(1j*omegaCutOff)
zero2 = np.exp(-1j*omegaCutOff)
pole1 = a * np.exp(1j*omegaCutOff)
pole2 = a * np.exp(-1j*omegaCutOff)
zplane(np.array([[zero1],[zero2]]),np.array([pole1,pole2]))
notchFilter  = ((z - zero1) * (z-zero2) )/((z-pole1) * (z-pole2))
plt.figure()
plt.title("Notch Filter")
plt.plot(omega,abs(notchFilter))
plt.figure()
plt.title("Notch Filter")
plt.plot(freq,abs(notchFilter))


