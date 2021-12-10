
from elasticsearch import Elasticsearch, helpers
import os
import csv
from datetime import datetime 
import calendar
import re

#%% GLOBAL variable 

es = Elasticsearch(host='10.2.29.57', http_auth=('elastic', 's2e3a1r4c3h6'))
root_path = r'\\platform_files\platform_files\Projects\Statistics2020\bobs\csv_snapshot'
index_name_msv ='mvsstatarr'
index_name_netstat ='netstatarr'
index_name_task ='taststatsarr'


#%%
def convert_date(in_date):
    if re.findall('^\d{2}.+\d{2}$',in_date):
            date_form= datetime.strptime(in_date,'%m/%d/%Y %H:%M')          
    else:
        date_form=datetime.strptime(in_date,'%m/%d/%Y %I:%M:%S %p')
    return date_form


dumps_count = 1
for subdir, dirs, files in os.walk(root_path):
    # if subdir.endswith("_part2"):
        for filename in files:
            records = []
            filepath = subdir + os.sep + filename
            with open(filepath, mode="r") as f:
                block_name=re.findall("BLOCK\d",filepath)
                for record in csv.DictReader(f):
                    # try:
                    record["datetime"]=convert_date(record["datetime"])
                    record["block"]=block_name[0]
                    record["hour"]=record["datetime"].hour
                    if (filename == 'mvsstatarr.csv'):                       
                        index_name=index_name_msv
                        _id = "#" + " #".join([str(record["datetime"]), record["hostname"], record["type"], record["Service"]])
                      # record["hour"]= record["datetime"].hour   
                    if (filename == 'netstatarr.csv'):
                         index_name=index_name_netstat
                         _id = "#" + " #".join([str(record["datetime"]), record["Foreign_Address_IP"], record["Proto"], record["Local_Address_IP"],record["Foreign_Address_Port"],record["Local_Address_Port"]])
                    if (filename == 'taststatsarr.csv' or filename=='TASKLIST_20210207_202330.csv'): 
                        record["CreationDate"]=convert_date(record["CreationDate"])
                        index_name=index_name_task
                        _id = "#" + " #".join([str(record["datetime"]), record["ProcessId"]])                    
                    records.append({"_id": _id, "_source": record})
                    # except:
                    #     print("exeption in row" + str(record))
                    #     a = 1
                    if len(records) == 50000:
                        res = helpers.bulk(es, records, index=index_name)
                        print( str(dumps_count) + " - " + str(res) + ". File:" + filepath)
                        dumps_count += 1
                        records = []
                res = helpers.bulk(es, records, index=index_name)
                print(str(dumps_count) + " - " + str(res) + ". File:" + filepath)
                dumps_count += 1
