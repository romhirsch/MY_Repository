import json
import DicomTagInfra

with open(r'DicomDictByTagNumber.json', 'r') as file:
    DICOM_DICT_BY_TAG_NUMBER = json.load(file, object_hook=DicomTagInfra.DicomTagJsonEncoder.decode_json)

with open(r'DicomDictByTagName.json', 'r') as file:
    DICOM_DICT_BY_TAG_NAME = json.load(file, object_hook=DicomTagInfra.DicomTagJsonEncoder.decode_json)