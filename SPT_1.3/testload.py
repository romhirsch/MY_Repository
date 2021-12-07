# -*- coding: utf-8 -*-
"""
Created on Wed Jun  2 15:29:45 2021

@author: Administrator
"""
import time
import subprocess
c = ['C:\\Program Files\\Carestream\\System5\\loader\\exe\\tool_load.exe','-mpfl','-g','3','-v','-i','-c','vmnalaFIR','-z','1.2.840.113704.7.1.0.17722613222238251.1621791437.2','-x','x','-y','x']
x = subprocess.Popen(c, stderr=subprocess.PIPE, stdout=subprocess.PIPE )
try:
    o,e= x.communicate(timeout=1)
except subprocess.TimeoutExpired:
       print(f"kill process {x.pid}")
       time.sleep(10)
       x.kill()