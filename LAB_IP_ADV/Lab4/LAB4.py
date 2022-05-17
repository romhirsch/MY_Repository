
#%%
import sys
import matplotlib
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
from mpl_toolkits.mplot3d import Axes3D
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter
import numpy as np
import timeit
import cv2 as cv # computer vision
from skimage import exposure
from scipy.fftpack import fft, fftshift, ifft, fft2, ifft2 # can replace scipy.fft to older version called scipy.fftpack
import scipy
from scipy import signal
from scipy.signal import cont2discrete, lti, dlti, dstep
from numpy import cos,pi,real
from matplotlib.pyplot import subplot, figure, title, stem, axes, plot, imshow
from scipy.signal import   butter , lfilter, freqz
from scipy.interpolate import CubicSpline

# 1.1

def downsample(sig, factor, Anti_Aliasing=False, img=False):
    if Anti_Aliasing:
        if img:
            lpf = np.ones((3,3))/9
            sig = cv.filter2D(sig, -1, lpf)
            #sig  = signal.convolve2d(lpf, sig)
        else:
            b, a = butter(15, 1/factor, btype='low', analog=False)
            sig = lfilter(b, a, sig) 
    if img:
        sig = sig[::factor, ::factor]
    else:
        sig = sig[::factor]
    return sig

def uint8c(x):
    """custom uint8 - (if val < 0 then val = 0)"""
    x2 = np.copy(x)
    x2  = x2.clip(0, 255)
    return np.uint8(x2)

def sample_test(x,factor, printout=True):
    x_downsampled = downsample(x, factor)
    x_downsampled_antialiasing = downsample(x, factor, True)
    x_fft = np.abs(fft(x))
    x_downsampled_fft = np.abs(fft(x_downsampled))
    x_downsampled_antialiasing_fft = np.abs(fft(x_downsampled_antialiasing))
    f1 = np.arange(-len(x_fft)/2, len(x_fft)/2)
    f2 = np.arange(-len(x_downsampled_fft)/2, len(x_downsampled_fft)/2)
    f3 = np.arange(-len(x_downsampled_antialiasing_fft)/2, len(x_downsampled_antialiasing_fft)/2)

    if printout:
        plt.figure(figsize=(15,10))
        subplot(321); stem(x); title('original')
        subplot(322); stem(f1, fftshift(x_fft)); title('original fft')
        
        subplot(323); stem(x_downsampled); title('decimation')
        subplot(324); stem(f2, fftshift(x_downsampled_fft)); title('fft decimation')
        
        subplot(325);stem(x_downsampled_antialiasing);title('decimation antialiasing')
        subplot(326); stem(f3, fftshift(x_downsampled_antialiasing_fft)); title('decimation antialiasing fft')
        plt.tight_layout()
    return x_downsampled, x_downsampled_antialiasing
    
time = 1 # sec
fs = 200 # Hz
f = 10 # Hz
A = 7
Ts = 1/fs
t = np.arange(0, time-Ts, Ts)    
factor = 4
x = A*cos(2*pi*10*t) + 2*A*cos(2*pi*17*t)+3*A*cos(2*pi*5*t);
sample_test(x, factor)


#%% 
#img=cv.imread(r"C:\Users\rom21\OneDrive\Desktop\LAB1\pyLAB1\cameraman.tif", 0)
img = cv.imread(r"cameraman.tif",0)
factor = 17
x=img[70,:]
sample_test(x, factor)

#%% can see that have aliasing in the signal without the filter

x = A*cos(2*pi*10*t) + 2*A*cos(2*pi*20*t) + 2*A*cos(2*pi*30*t)  
sample_test(x, factor)

#%% all the methods implamated in matlab

def upsample1d(sig, factor, method = 'ZeroOrderHold'):
    if method == 'ZeroOrderHold':
        sig_upsampled = np.repeat(sig, factor)

    elif (method == 'FirstOrderHold'):
        sig_upsampled = np.zeros(len(sig) * factor) 
        sig_upsampled[::factor] = sig
        filter_linear = np.zeros(factor*2 -1)
        for i in range(int((len(filter_linear) + 1 )/2)):
            filter_linear[i] = filter_linear[int(len(filter_linear)-1-i)]  = (i+1)/factor
             #= filter_linear[int(len(filter_linear)-1 -i)]
        sig_upsampled = np.convolve(sig_upsampled, filter_linear, 'same') 
    
    elif (method == 'sinc'):
        sig_upsampled = np.zeros(len(sig) * factor) 
        sig_upsampled[::factor] = sig
        l = 50
        x = np.linspace(-l, l, factor*l-1)
        sinc_filter =np.sinc((np.pi/(factor+2.1))*x)
        sig_upsampled = np.convolve(sig_upsampled, sinc_filter, 'same')
        
    elif (method == 'cubic'):
        sig_upsampled = np.zeros(len(sig) * factor) 
        for i in range(0,len(sig)-3):
            f = CubicSpline([0, 1, 2], sig[i:i+3], bc_type='natural')
            x_new = np.linspace(0, 2, factor+1)
            sig_upsampled[i*factor:i*factor+factor+1] = f(x_new)
    return sig_upsampled

x = A*cos(2*pi*10*t) + 2*A*cos(2*pi*17*t)+3*A*cos(2*pi*5*t);

factor = 4
x_downsampled, x_downsampled_antialiasing = sample_test(x, factor, False)
#s3 = upsample1d(x_downsampled, factor, method = 'ZeroOrderHold')
#s4 = upsample1d(x_downsampled_antialiasing, factor, method = 'FirstOrderHold')
#s5 = upsample1d(x_downsampled_antialiasing, factor, method = 'Ideal')
methods= ['ZeroOrderHold', 'FirstOrderHold', 'sinc', 'cubic']
for method in methods:
    upsampled = upsample1d(x_downsampled, factor, method = method)
    upsampled = upsampled[:len(upsampled)-1]
    MSE = np.sum(np.square(x - upsampled) / len(x))
    SNR = 10*np.log10(np.std(x) / np.std(x - upsampled))
    fig = plt.figure()
    axes = fig.subplots(nrows=2, ncols=1)
    axes[0].plot(range(0, len(x)), x, range(0, len(x)), upsampled)
    axes[0].set(title = 'original signal (blue), upsampled ' + method + ' (orange)\nMSE = ' + "{:.3f}".format(MSE) + ', SNR = ' + "{:.2f}".format(SNR) + 'dB')
    axes[1].plot(x_downsampled)
    axes[1].set(title = 'downsampled signal')
    fig.tight_layout()

#%% 1.2 

def quantize(signal, k):
    temp = signal
    if type(signal[0]) == np.float64:
        temp = uint8c(signal*255) 
    delta = 256/k
    signal_q =  uint8c(np.int64(np.double(temp) / delta) * delta + delta/2)

    if type(signal[0]) == np.float64:
        signal_q = np.double(signal_q / 255)
    return signal_q


def quatize_analaze(sig, num_bits):
    sig_float_q = quantize(sig, num_bits)
    err = sig - sig_float_q
    avg_err = np.sqrt(np.average(np.square(err)))
    snr_db = 20*np.log10(np.std(sig) / np.std(err))
    fig, axi = plt.subplots(2,1)
    axi[0].hist(sig.flatten(), bins = 255)
    axi[0].hist(sig_float_q.flatten(), bins = 255)
    axi[0].set(title = 'Histogram')
    axi[0].legend(['Float64','Float64 Quantized ' + str(num_bits) + '-bit'])
    axi[1].plot(np.arange(0, len(sig)), sig,np.arange(0,len(sig_float_q)), sig_float_q)
    axi[1].set(title = 'Signals\nSNR = ' + "{:.1f}".format(snr_db) + 'dB, Avg Error = ' + "{:.4f}".format(avg_err))
    axi[1].legend(['Float64','Float64 Quantized ' + str(num_bits) + '-bit'])
    fig.tight_layout()
    plt.show()
    return sig_float_q
    
#%%   
fs = 200
L = 1
f = 2
Ts = 1/fs
t = np.arange(0,L-Ts,Ts)
y = np.cos(2*np.pi*f*t)
y = uint8c((1 + y) * 128)
Min = np.min(y)
Max = np.max(y)
y_double = ((np.double(y) - Min) / (Max - Min))
img=cv.imread(r"cameraman.tif", 0)
factor=17
x=img[70,:]
y_4 = y/4 +96
num_bits = 4
quatize_analaze(x, num_bits)
quatize_analaze(y_double, num_bits)
quatize_analaze(y, num_bits)
quatize_analaze(uint8c(y_4), num_bits)
target_noise_db = 10
target_noise_watts = 10 ** (target_noise_db / 10)
mean_noise = 0
noise = np.random.normal(mean_noise, np.sqrt(target_noise_watts), len(y))
noise_sig = y+noise
noise_sig =((np.double(noise_sig) - Min) / (Max - Min))
sig_float_q = quatize_analaze(noise_sig, 2)

#%% 2.

#img = cv.imread(r"chrono.tif", 0)

img = cv.imread(r"C:\Users\rom21\OneDrive\Desktop\imageLAB4\chrono.tif", 0)
chrono = img[1601:2500, 1201:2300]
height, width = chrono.shape
factors = [2, 4, 10]
down_chrono_list = []
#downsampled
dpi = [1250, 300, 150, 72]

for i, factor in enumerate(factors):
        downsampled_img = downsample(chrono, factor, img=True)
        plt.figure()
        plt.title(f"DPI = {dpi[i]} factor:{factor}")
        plt.imshow(downsampled_img, cmap = 'gray', vmin = 0, vmax = 255,aspect='equal') 
        
        
#%% with lowpass

# for i, factor in enumerate(factors):
#         downsampled_img = downsample(chrono, factor, img=True, Anti_Aliasing=True)
#         plt.figure()
#         plt.title(f"DPI = {dpi[i]} factor:{factor} lowpass")
#         plt.imshow(downsampled_img, cmap = 'gray', vmin = 0, vmax = 255,aspect='equal') 
        
#%%

def Zero_Order_Hold2d(img, factor):
    new_img = np.zeros(tuple(np.array(img.shape)*factor))
    for c in range(img.shape[0]):
        new_img[c*factor:c*factor+factor,:] = np.repeat(img[c,:], factor)
    return new_img

def bilinear(image, factor):
  img_height, img_width = image.shape
  height, width = tuple(np.array(image.shape)*factor)
  image = image.ravel()

  x_ratio = float(img_width - 1) / (width - 1) 
  y_ratio = float(img_height - 1) / (height - 1) 

  y, x = np.divmod(np.arange(height * width), width)

  x_l = np.floor(x_ratio * x).astype('int32')
  y_l = np.floor(y_ratio * y).astype('int32')

  x_h = np.ceil(x_ratio * x).astype('int32')
  y_h = np.ceil(y_ratio * y).astype('int32')

  x_weight = (x_ratio * x) - x_l
  y_weight = (y_ratio * y) - y_l

  a = image[y_l * img_width + x_l]
  b = image[y_l * img_width + x_h]
  c = image[y_h * img_width + x_l]
  d = image[y_h * img_width + x_h]

  resized = a * (1 - x_weight) * (1 - y_weight) + \
            b * x_weight * (1 - y_weight) + \
            c * y_weight * (1 - x_weight) + \
            d * x_weight * y_weight
  return resized.reshape(height, width)

#%% 2.1.3 Interpolation Zero_Order_Hold 2d

dpi = [1250, 300, 150, 72]
for i, factor in enumerate(factors):
    downsampled_img = downsample(chrono, factor, img=True)
    resized = Zero_Order_Hold2d(downsampled_img, factor)
    #resized = cv.resize(downsampled_img, img.shape, interpolation=cv.INTER_LINEAR)
    plt.figure()
    plt.title(f"DPI {dpi[i]}, Zero_Order_Hold2d Interpolation")
    plt.imshow(resized, cmap = 'gray', vmin = 0, vmax = 255,aspect='equal')
    
#%% 2.1.3 Interpolation Bilinear 2d
dpi = [1250, 300, 150, 72]
for i, factor in enumerate(factors):
    downsampled_img = downsample(chrono, factor, img=True)
    resized = bilinear(downsampled_img, factor)
    plt.figure()
    plt.title(f"DPI {dpi[i]}, Bilinear Interpolation")
    plt.imshow(resized, cmap = 'gray', vmin = 0, vmax = 255,aspect='equal')
 
#%% 2.2
        
image_path = r"C:\Users\rom21\OneDrive\Desktop\imageLAB4\skull.JPG"

img = cv.imread(image_path)
img_quarnt=[]
quant_levels = [2, 4, 8, 16, 32, 64, 128]
for q_level in quant_levels:  
    img_quarnt.append(quantize(img, q_level))


fig,ax = plt.subplots(2,4)
ax[0,0].set_title("orig")
ax[0,1].set_title("quant level = 128")
ax[0,2].set_title("quant level = 64")
ax[0,3].set_title("quant level = 32")
ax[1,0].set_title("quant level = 16")
ax[1,1].set_title("quant level = 8")
ax[1,2].set_title("quant level = 4")
ax[1,3].set_title("quant level = 2")

ax[0,0].imshow(img, cmap = 'gray', vmin = 0, vmax = 255,aspect='equal')
ax[0,1].imshow(img_quarnt[6], cmap = 'gray', vmin = 0, vmax = 255,aspect='equal')
ax[0,2].imshow(img_quarnt[5], cmap = 'gray', vmin = 0, vmax = 255,aspect='equal')
ax[0,3].imshow(img_quarnt[4], cmap = 'gray', vmin = 0, vmax = 255,aspect='equal')
ax[1,0].imshow(img_quarnt[3], cmap = 'gray', vmin = 0, vmax = 255,aspect='equal')
ax[1,1].imshow(img_quarnt[2], cmap = 'gray', vmin = 0, vmax = 255,aspect='equal')
ax[1,2].imshow(img_quarnt[1], cmap = 'gray', vmin = 0, vmax = 255,aspect='equal')
ax[1,3].imshow(img_quarnt[0], cmap = 'gray', vmin = 0, vmax = 255,aspect='equal')
plt.tight_layout()
plt.show()


#%%



fig,ax = plt.subplots(2,4,figsize=(15,7))
ax[0,0].set_title("orig")
ax[0,1].set_title("quant level = 128")
ax[0,2].set_title("quant level = 64")
ax[0,3].set_title("quant level = 32")
ax[1,0].set_title("quant level = 16")
ax[1,1].set_title("quant level = 8")
ax[1,2].set_title("quant level = 4")
ax[1,3].set_title("quant level = 2")

ax[0,0].hist(img.flatten(), 256, [0, 256])
ax[0,1].hist(img_quarnt[6].flatten(), 256, [0, 256])
ax[0,2].hist(img_quarnt[5].flatten(), 256, [0, 256])
ax[0,3].hist(img_quarnt[4].flatten(), 256, [0, 256])
ax[1,0].hist(img_quarnt[3].flatten(), 256, [0, 256])
ax[1,1].hist(img_quarnt[2].flatten(), 256, [0, 256])
ax[1,2].hist(img_quarnt[1].flatten(), 256, [0, 256])
ax[1,3].hist(img_quarnt[0].flatten(), 256, [0, 256])
fig.tight_layout()
plt.show()

#%% 2.2.2
# from skimage.util import random_noise

# hW, hH = 256, 256

# # Mesh on the square [0,1)x[0,1)
# x = np.linspace(0, hW/(hW +1), hW+1)     # columns (Width)
# y = np.linspace(0, hH/(hH +1), hH+1)     # rows (Height)
# [X,Y] = np.meshgrid(x,y)
# hFreq = 2
# vFreq = 2

# S = uint8c(np.cos(hFreq*2*np.pi*X).astype(np.double) + np.cos(vFreq*2*np.pi*Y).astype(np.double))
# S_noise = (random_noise(S, mode='gaussian', seed=None, clip=True))
# S_q4 = quantize(S, 4)
# S_q4 = quantize(S, 4)

# plt.figure()
# plt.title('Sine with the frequency of 2 in the X and Y Direction' , fontsize = 8)
# plt.imshow(S_noise, cmap = 'gray',vmin);