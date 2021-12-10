
from elasticsearch import Elasticsearch, helpers
import os
import csv
from datetime import datetime 
import calendar
import re
import numpy as np
import matplotlib.pyplot as plt

#%% GLOBAL variable 

es = Elasticsearch(host='10.2.29.57', http_auth=('elastic', 's2e3a1r4c3h6'))
root_path = r'\\platform_files\platform_files\Projects\Statistics2020\bobs\csv_snapshot'
index_name_msv ='mvsstatarr'
index_name_netstat ='netstatarr'
index_name_task ='taststatsarr'
dest_path=r'C:\Users\romh\Desktop\STATICS\csv'
previous_Date=datetime.now()
sum_process_list=[]
sum_process=0
avgperhour={}
#%%
def convert_date(in_date):
    if re.findall('^\d{2}.+\d{2}$',in_date):
            date_form= datetime.strptime(in_date,'%m/%d/%Y %H:%M')          
    else:
        date_form=datetime.strptime(in_date,'%m/%d/%Y %I:%M:%S %p')
    return date_form
#%%

for subdir, dirs, files in os.walk(root_path):
    # if subdir.endswith("_part2"):
        for filename in files:
            records = []
            filepath = subdir + os.sep + filename
            with open(filepath, mode="r") as f:
                block_name=re.findall("BLOCK\d",filepath)
                dest=dest_path + os.sep + str(block_name[0]) + os.sep + filename
                reader = csv.DictReader(f)
                fields = reader.fieldnames
                fields.append("hour")
                fields.append("day")
                print(filename)
                #with open (dest,mode='w',newline='') as f2:
                #    writer = csv.DictWriter(f2, fields)
                #    writer.writeheader()
                if(filename == 'TASKLIST_20210207_202330.csv'):
                    for record in reader:
                        current_date=convert_date(record["datetime"])
                        record["hour"]=current_date.hour
                        record["day"]=current_date.strftime('%m/%d/%Y')
                        if (previous_Date.strftime('%m/%d/%Y %H') == current_date.strftime('%m/%d/%Y %H') ):
                            sum_process +=1
                        else:
                            if (sum_process!=0):
                                sum_process_list.append([sum_process/4,previous_Date.hour])
                            previous_Date=current_date                        
                            sum_process=0
                        
                    #writer.writerow(record)
#%%
for i in range(0,24,1):
    avgperhour[i]=[]

for number_process,hour in sum_process_list:
    print(number_process,hour)
    avgperhour[hour].append(number_process)

avg_list=[]
for i in avgperhour.keys():
    print(avgperhour[i])
    avg_list.append([i,np.average(avgperhour[i])])   
#%%   
x = np.array(avg_list)  
plt.title("AVG Total process per hour") 
 
plt.plot(x[:,0],x[:,1])   
plt.show()
plt.title("AVG Total process per hour") 

plt.bar(x[:,0],x[:,1], align = 'center') 
               