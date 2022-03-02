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

def imageShow(im,  title = "image"):
    """display image"""
    cv.imshow(title, im)
    cv.waitKey(0)
    cv.destroyAllWindows()

def uint8c(x):
    """custom uint8 - (if val < 0 then val = 0)"""
    x2 = np.copy(x)
    x2[x2 < 0] = 0
    x2[x2 > 255] = 255
    return np.uint8(x2)


def plotPlusImage(axP, axI, axN, im, title):
    axP.plot(im[1, :])
    axP.set_title(title)
    axI.imshow(im, cmap="gray", norm=NoNorm())
    axI.set_title(title)
    imgMin = np.min(im.flatten())
    imgMax = np.max(im.flatten())
    normalImg = np.dot(255, (im - imgMin) / (imgMax - imgMin))
    axN.imshow(normalImg, cmap="gray")
    #axN.plot(normalImg[0, :])


# plot stem with color
def stem_plot(n, val, color):
    markerline1, stemlines1, baseline1 = plt.stem(n, val)
    plt.setp(markerline1, 'markerfacecolor', color)
    plt.setp(stemlines1, linestyle="-", color=color, linewidth=2)

# Create Stem plot with color
def plotStem(title, ylabel, xlabel, color, x, y):
    plt.title(title)
    plt.ylabel(ylabel)
    plt.xlabel(xlabel)
    stem_plot(x, y, color)
    plt.show()

#padded zeros to array , params (array ,size of the array after the padded)
def padded_zeros(arr, N): # padded zeros
    padded_array = np.zeros(N)
    padded_array[:len(arr)] += arr
    return padded_array

#%% question 1.1:
def SquareInSquare(color_backgroud, color_object, range_background = 400):
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
def stripes_uint8(height, width, num_stripes):
    if np.isscalar(num_stripes):
        num_stripes = np.arange(0, 256, int(256/num_stripes))
    width_stripe = math.floor(width/len(num_stripes))
    vector_row = np.ones(width)
    vector_row = np.array([vector_row[(i * width_stripe): ((i + 1) * width_stripe)] * v for i, v in enumerate(num_stripes)])
    vector_row = vector_row.flatten()
    return np.uint8(np.matlib.repmat(vector_row,height,1))

#1.
height = 200
width = 300
num_stripes = [0, 50, 100, 150, 200, 250]
plt.figure()
plt.imshow(stripes_uint8(height, width, num_stripes), cmap="gray")
plt.title("Stripes")
f, ax = plt.subplots(3, 3)
img=stripes_uint8(height, width, 8)
ax[0, 0].imshow(img,cmap="gray")
ax[0, 1].hist(img.flatten(), 256, [0, 256])
img=stripes_uint8(height,width,16)
ax[1, 0].imshow(img,cmap="gray")
ax[1, 1].hist(img.flatten(), 256, [0, 256])
img=stripes_uint8(height, width, 32)
ax[2, 0].imshow(img,cmap="gray")
ax[2, 1].hist(img.flatten(), 256, [0, 256])
plt.show()

# 1.3.1
#%% Define parameters

N = 256
Fs = N
Ts = 1/Fs
fx = 5
t = np.linspace(0, N-1, N) * Ts
sx = N
imX = np.zeros((N, N))
imX = np.matlib.repmat(50*np.sin(2*np.pi*fx*t), N, 1)

# %% display the image by cv.imshow (open new window for each image)
#imageShow(uint8c(np.abs(imX)),'uint(abs(imX))')
#imageShow(uint8c(imX),'uint(imX)')
#imageShow(np.float32(imX),'imX')
#imageShow(uint8c(imX-np.min(imX.flatten())),'uint(imX-min(imX.flatten()))')

# %% plot
fig, axs = plt.subplots(3, 4,figsize=(16,9))
plotPlusImage(axs[0, 0], axs[1, 0], axs[2, 0], uint8c(np.abs(imX)), 'A line of uint(abs(imX))')
plotPlusImage(axs[0, 1], axs[1, 1], axs[2, 1], uint8c(imX), 'A line of uint(imX)')
plotPlusImage(axs[0, 2], axs[1, 2], axs[2, 2], np.float32(imX), 'A line of imX')
plotPlusImage(axs[0, 3], axs[1, 3], axs[2, 3], uint8c(imX-np.min(imX.flatten())), 'A line of uint(imX-min(imX.flatten()))')


plt.show()

# 1.3.2
#%% Define parameters
# 1.
A = 7
f = 10
L = 1
fs = 200
Ts = 1/fs
t = np.linspace(0, L, int(L/Ts))
y = np.cos(2*np.pi*f*t)
N = len(t)
plt.figure()
plt.subplot(221)
plt.plot(t,y)
plt.title(f"y = sin(2*pi*f*t) fs = {fs}")
plt.subplot(222)
plt.plot(np.linspace(-(fs/2), fs/2-1, int(L/Ts)), np.fft.fftshift(abs(np.fft.fft(y))))
plt.title(f"(abs(fft(y)) fs = {fs}")

# 2.
fs = 12
Ts = 1/fs
t = np.linspace(0,L,int(L/Ts))
y = np.sin(2*np.pi*f*t)
plt.subplot(223)
plt.plot(t, y)
plt.title(f"y = sin(2*pi*f*t) fs = {fs}")
plt.subplot(224)
plt.plot(np.linspace(-(fs/2), fs/2-1, int(L/Ts)), np.fft.fftshift(abs(np.fft.fft(y))))
plt.title(f"(abs(fft(y)) fs = {fs}")

#5
A = 7
f = 10
L = 1
fs = 200
Ts = 1/fs
t = np.linspace(0, L, int(L/Ts))
y = np.cos(2*np.pi*f*t)
y = uint8c((1 + y) * 128)
N = len(t)
plt.figure()
plt.subplot(221)
plt.plot(t,y)
plt.title(f"y = sin(2*pi*f*t) fs = {fs}")
plt.subplot(222)
plt.plot(np.linspace(-(fs/2), fs/2-1, int(L/Ts)), np.fft.fftshift(abs(np.fft.fft(y))))
plt.title(f"(abs(fft(y)) fs = {fs}")


#%%1.4
f = np.array([1, 2, 3, 1, 2])
h = np.array([1, 1])
g = np.convolve(f, h)
n = np.arange(0, 4, 1)
m1 = len(f)
m2 = len(h)
f = padded_zeros(f, m2+m1-1)
h = padded_zeros(h, m2+m1-1)
plt.subplot(311)
plotStem("f[n]", "amplitude", "n", 'red', range(m1+m2-1), f)
plt.subplot(312)
plotStem("h[n]", "amplitude", "n", 'green', range(m1+m2-1), h)
convXY = np.convolve(f, h)
plt.subplot(313)
plotStem("conv(f*h)", "amplitude", "n", 'blue', range(convXY.shape[0]), convXY)
plt.show()

# 1.4 - q6

f = np.array([1, 2, 3, 1, 2])
h2 = np.zeros(f.shape[0]*2)
m1 = len(f)
m2 = len(h2)
h2[[0,f.shape[0]]] = 1
f = padded_zeros(f, m2)
plt.figure()
plt.subplot(311)
plotStem("f[n]", "amplitude", "n", 'red', range(m2), f)
plt.subplot(312)
plotStem("h[n]", "amplitude", "n", 'green', range(m2), h2)
g2 = np.convolve(f,h2)
plt.subplot(313)
plotStem("conv(f*h)", "amplitude", "n", 'blue', range(m2), g2[0:m2])
plt.show()

#%% 1.4.3
# Additive White Gaussian Noise (AWGN)
noise = np.random.normal(0, 1, 100)
plt.figure()
plt.plot(noise)