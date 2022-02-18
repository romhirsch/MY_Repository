#%%
import cv2 as cv
import sys
import numpy as np
from matplotlib import pyplot as plt
from matplotlib.colors import NoNorm
#%% functions 

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

#%% Define parameters 
N = 256
Fs = N
Ts = 1/Fs
fx = 5
t = np.linspace(0,N-1,N) * Ts
sx = N
imX = np.zeros((N,N))

#%% Genarate the Image (sin(2*pi*fx*t))
for i in range(0,sx-1):
    imX[i,:]=50*np.sin(2*np.pi*fx*t)

#%% display the image by cv.imshow (open new window for each image)
imageShow(uint8c(np.abs(imX)),'uint(abs(imX))')
imageShow(uint8c(imX),'uint(imX)')
imageShow(np.float32(imX),'imX')
imageShow(uint8c(imX-np.min(imX.flatten())),'uint(imX-min(imX.flatten()))')

#%% plot all the images and data
fig, axs = plt.subplots(2, 4,figsize=(16,9))
axs[0, 0].plot(uint8c(np.abs(imX[1,:])))
axs[0, 0].set_title('A line of uint(abs(imX))')
axs[1, 0].imshow(uint8c(np.abs(imX)),cmap="gray" ,norm=NoNorm())
axs[1, 0].set_title('A line of uint(abs(imX))')
axs[1, 1].imshow(uint8c(imX),cmap="gray" ,norm=NoNorm())
axs[1, 1].set_title('A line of uint(imX)')
axs[0, 1].plot(uint8c(imX[1,:]))
axs[0, 1].set_title('A line of uint(imX)')
axs[1, 2].imshow(np.float32(imX),cmap="gray" , norm=NoNorm())   
axs[1, 2].set_title('A line of imX')
axs[0, 2].plot(imX[1,:])
axs[0, 2].set_title('A line of imX')
axs[1, 3].imshow(uint8c(imX-np.min(imX.flatten())),cmap="gray",norm=NoNorm())   
axs[1, 3].set_title('A line of uint(imX-min(imX.flatten()))')
axs[0, 3].plot(uint8c(imX[1,:]-np.min(imX[1,:])))
axs[0, 3].set_title('A line of uint(imX-min(imX.flatten()))')
plt.show()
# %% appendix
#%%
#p = cv.imread(r"C:\Program Files\MATLAB\R2021a\toolbox\images\imdata\tire.tif",cv.IMREAD_GRAYSCALE)
#minp=np.min(p)
#maxp=np.max(p)
#size = np.shape(p)[0:2]
#cv.imshow("image", p)
#k = cv.waitKey(0)
#plt.hist(p.ravel(),256,[0,256])