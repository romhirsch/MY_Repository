#%%
import cv2 as cv
import sys
import numpy as np
from matplotlib import pyplot as plt
from matplotlib.colors import NoNorm
from PIL import Image
import numpy.matlib
import pandas as pd
import math


#%% functions
def tableDf(df):
    fig, ax = plt.subplots()
    # hide axes
    fig.patch.set_visible(False)
    ax.axis('off')
    ax.axis('tight')
    ax.table(cellText=df.values, colLabels=df.columns, loc='center')
    fig.tight_layout()

plt.show()
def imageShow(im,  title="image"):
    """display image"""
    cv.imshow(title, im)
    cv.waitKey(0)
    cv.destroyAllWindows()


def uint8c(x):
    """custom uint8 - (if val < 0 then val = 0)"""
    x2 = np.copy(x)
    x2[x2 < 0] = 0
    return np.uint8(x2)


def plotPlusImage(axP, axI, im, title):
    axP.plot(imX[1, :])
    axP.set_title(title)
    axI.imshow(im, cmap="gray", norm=NoNorm())
    axI.set_title(title)


#%% question 1.1:

def SquareInSquare(color_backgroud, color_object,range_background=400):
    black_with_square = np.ones([range_background, range_background]) * color_backgroud
    black_with_square[150:250, 150:250] = color_object
    black_with_square = np.uint8(black_with_square)
    plt.figure(figsize=(10, 10))
    plt.subplot(211)
    plt.imshow(black_with_square, cmap="gray", norm=NoNorm())
    plt.title(f"SquareInSquare Bg = {color_backgroud} Bo = {color_object}")
    plt.subplot(212)
    vals = black_with_square.flatten()
    plt.hist(vals, 256, [0, 256])
    Cw = (color_object - color_backgroud) / color_backgroud
    plt.title(f"Waber Contrast is:{Cw}")
    plt.show()

SquareInSquare(1,100)

#%% question 1.2:
def stripes_uint8(height,width,num_stripes):
    if np.isscalar(num_stripes):
        num_stripes = np.arange(0,256,int(256/num_stripes))
    width_stripe = math.floor(width/len(num_stripes))
    vector_row = np.ones(width)
    vector_row = np.array([vector_row[(i*width_stripe):((i+1)*width_stripe)]*v for i,v in enumerate(num_stripes)])
    vector_row = vector_row.flatten()
    return np.uint8(np.matlib.repmat(vector_row,height,1))

height = 200
width = 300
num_stripes = [0,50,100,150,200,250]

plt.figure()
plt.imshow(stripes_uint8(height,width,num_stripes),cmap="gray")
plt.title("Stripes")

f, ax = plt.subplots(3,3)
img=stripes_uint8(height,width,8)
ax[0,0].imshow(img,cmap="gray")
ax[0,1].hist(img.flatten(),256,[0,256])
img=stripes_uint8(height,width,16)
ax[1,0].imshow(img,cmap="gray")
ax[1,1].hist(img.flatten(),256,[0,256])
img=stripes_uint8(height,width,32)
ax[2,0].imshow(img,cmap="gray")
ax[2,1].hist(img.flatten(),256,[0,256])
plt.show()

# 1.3.1

#%% Define parameters
N = 256
Fs = N
Ts = 1/Fs
fx = 5
t = np.linspace(0,N-1,N) * Ts
sx = N
imX = np.zeros((N,N))
#%% Genarate the Image (sin(2*pi*fx*t))
imX = np.matlib.repmat(50*np.sin(2*np.pi*fx*t),N,1)

#%% display the image by cv.imshow (open new window for each image)
#imageShow(uint8c(np.abs(imX)),'uint(abs(imX))')
#imageShow(uint8c(imX),'uint(imX)')
#imageShow(np.float32(imX),'imX')
#imageShow(uint8c(imX-np.min(imX.flatten())),'uint(imX-min(imX.flatten()))')
#%% plot
fig, axs = plt.subplots(2, 4,figsize=(16,9))
plotPlusImage(axs[0, 0],axs[1, 0],uint8c(np.abs(imX)),'A line of uint(abs(imX))')
plotPlusImage(axs[0, 1],axs[1, 1],uint8c(imX),'A line of uint(imX)')
plotPlusImage(axs[0, 2],axs[1, 2],np.float32(imX),'A line of imX')
plotPlusImage(axs[0, 3],axs[1, 3],uint8c(imX-np.min(imX.flatten())),'A line of uint(imX-min(imX.flatten()))')

plt.show()

#1.3.2

#%% Define parameters
#1.
A = 7
f = 10
L = 1
fs = 200
Ts = 1/fs
t = np.linspace(0,L,int(L/Ts))
y = np.sin(2*np.pi*f*t)
N = len(t)
plt.figure()
plt.subplot(221)
plt.plot(t,y)
plt.title(f"y = sin(2*pi*f*t) fs = {fs}")
plt.subplot(222)
plt.plot(abs(np.fft.fft(y)))
plt.title(f"(abs(fft(y)) fs = {fs}")

#2
A = 7
f = 10
L = 1
fs = 12
Ts = 1/fs
t = np.linspace(0,L,int(L/Ts))
y = np.sin(2*np.pi*f*t)
plt.subplot(223)
plt.plot(t,y)
plt.title(f"y = sin(2*pi*f*t) fs = {fs}")
plt.subplot(224)
plt.plot(abs(np.fft.fft(y)))
plt.title(f"(abs(fft(y)) fs = {fs}")

