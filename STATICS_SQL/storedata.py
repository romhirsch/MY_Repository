
from elasticsearch import Elasticsearch, helpers
import os
import csv
import datetime
import calendar
import re

#%%

#%%
def convert_date(in_date):
    try:
        [d, m, y] = in_date.split("-")
        return '20'+ y
    except:
        print(in_date)

def set_main_modality(modalities):
    origin = modalities
    modalities = list(set(modalities))
    for irrelevant_modality in ["SR", "OT", "SD", "PR", "DOC", "KO", "RG", "AU", "", "SC"]:
        if irrelevant_modality in modalities:
            modalities.remove(irrelevant_modality)
    if len(modalities) == 0:
        main_modality = "Unknown"
    elif len(modalities) == 1:
        if modalities[0] in ["CR", "DR", "DX", "XR", "DEXA", "ECG", "EKG", "DRDX", "DRDRDX"]:
            main_modality = "X-Ray"
        elif modalities[0] in ["MG", "US", "CT", "NM", "MR"]:
            main_modality = modalities[0]
        elif modalities[0] == "NMCT":
            main_modality = "NM"
        elif modalities[0] == "MG_BN":
            main_modality = "MG"
        elif modalities[0] in ["PT"]:
            main_modality = "PT-CT"
        elif modalities[0] in ["XA", "RF", "XACR", "XAXACR"]:
            main_modality = "XA\RF"
        else:
            main_modality = "Unknown"
    else:
        if "XA" in modalities or "RF" in modalities:
            main_modality = "XA\RF"
        elif "PT" in modalities:
            main_modality = "PT-CT"
        elif "MR" in modalities:
            main_modality = "MR"
        elif "MG" in modalities:
            main_modality = "MG"  # 42 US\MG -> MG
        elif "US" in modalities: # 21 US\CT -> Unknown; 55 US\CR -> Unknown
            main_modality = "Unknown"
        elif "XAXACR" in modalities:
            main_modality = "XA\RF"
        elif "NM" in modalities:
            main_modality = "NM"
        elif "ECG" in modalities:
            main_modality = "X-Ray"  # 442 ECG\CT -> X-Ray
        elif "CT" in modalities:
            main_modality = "CT"  # 10 ST\CR -> CT;  109 SC\CT -> CT
        elif len(set(modalities) - {"CR", "DR", "DX", "XR"}) == 0:
            main_modality = "X-Ray"
        else:
            main_modality = "Unknown"
    return main_modality


with open(r'C:\Users\romh\Desktop\STATICS\newstoredata.csv', mode="r") as f:
    with open (r'C:\Users\romh\Desktop\STATICS\storedata3.csv',mode='w',newline='') as f2:
        reader = csv.DictReader(f)
        fields = reader.fieldnames
        fields.append("MainModality")
        writer = csv.DictWriter(f2, fields)
        writer.writeheader()
        for record in reader:
            record["day"]=convert_date(record["year"])
            print(record["Modality"])
            modalities = record["Modality"].split("\\")
            print(modalities)
            record["MainModality"] = set_main_modality(modalities)
            writer.writerow(record)

        
