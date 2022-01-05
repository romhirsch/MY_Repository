# -*- coding: utf-8 -*-
"""
Created on Wed Dec 15 19:07:42 2021

@author: rom21
"""

from PIL import Image
rawData = open(rf"C:\Users\rom21\OneDrive\Desktop\VHDL_git\VHDL\project\restored_msim.raw", 'rb').read()
imgSize = (703,1248)# the image size
img = Image.frombytes('L', imgSize, rawData)
img.save(rf'C:\Users\rom21\OneDrive\Desktop\VHDL_git\VHDL\project\test.png')# can give any format you like .png