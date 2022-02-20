#%%
import cv2 as cv
import sys
import numpy as np
from matplotlib import pyplot as plt
from matplotlib.colors import NoNorm
from PIL import Image

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
    
def plotPlusImage(axP,axI,im,title):
    axP.plot(imX[1,:])
    axP.set_title(title)
    axI.imshow(im,cmap="gray" ,norm=NoNorm())
    axI.set_title(title)
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

#%%
fig, axs = plt.subplots(2, 4,figsize=(16,9))
plotPlusImage(axs[0, 0],axs[1, 0],uint8c(np.abs(imX)),'A line of uint(abs(imX))')
plotPlusImage(axs[0, 1],axs[1, 1],uint8c(imX),'A line of uint(imX)')
plotPlusImage(axs[0, 2],axs[1, 2],np.float32(imX),'A line of imX')
plotPlusImage(axs[0, 3],axs[1, 3],uint8c(imX-np.min(imX.flatten())),'A line of uint(imX-min(imX.flatten()))')
plt.show()

#%% exercise 1 LAB image processing
#%% question 4: display the image Gray,RGB,BGR
imRGB = cv.imread(r"messi5.jpg")
imageShow(imRGB,"RGB")
imGray = cv.cvtColor(imRGB, cv.COLOR_BGR2GRAY)
imageShow(imGray,"GRAY")
imBGR = cv.cvtColor(imRGB, cv.COLOR_RGB2BGR)
imageShow(imBGR,"BGR")
plt.figure()
fig, (ax1,ax2,ax3) = plt.subplots(1,3)
ax1.imshow(cv.cvtColor(imRGB, cv.COLOR_BGR2RGB))
ax1.set_title('RGB')
ax1.axis("off")
ax2.imshow(imGray,cmap="gray",norm=NoNorm())
ax2.set_title('Gray')
ax2.axis("off")
ax3.imshow(imRGB)
ax3.set_title('BGR')
ax3.axis("off")
plt.show()
#%% question 5 : build zero matrix and draw via openCv 
img = np.zeros((512,512,3), np.uint8) # Create a black image
cv.line(img,(0,0),(511,511),(255,0,0),5)
cv.rectangle(img,(384,0),(510,128),(0,255,0),3)
cv.circle(img,(447,63), 63, (0,0,255), -1)
cv.ellipse(img,(256,256),(100,50),0,0,180,255,-1)
pts = np.array([[10,5],[20,30],[70,20],[50,10]], np.int32)
pts = pts.reshape((-1,1,2))
cv.polylines(img,[pts],True,(0,255,255))
font = cv.FONT_HERSHEY_SIMPLEX
cv.putText(img,'OpenCV',(10,500), font, 4,(255,255,255),2,cv.LINE_AA)
imageShow(img)
# %% 6 
imRGB = cv.imread(r"messi5.jpg")
cv.rectangle(imRGB,(330,280),(390,340),(0,255,0),3)
plt.imshow(cv.cvtColor(imRGB, cv.COLOR_BGR2RGB))

# %% 7 
imRGB = cv.imread(r"messi5.jpg")
ball = imRGB[280:340, 330:390]
imRGB[273:333, 100:160]=ball
plt.imshow(cv.cvtColor(imRGB, cv.COLOR_BGR2RGB))

# %% appendix
#p = cv.imread(r"C:\Program Files\MATLAB\R2021a\toolbox\images\imdata\tire.tif",cv.IMREAD_GRAYSCALE)
#minp=np.min(p)
#maxp=np.max(p)
#size = np.shape(p)[0:2]
#cv.imshow("image", p)
#k = cv.waitKey(0)
#plt.hist(p.ravel(),256,[0,256])
# plot all the images and data
# fig, axs = plt.subplots(2, 4,figsize=(16,9))
# axs[0, 0].plot(uint8c(np.abs(imX[1,:])))
# axs[0, 0].set_title('A line of uint(abs(imX))')
# axs[1, 0].imshow(uint8c(np.abs(imX)),cmap="gray" ,norm=NoNorm())
# axs[1, 0].set_title('A line of uint(abs(imX))')
# axs[1, 1].imshow(uint8c(imX),cmap="gray" ,norm=NoNorm())
# axs[1, 1].set_title('A line of uint(imX)')
# axs[0, 1].plot(uint8c(imX[1,:]))
# axs[0, 1].set_title('A line of uint(imX)')
# axs[1, 2].imshow(np.float32(imX),cmap="gray" , norm=NoNorm())   
# axs[1, 2].set_title('A line of imX')
# axs[0, 2].plot(imX[1,:])
# axs[0, 2].set_title('A line of imX')
# axs[1, 3].imshow(uint8c(imX-np.min(imX.flatten())),cmap="gray",norm=NoNorm())   
# axs[1, 3].set_title('A line of uint(imX-min(imX.flatten()))')
# axs[0, 3].plot(uint8c(imX[1,:]-np.min(imX[1,:])))
# axs[0, 3].set_title('A line of uint(imX-min(imX.flatten()))')
# plt.show()