# -*- coding: utf-8 -*-
"""
Created on Wed Dec 15 19:01:46 2021

@author: rom21
"""

#import struct
import numpy, array, PIL, Image
from struct import *

#declarations
arr1D   =   array.array('H') #H is unsigned short

#------------------------------------
#read 16 bit unsigned raw depth image
#------------------------------------
w           =   640
h           =   480
fid        =   open(rf"C:\Users\rom21\OneDrive\Desktop\VHDL_git\VHDL\project\restored_msim.raw")
#fid         =   open('/home/salman/test.raw')
numBytes    =   w*h
arr1D.read(fid, numBytes)
fid.close()

#----------------------------------------------------
#convert to float numpy array -> scale -> uint8 array
#----------------------------------------------------
numarr = numpy.array(arr1D, dtype='float');
numarr = 255 - (numarr*255.0/numarr.max())
numarr.shape = (h,w)
numarr = numarr.astype('uint8')

#======================
#IMAGES
#======================

#2D numpy array -> image 
#-----------------------
img        =   Image.fromarray(numarr); #print data.dtype.name

#image view and save
#-------------------
#img.show()
img.save(rf'C:\Users\rom21\OneDrive\Desktop\VHDL_git\VHDL\project\test.png')