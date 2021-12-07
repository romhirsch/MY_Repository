import re
import os
import glob
import asyncio
import aiohttp
import datetime
import threading
import subprocess
from DicomDict import DICOM_DICT_BY_TAG_NUMBER, DICOM_DICT_BY_TAG_NAME
from DicomTagInfra import *
from AlgoLog import LogManager
import xml.etree.ElementTree as ET
from abc import ABC, abstractmethod
from json import load, loads, JSONDecodeError
from xml.etree import ElementTree


class TestScenario:
    running_index = 1  # The file row which the ExcelOutput scenario data will be written to
    db_layer = None
    is_localhost = False
    output_obj = None
    request_params = None
    response_output_path = ""

    def __init__(self, output_obj):
        self.index = output_obj.row_index = TestScenario.running_index
        TestScenario.running_index += 1
        self.is_parallel = False

    @staticmethod
    def init_general_params(db_layer, is_localhost, output_obj, request_params, response_output_path):
        TestScenario.db_layer = db_layer
        TestScenario.is_localhost = is_localhost
        TestScenario.output_obj = output_obj
        TestScenario.request_params = request_params
        TestScenario.response_output_path = response_output_path

    @staticmethod
    @abstractmethod
    def copy_constructor(scenario):
        pass

    @abstractmethod
    def create_input_data(self):
        pass

    @abstractmethod
    def set_already_known_output_values(self):  # initiate the values from test plan that can be achieved before run
        pass

    @abstractmethod
    def check_validity(self):
        pass

    @abstractmethod
    async def run_test(self, series_num=1):
        pass

    @abstractmethod
    def build_headers(self):
        pass

    @abstractmethod
    def build_url(self):
        pass

    @abstractmethod
    async def send_request(self, url, extension, request_header):
        pass

    def export_response_output(self, end_time, url_response, file_extension='dcm'):
        tmp_folder = self.response_output_path
        if not os.path.exists(tmp_folder):
            LogManager.debug(210, "TEMP folder doesn't exist. Create one in:{}".format(tmp_folder))
            os.makedirs(tmp_folder)
        file_name = tmp_folder + f"\\request_output_{self.index}_{end_time}.{file_extension}"
        with open(file_name, 'wb') as out_file:
            out_file.write(url_response)
            LogManager.debug(210, "Created temp file: {}".format(file_name))
        return file_name

    @staticmethod
    def validate_json_format(path):
        try:
            with open(path, encoding='utf-8') as file:
                data = load(file)
                if len(data) == 0:
                    LogManager.error(210, "Json output has no content")
                    return False
        except JSONDecodeError as e:
            start, stop = max(0, e.pos - 100), e.pos + 100
            snippet = e.doc[start:stop].replace("\n", "").replace("\r", "").replace("\t", "").replace("  ", " ")
            LogManager.error(210, "Json file failed to be parsed\n{}\n{}".format(e, "..." + snippet + "...", '^'*100))
            print("Json file failed to be parsed\n{}\n{}\n{}".format(e, "..." + snippet + "...", '-'*100 + "^"))
            return False
        except ValueError as e:
            LogManager.error(210, "Json format is incorrect - " + str(e))
            return False
        except IOError as e:
            LogManager.error(210,"IOError while reading the json file - " + str(e))
            return False
        except BaseException as e:
            LogManager.error(210,"Unexpected error while reading the json file - " + str(e))
            return False
        return True

    @staticmethod
    def validate_xml_format(path):
        try:
            with open(path, encoding='utf-8') as file:
                guid = file.readline()
                total_files = []
                single_file = ""
                for line in file.readlines():
                    if not (line == guid or "Content-Type:" in line or line == "\n"):  # append every line that is not a separator
                        single_file += line
                    if guid in line:  # Once you reach the guid - it's a new file, so keep it and start a new one
                        total_files.append(single_file)
                        single_file = ""

                for xml_file in total_files:
                    data = ElementTree.fromstring(xml_file)
                    if len(data) == 0:
                        LogManager.error(210, "Xml output has no content")
                        return False
        except ElementTree.ParseError as err:
            LogManager.error(210, "Invalid XML format: " + str(err))
            return False
        except IOError as e:
            LogManager.error(210, "Failed to open the file - " + str(e))
            return False
        except BaseException as e:
            LogManager.error(210, "General xml validation Error: " + str(e))
            return False
        return True

    @staticmethod
    async def on_request_start(session, trace_config_ctx, params):
        LogManager.info(210, "Event \'on_request_start\' was handled for request: " + str(params.url))

    @staticmethod
    async def on_request_chunk_sent(session, trace_config_ctx, params):
        print("on_request_chunk_sent: {} ".format(str(datetime.datetime.now().strftime('%H:%M:%S.%f'))))

    @staticmethod
    async def on_response_chunk_received(session, trace_config_ctx, params):
        print("on_response_chunk_received: {} ".format(str(datetime.datetime.now().strftime('%H:%M:%S.%f'))))

    @staticmethod
    async def on_request_end(session, trace_config_ctx, params):
        LogManager.info(210, "Event \'on_request_end\' was handled for request: " + str(params.url))

    async def async_get(self, url, header):
        try:
            trace_config = aiohttp.TraceConfig()
            trace_config.on_request_start.append(TestScenario.on_request_start)
            trace_config.on_request_end.append(TestScenario.on_request_end)
            trace_config.on_response_chunk_received.append(TestScenario.on_response_chunk_received)
            trace_config.on_request_chunk_sent.append(TestScenario.on_request_chunk_sent)

            time_obj = RequestTimeMeasurements()
            time_obj.request_start_time = datetime.datetime.now()
            data = b''
            async with aiohttp.ClientSession(timeout=aiohttp.ClientTimeout(total=TestScenario.request_params.timeout * 60), trace_configs=[trace_config]) as session:
                async with session.get(url, headers=header, chunked=True) as response:
                    if not self.is_parallel:  # We are waiting for first image only when running sequentially, since context switch in parallel mode might show wrong results
                        data = (await response.content.readchunk())[0]
                        print("First chunk!! ", datetime.datetime.now().strftime('%H:%M:%S.%f'))
                    time_obj.download_start_time = datetime.datetime.now()

                    data += await response.read()
                    time_obj.download_end_time = datetime.datetime.now()
                    time_obj.request_end_time = datetime.datetime.now()
                    return data, response, "", time_obj
        except asyncio.TimeoutError:
            LogManager.error(210, "Request timed-out after {} minutes".format(TestScenario.request_params.timeout))
            error = "Request timeout"
        except aiohttp.ClientResponseError as e:
            LogManager.error(210, "Response returned with ClientResponseError: " + str(e))
            error = "ClientResponseError"
        except aiohttp.client.ClientPayloadError as e:
            LogManager.error(210, "Client Payload error - {}.\n"
                                  "Possible reasons: 1) Response object is closed before response receives all data."
                                  "2) Transfer encoding related errors like misformed chunked encoding.".format(e))
            error = "Client Payload error"
        except aiohttp.ClientConnectionError as e:
            LogManager.error(210, "Response returned with ConnectionError: " + str(e))
            error = "Connection Error"
        except aiohttp.ClientError as e:
            LogManager.error(210, "Response returned with general ClientError: " + str(e))
            error = "Client Error - " + str(e)
        except BaseException as e:
            LogManager.error(210, "Request failed due to an unknown error: " + str(e))
            error = "Request failed - " + str(e)
        return "", "", error, None

    @staticmethod
    def get_hcff_info(hcff_input):
        hcff_file_location = glob.glob(hcff_input["DIRECTORY_PATH"] + "/*.hcff")
        if TestScenario.is_localhost:
            hcff_sizes_list = [round(os.stat(file).st_size / 1000, 1) for file in hcff_file_location]
            hcff_amount = hcff_input["NUM_OF_FILES"]
            hcff_total_size = sum(hcff_sizes_list)
            hcff_avg_size = round(hcff_total_size / hcff_amount, 2)
        else:
            hcff_sizes_list = "------"
            hcff_amount = "------"
            hcff_total_size = "------"
            hcff_avg_size = "------"
        return hcff_amount, str(hcff_sizes_list).strip('[]'), hcff_total_size, hcff_avg_size

    def get_tool_opt_info(self, study_directory, series_info):
        series_db_uid = series_info["SERIES_DB_UID"]
        for series_dir in study_directory:
            series_id = series_dir.split('\\')[-1]  # The last part of the path is the series id
            if str(series_db_uid) == series_id:
                first_image_in_series = [x[2] for x in os.walk(series_dir)].pop(0).pop(0)
                image_path = r"{}\{}".format(series_dir, first_image_in_series)
                self.row_output["Actual Size [KB]"] = round(os.stat(image_path).st_size / 1000, 1)
                self.execute_tool_opt(image_path, first_image_in_series)

    def execute_tool_opt(self, image_path, first_image_in_series):
        """tool_opt behaves different among dcff files and images files"""
        if "_" in first_image_in_series:  # DCFF case
            tool_opt_command = "tool_opt.exe -D -p csv -i " + image_path
        else:
            tool_opt_command = "tool_opt.exe -p csv -i " + image_path

        LogManager.debug(210, "Running tool_opt with arguments: " + tool_opt_command)
        child = subprocess.Popen(tool_opt_command, stdout=subprocess.PIPE)
        tool_output = child.communicate()[0].decode('ascii').splitlines()
        if "Unsupported print option -D" in tool_output:
            print("ERROR: This version of tool_opt doesn't support dcff files, please use a newer version")
            self.input_data["TOOL_OPT"] = ["", ""]
            return
        if len(tool_output) > 2:  # tool_opt new version start with 2 lines of file path, so we skip them
            tool_output = tool_output[2]
        else:
            tool_output = tool_output[0]

        tool_output_image_data_list = tool_output.split(",")
        self.input_data["TOOL_OPT"] = tool_output_image_data_list

    @abstractmethod
    def parse_counters(self):
        pass

    def write_scenario_results(self):
        thread_lock = threading.Lock()
        with thread_lock:
            self.output_obj.write_scenario(self)

    @staticmethod
    def folder_size(path):
        total = 0
        for entry in os.scandir(path):
            if entry.is_file():
                total += entry.stat().st_size
            elif entry.is_dir():
                total += TestScenario.folder_size(entry.path)
        return total


class WadoScenario(TestScenario):
    def __init__(self, scenario_params, output_obj):
        super().__init__(output_obj)
        self.scenario_params = scenario_params
        self.scenario = scenario_params["Scenario"]
        self.test_number = scenario_params["Test Number"]
        self.loading_type = scenario_params["Loading Type"]
        self.loading_format = scenario_params["Loading Format"]
        self.study_instance_uid = scenario_params["Study Instance UID"]
        self.series_instance_uid = scenario_params["Series Instance UID"]
        self.sop_instance_uid = scenario_params["Sop Instance UID"]
        self.load_level = ""
        self.url = ""
        self.total_time = 0
        self.loading_time = 0
        self.total_images = 0
        self.connect_to_device_time = 0
        self.svwload_time = 0
        self.svwload_reformat_time = 0
        self.send_to_app_pool_time = 0
        self.row_output = {}
        self.input_data = {}
        self.test_passed = True
        self.test_result = "Failed"
        self.status_code = 200

    def copy_constructor(self):
        return WadoScenario(self.scenario_params, self.output_obj)

    def set_scenario(self, value):
        self.scenario = value

    def set_test_number(self, value):
        self.test_number = value

    def set_already_known_output_values(self):
        self.set_known_values_from_test_plan()
        self.set_known_values_from_db()
        self.set_known_values_from_tool_opt()

    def set_known_values_from_test_plan(self):  # initiate the values from test plan that can be achieved before run
        self.row_output["Test Number"] = int(self.test_number)
        self.row_output["Scenario Number"] = int(self.scenario)
        self.row_output["Loading Type"] = self.loading_type
        LogManager.debug(210, "Updated output: \"Test Number\"={}".format(self.row_output["Test Number"]))
        LogManager.debug(210, "Updated output: \"Scenario Number\"={}".format(self.row_output["Scenario Number"]))
        LogManager.debug(210, "Updated output: \"Loading Type\"={}".format(self.row_output["Loading Type"]))

        if self.is_localhost:
            self.row_output["Test Type"] = "Local"
        else:
            self.row_output["Test Type"] = "Remote"
        LogManager.debug(210, "Updated output: \"Test Type\"={}".format(self.row_output["Test Type"]))

        self.row_output["Study Instance UID"] = self.study_instance_uid
        self.row_output["Series Instance UID"] = self.series_instance_uid or "------"
        self.row_output["Sop Instance UID"] = self.sop_instance_uid or "------"
        LogManager.debug(210, "Updated output: \"Study Instance UID\"={}".format(self.row_output["Study Instance UID"]))
        LogManager.debug(210, "Updated output: \"Series Instance UID\"={}".format(self.row_output["Series Instance UID"]))
        LogManager.debug(210, "Updated output: \"Sop Instance UID\"={}".format(self.row_output["Sop Instance UID"]))

        if self.sop_instance_uid != "":
            self.load_level = "Image"
        elif self.series_instance_uid != "":
            self.load_level = "Series"
        else:
            self.load_level = "Study"
        self.row_output["Loading Level"] = self.load_level
        LogManager.debug(210, "Updated output: \"Loading Level\"={}".format(self.row_output["Loading Level"]))

    def set_known_values_from_db(self):
        if "STUDY" in self.input_data and self.input_data["STUDY"]:
            extra_study_information = self.input_data["STUDY"]
            self.row_output["Modality"] = extra_study_information["STUDY_MODALITY"]
            self.row_output["Series in Study"] = extra_study_information["NUMBER_OF_STUDY_SERIES"]
            self.row_output["Images in Study"] = extra_study_information["NUMBER_OF_STUDY_IMAGES"]
            LogManager.debug(210, "Updated output: \"Modality\"={}".format(self.row_output["Modality"]))
            LogManager.debug(210, "Updated output: \"Series in Study\"={}".format(self.row_output["Series in Study"]))
            LogManager.debug(210, "Updated output: \"Images in Study\"={}".format(self.row_output["Images in Study"]))

            if self.series_instance_uid in ["", "*"]:
                self.row_output["Images in Series"] = "------"
            else:
                extra_series_information = self.input_data["SERIES"]
                self.row_output["Images in Series"] = extra_series_information["NUMBER_OF_SERIES_IMAGES"]
            LogManager.debug(210, "Updated output: \"Images in Series\"={}".format(self.row_output["Images in Series"]))

        if "HCFF" in self.input_data and self.input_data["HCFF"]:
            hcff_info = self.get_hcff_info(self.input_data["HCFF"])
            self.row_output["Number of HCFFs"] = hcff_info[0]
            self.row_output["All HCFFs Sizes [KB]"] = hcff_info[1]
            self.row_output["HCFFs Total Size [KB]"] = hcff_info[2]
            self.row_output["HCFF Avg Size [KB]"] = hcff_info[3]
            LogManager.debug(210, "Updated output: \"Number of HCFFs\"={}".format(self.row_output["Number of HCFFs"]))
            LogManager.debug(210,
                             "Updated output: \"All HCFFs Sizes [KB]\"={}".format(self.row_output["All HCFFs Sizes [KB]"]))
            LogManager.debug(210, "Updated output: \"HCFFs Total Size [KB]\"={}".format(
                self.row_output["HCFFs Total Size [KB]"]))
            LogManager.debug(210, "Updated output: \"HCFF Avg Size [KB]\"={}".format(self.row_output["HCFF Avg Size [KB]"]))

    def set_known_values_from_tool_opt(self):
        if self.is_localhost and "TOOL_OPT" in self.input_data:
            tool_opt_info = self.input_data["TOOL_OPT"]
            self.row_output["Image Compression Type on Disk"] = tool_opt_info[1]
            LogManager.debug(210, "Updated output: \"Image Compression Type on Disk\"={}".format(self.row_output["Image Compression Type on Disk"]))

            if self.load_level == "Study":
                self.row_output["Actual Size [KB]"] = int(self.folder_size(self.row_output["Study Physical Path"]) / 1000)
            if self.load_level == "Series":
                series_db_uid = self.input_data["SERIES"]["SERIES_DB_UID"]
                self.row_output["Actual Size [KB]"] = int(self.folder_size(self.row_output["Study Physical Path"] + "\\" + str(series_db_uid)) / 1000)
            if self.load_level == "Image":
                series_db_uid = self.input_data["SERIES"]["SERIES_DB_UID"]

                sop_info = self.db_layer.get_sop_information(self.sop_instance_uid)
                if len(sop_info) == 0:
                    LogManager.error(210, "Please verify that sop instance uid {} is exist".format(self.sop_instance_uid))
                    return False
                sop_db_uid = sop_info["ALL_IMAGE_LOCATIONS_FULL"]
                sop_path = self.row_output["Study Physical Path"].replace("\\", "/", 1) + "/" + str(series_db_uid) + "/" + str(sop_db_uid) + ".img"
                if os.path.exists(sop_path):
                    self.row_output["Actual Size [KB]"] = os.stat(sop_path).st_size / 1000
                else:
                    self.row_output["Actual Size [KB]"] = "------"
                    LogManager.debug(210, "Can't find Actual Size for dcff file: " + str(sop_path))
            LogManager.debug(210, "Updated output: \"Actual Size [KB]\"={}".format(self.row_output["Actual Size [KB]"]))
        else:
            self.row_output["Image Compression Type on Disk"] = "------"
            self.row_output["Actual Size [KB]"] = "------"

    def create_input_data(self):
        all_series = self.get_study_information()
        if not all_series:
            return False
        series_info = self.get_series_information(all_series)
        if not series_info:
            return False
        if not self.get_hcff_files_information(series_info):
            LogManager.error(210, "Failed to fet HCFF info")
            return False
        LogManager.info(210, "Input data was created successfully")
        return True

    def get_study_information(self):
        study_info = self.input_data["STUDY"] = self.db_layer.get_study_information(self.study_instance_uid)
        all_series = self.input_data["ALL_SERIES"] = self.db_layer.get_series_of_study(self.study_instance_uid)
        if len(study_info) == 0:
            LogManager.error(210, "get_study_information returned an empty result, please verify that the requested info exists in the database")
            return False
        if len(all_series) == 0:
            LogManager.error(210, "get_series_of_study returned an empty result, please verify that the requested info exists in the database")
            return False
        return all_series

    def get_series_information(self, all_series):
        if self.series_instance_uid == "":
            unused_series_uid = all_series[0]["SERIES_INSTANCE_UID"]  # We need the series only to get the images path
            series_info = self.input_data["SERIES"] = self.db_layer.get_series_information(unused_series_uid)
        else:
            series_info = self.input_data["SERIES"] = self.db_layer.get_series_information(self.series_instance_uid)

        if len(series_info) == 0:
            LogManager.error(210, "get_series_information returned an empty result, please verify that the requested info exists in the database")
            return False
        return series_info

    def get_hcff_files_information(self, series_info):
        hcff_info = self.input_data["HCFF"] = self.db_layer.get_hcff_files(self.study_instance_uid)
        if len(hcff_info) == 0:
            LogManager.error(210, "get_hcff_files returned an empty result, please verify that the requested info exists in the database")
            return False
        self.row_output["Study Physical Path"] = hcff_info["DIRECTORY_PATH"]

        if self.is_localhost:
            study_directory_content = [x[0] for x in os.walk(hcff_info["DIRECTORY_PATH"])]
            if len(study_directory_content) == 0:
                LogManager.error(210, "study_directory_content is empty, no files in the given path")
                return False
            study_directory_content.pop(0)  # We remove the root directory since we want only the series folders
            self.get_tool_opt_info(study_directory_content, series_info)
        else:
            self.row_output["Actual Size [KB]"] = "------"
        return True

    def check_validity(self):
        if self.loading_type == "pixeldata":
            self.loading_type = "pixel data"
        if self.loading_type == "meta data":
            self.loading_type = "metadata"
        if self.loading_type not in ["metadata", "pixel data"]:
            LogManager.error(210, f"Invalid test plan (scenario {self.scenario}): Loading type must be \"metadata\" or \"pixel data\" only")
            return False
        if self.loading_type == "pixel data" and self.loading_format.lower() in ["xml", "json"] \
                or self.loading_type == "metadata" and self.loading_format.lower() not in ["xml", "json"]:
            LogManager.error(210, f"Invalid test plan (scenario {self.scenario}): mismatch between loading format and loading data - metadata should be only JSON or XML, and pixel data should be only transfer syntax")
            return False
        if self.study_instance_uid == "":
            LogManager.error(210, f"Invalid test plan (scenario {self.scenario}): Study instance UID is a mandatory field")
            return False
        return True

    async def run_test(self, series_num=1):
        LogManager.debug(210, "Start running test")
        self.set_already_known_output_values()  # Take from test plan the values that are already known and update them in the output values
        if not self.test_passed:
            self.status_code = 0
            self.row_output["Test Result"] = self.test_result
            self.write_scenario_results()
            return False

        # Important note! When running asynchronously the logs might be cleared before the previous task read them, so performance counter will *not* be calculated correctly.
        if not self.is_parallel:
            LogManager.debug(210, "Cleaning logs SVWLOAD.log and WadoRS.log")
            try:
                open(os.path.expandvars('%imaginet_log_dir%\\SVWLOAD.log'), 'w').close()  # clean SVWLOAD logs
                open(os.path.expandvars('%imaginet_log_dir%\\WadoRS.log'), 'w').close()  # clean WadoRS logs
            except BaseException as e:
                LogManager.error(210, "Failed to clean log files due to the following error: {}. As a result, performance counter might be incorrect!".format(str(e)))

        print(f"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SCENARIO: {self.scenario} (Series No.{series_num}) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

        if self.loading_format == "" and self.loading_type == "pixel data":
            LogManager.info(210, "Loading format is empty, using default transfer syntax")

        wado_header, output_extension = self.build_headers()
        wado_url = self.build_url()

        running_status = await self.send_request(wado_url, output_extension, wado_header)
        if not running_status:
            LogManager.error(210, "send_request returned false. Stop running test")
            self.test_passed = False
            self.write_scenario_results()
            return False

        if not self.is_localhost or self.is_parallel:
            print("\nSkipping parse_counters since not running via local PACS or that scenario is running in parallel mode")
            self.row_output["Connect To Device [millisec]"] = "------"
            self.row_output["SVWLoad Time [millisec]"] = "------"
            self.row_output["SVWLoad Reformat [millisec]"] = "------"
            self.row_output["Send Data To AppPool [millisec]"] = "------"
        else:
            print("\nDone running url, start parsing counters")
            LogManager.debug(210, "Done running url, start parsing counters")
            self.parse_counters()

        if self.total_time == 0 or self.loading_time == 0:
            self.row_output["Images per Second"] = 0
            LogManager.warn(210, "Total time is zero so images rate cannot be calculated")
        else:
            if self.load_level == "Study":
                self.row_output["Total Images Loaded"] = self.total_images = self.row_output["Images in Study"]
                self.row_output["Images per Second"] = round((self.total_images / self.total_time) * 1000, 2)
                self.row_output["Images per Second (without first image)"] = "------" if self.is_parallel else round((self.total_images / self.loading_time) * 1000, 2)
            elif self.load_level == "Series":
                self.row_output["Total Images Loaded"] = self.total_images = self.row_output["Images in Series"]
                self.row_output["Images per Second"] = round((self.total_images / self.total_time) * 1000, 2)
                self.row_output["Images per Second (without first image)"] = "------" if self.is_parallel else round((self.total_images / self.loading_time) * 1000, 2)
            else:  # At image level the total time is the time took to load the single image
                self.row_output["Total Images Loaded"] = self.total_images = 1
                self.row_output["Images per Second"] = round((self.total_images / self.total_time) * 1000, 2)
                self.row_output["Images per Second (without first image)"] = "------" if self.is_parallel else round((self.total_images / self.loading_time) * 1000, 2)

        LogManager.debug(210, "Updated output: \"Connect To Device [millisec]\"={}".format(self.row_output["Connect To Device [millisec]"]))
        LogManager.debug(210, "Updated output: \"SVWLoad Time [millisec]\"={}".format(self.row_output["SVWLoad Time [millisec]"]))
        LogManager.debug(210, "Updated output: \"SVWLoad Reformat [millisec]\"={}".format(self.row_output["SVWLoad Reformat [millisec]"]))
        LogManager.debug(210, "Updated output: \"Send Data To AppPool [millisec]\"={}".format(self.row_output["Send Data To AppPool [millisec]"]))
        LogManager.debug(210, "Updated output: \"Images per Second\"={}".format(self.row_output["Images per Second"]))
        LogManager.debug(210, "Updated output: \"Images per Second (without first image)\"={}".format(self.row_output["Images per Second (without first image)"]))
        LogManager.debug(210, "Updated output: \"Total Images Loaded\"={}".format(self.row_output["Total Images Loaded"]))

        self.test_passed = True
        self.write_scenario_results()
        return True

    def build_headers(self):
        if self.loading_format.lower() == "xml":
            request_header = "multipart/related;type=\"application/dicom+xml\""  # "XML"
            output_extension = "xml"
            self.row_output["Loading Format"] = "xml"
        elif self.loading_format.lower() == "json":
            request_header = "application/json"  # "JSON"
            output_extension = "json"
            self.row_output["Loading Format"] = "json"
        else:
            request_header = "multipart/related;type=\"application/dicom\";transfer-syntax=\"{}\"".format(self.loading_format)  # "DICOM"
            output_extension = "dcm"
            self.row_output["Loading Format"] = self.loading_format if self.loading_format != "" else "Default TX"
        LogManager.debug(210, "Updated output: \"Loading Format\"={}".format(self.row_output["Loading Format"]))
        return request_header, output_extension

    def build_url(self):
        LogManager.debug(210, "Start building Wado url")
        base_url_prefix = "http://{}/WadoRS/WadoRS.svc/{}/studies/".format(self.request_params.ip, self.request_params.ae_title)
        if self.request_params.credentials.method.lower() == "openid":
            base_url_suffix = "?scope=openid&id_token={}".format(self.request_params.credentials.id_token)
        else:
            base_url_suffix = "?user_name={}&password={}".format(self.request_params.credentials.username, self.request_params.credentials.password)
        if self.request_params.caching == "true":
            base_url_suffix += "&cache=true"
        metadata = ""
        if self.loading_type == "metadata":
            metadata = "/metadata"
        series = ""
        if len(self.series_instance_uid) > 1:
            series = "/series/{}".format(self.series_instance_uid)
        url = base_url_prefix + self.study_instance_uid + series + metadata + base_url_suffix
        self.url = url
        self.row_output["URL"] = self.url
        LogManager.debug(210, "Resulted url: " + url)
        return url

    async def send_request(self, url, extension, request_header):
        print("Start sending request with url: " + url)
        LogManager.info(210, "Start sending request with url: " + url)
        headers = {"Accept": request_header}
        print("Request headers: " + ", ".join(x[0] + ": " + x[1] for x in list(headers.items())))
        LogManager.info(210, "Request headers: " + ", ".join(x[0] + ": " + x[1] for x in list(headers.items())))

        response_data, response, error, time_obj = await self.async_get(url, headers)

        self.row_output["Loaded Size [KB]"] = len(response_data) / 1000
        LogManager.debug(210, "Updated output: \"Loaded Size [KB]\"={}".format(self.row_output["Loaded Size [KB]"]))

        if len(response_data) == 0:
            LogManager.error(210, "No data was loaded, response content is empty")
            self.row_output["Test Result"] = self.test_result = "No Data"
            self.row_output["HTTP Code"] = self.status_code = 204
            return False
        elif error != "":
            LogManager.error(210, "Response failed to return from the server")
            self.row_output["Test Result"] = self.test_result = error
            self.row_output["HTTP Code"] = self.status_code = 500
            return False
        elif response.reason == "Service Unavailable":
            print("ERROR: WadoRS application pool is turned off or not responding. Try to recycle the app pool\n")
            LogManager.error(210, "ERROR: WadoRS application pool is turned off or not responding. Try to recycle the app pool\n")
            self.row_output["Test Result"] = self.test_result = "Application pool is down"
            self.row_output["HTTP Code"] = self.status_code = 500
            return False
        elif response.status != 200:  # other error
            print("ERROR: send_request failed! Error: {} (Status: {})\n".format(response.status, response.reason))
            LogManager.error(210, "ERROR: send_request failed! Error: {} (Status: {})\n".format(self.status_code, response.reason))
            self.row_output["Test Result"] = self.test_result = response.reason
            self.row_output["HTTP Code"] = self.status_code = response.status
            return False
        else:
            self.row_output["Test Result"] = self.test_result = "Succeeded"
            self.row_output["HTTP Code"] = self.status_code = response.status

        if time_obj is None:
            LogManager.error(210, "Time object could not be initialized, probably because error in receiving the response")
            return False
        self.row_output["Loading Time [millisec]"] = self.loading_time = time_obj.transfer_data_time()
        self.row_output["Time to First Image [millisec]"] = "------" if self.is_parallel else time_obj.time_to_first_chunk()
        LogManager.debug(210, "Updated output: \"Loading Time [millisec]\"={}".format(self.row_output["Loading Time [millisec]"]))
        LogManager.debug(210, "Updated output: \"Time to First Image [millisec]\"={}".format(self.row_output["Time to First Image [millisec]"]))

        end_time_str = time_obj.time_as_string(time_obj.request_end_time)
        total_time = time_obj.request_time()

        print("Test: {}, Scenario: {}, StartTime: {}".format(self.test_number, self.scenario, time_obj.time_as_string(time_obj.request_start_time)))
        print("Test: {}, Scenario: {}, EndTime: {}".format(self.test_number, self.scenario, end_time_str))
        print("Test: {}, Scenario: {}, TotalTime: {} ms".format(self.test_number, self.scenario, total_time))
        LogManager.info(210, "Test: {}, Scenario: {}, StartTime: {}".format(self.test_number, self.scenario, time_obj.time_as_string(time_obj.request_start_time)))
        LogManager.info(210, "Test: {}, Scenario: {}, EndTime: {}".format(self.test_number, self.scenario, end_time_str))
        LogManager.info(210, "Test: {}, Scenario: {}, TotalTime: {} ms".format(self.test_number, self.scenario, total_time))
        self.row_output["Total Time [millisec]"] = self.total_time = total_time
        self.row_output["Loading Time Ratio"] = self.loading_time / self.total_time
        LogManager.debug(210, "Updated output: \"Total Time [millisec]\"={}".format(self.row_output["Total Time [millisec]"]))
        LogManager.debug(210, "Updated output: \"Loading Time Ratio\"={}".format(self.row_output["Loading Time Ratio"]))
        LogManager.info(210, "URL responded {} ({})".format(response.status, response.reason))

        self.row_output["Valid Response"] = "------"
        if self.response_output_path != "":
            path = self.export_response_output(end_time_str, response_data, extension)
            self.validate_response_format(path)

        self.row_output["Loading Rate [MB/sec]"] = self.row_output["Loaded Size [KB]"] / self.row_output["Total Time [millisec]"]  # No need to normalize, same as 1000kb/1000ms
        self.row_output["Loading Rate (without first image) [MB/sec]"] = "------" if self.is_parallel else (self.row_output["Loaded Size [KB]"] / self.row_output["Loading Time [millisec]"])  # No need to normalize, same as 1000kb/1000ms
        LogManager.debug(210, "Updated output: \"Loading Rate [MB/sec]\"={}".format(self.row_output["Loading Rate [MB/sec]"]))
        LogManager.debug(210, "Updated output: \"Loading Rate (without first image) [MB/sec]\"={}".format(self.row_output["Loading Rate (without first image) [MB/sec]"]))
        return True

    def validate_response_format(self, file):
        extension = os.path.splitext(file)[1]
        if extension in [".json", ".xml"]:
            if extension == ".json":
                parsed = self.validate_json_format(file)
            else:
                parsed = self. validate_xml_format(file)
            if parsed:
                self.row_output["Valid Response"] = "Valid"
            else:
                self.row_output["Valid Response"] = "Invalid"
        else:
            self.row_output["Valid Response"] = "------"


    def parse_counters(self):
        log_file_path = "%imaginet_log_dir%\\SVWLOAD.log"
        log_file_path_exp = os.path.expandvars(log_file_path)
        loading_reformat = []
        comm_images = []
        db_override_tags_loop = []
        loading_with_hcff = []
        hcff_query_counter = []
        throughput_image_load = []

        try:
            with open(log_file_path_exp) as fp:
                line = fp.readline()
                cnt = 1
                while line:
                    try:
                        if re.match("^.+,Name=(Loading_reformat.*),sample_time=(.+),.+,.+,.+$", line):
                            line_result = re.match("^.+,Name=(Loading_reformat.*),sample_time=(.+),.+,.+,.+$", line)
                            # print("Counter: {}, Time: {}".format(line_result.group(1), line_result.group(2)))
                            loading_reformat.append(float(line_result.group(2)))
                        if re.match("^.+,Name=(Comm-Images),sample_time=(.+),.+,.+,.+$", line):
                            line_result = re.match("^.+,Name=(Comm-Images),sample_time=(.+),.+,.+,.+$", line)
                            # print("Counter: {}, Time: {}".format(line_result.group(1), line_result.group(2)))
                            comm_images.append(float(line_result.group(2)))
                        if re.match("^.+,Name=(DB_override_tags_loop),sample_time=(.+),.+,.+,.+$", line):
                            line_result = re.match("^.+,Name=(DB_override_tags_loop),sample_time=(.+),.+,.+,.+$", line)
                            # print("Counter: {}, Time: {}".format(line_result.group(1), line_result.group(2)))
                            db_override_tags_loop.append(float(line_result.group(2)))
                        if re.match("^.+,Name=(Loading_with_hcff),sample_time=(.+),.+,.+,.+$", line):
                            line_result = re.match("^.+,Name=(Loading_with_hcff),sample_time=(.+),.+,.+,.+$", line)
                            # print("Counter: {}, Time: {}".format(line_result.group(1), line_result.group(2)))
                            loading_with_hcff.append(float(line_result.group(2)))
                        if re.match("^.+,Name=(Hcff_query_counter),sample_time=(.+),.+,.+,.+$", line):
                            line_result = re.match("^.+,Name=(Hcff_query_counter),sample_time=(.+),.+,.+,.+$", line)
                            # print("Counter: {}, Time: {}".format(line_result.group(1), line_result.group(2)))
                            hcff_query_counter.append(float(line_result.group(2)))
                        if re.match("^.+,Name=(Throughput Image Load),sample_time=(.+),.+,.+,.+$", line):
                            line_result = re.match("^.+,Name=(Throughput Image Load),sample_time=(.+),.+,.+,.+$", line)
                            # print("Counter: {}, Time: {}".format(line_result.group(1), line_result.group(2)))
                            throughput_image_load.append(float(line_result.group(2)))
                    except TypeError as e:
                        LogManager.error(210, "Exception {} on {}. It can rarely happen when two log lines are written at the same time to the same line.".format(e, line_result.group(2)))
                    line = fp.readline()
                    cnt += 1
        except IOError:
            LogManager.error(210, "Failed to open or read " + log_file_path_exp)

        log_file_path = "%imaginet_log_dir%\\WadoRS.log"
        log_file_path_exp = os.path.expandvars(log_file_path)
        connect = []
        try:
            with open(log_file_path_exp) as fp:
                line = fp.readline()
                cnt = 1
                while line:
                    # print("Line {}".format(cnt))
                    if re.match("^.+,Name=(connect),sample_time=(.+),.+,.+,.+$", line):
                        line_result = re.match("^.+,Name=(connect),sample_time=(.+),.+,.+,.+$", line)
                        # print("Counter: {}, Time: {}".format(line_result.group(1),lineResult.group(2)))
                        connect.append(float(line_result.group(2)))
                    line = fp.readline()
                    cnt += 1
        except IOError:
            LogManager.error(210, "Failed to open or read " + log_file_path_exp)

        self.connect_to_device_time = sum(connect) / 1000.0
        self.svwload_time = (sum(db_override_tags_loop) + sum(throughput_image_load) + sum(loading_with_hcff)) / 1000.0
        self.svwload_reformat_time = sum(loading_reformat) / 1000.0
        self.send_to_app_pool_time = sum(comm_images) / 1000.0
        self.row_output["Connect To Device [millisec]"] = self.connect_to_device_time
        self.row_output["SVWLoad Time [millisec]"] = self.svwload_time
        self.row_output["SVWLoad Reformat [millisec]"] = self.svwload_reformat_time
        self.row_output["Send Data To AppPool [millisec]"] = self.send_to_app_pool_time
        LogManager.info(210, "Done parsing counters")
        print("Done parsing counters")
        print("=====================================================================================================================================================================")


class QidoScenario(TestScenario):
    def __init__(self, scenario_params, output_obj):
        super().__init__(output_obj)
        self.scenario_params = scenario_params
        self.scenario = scenario_params["Scenario"]
        self.test_number = scenario_params["Test Number"]
        self.limit = scenario_params["Limit"]
        self.response_format = scenario_params["Response Format"]
        self.query_level = scenario_params["Query Level"]
        self.study_instance_uid = scenario_params["Study Instance UID"]
        self.series_instance_uid = scenario_params["Series Instance UID"]
        if "Include Fields" not in scenario_params or not scenario_params["Include Fields"]:  # None or empty
            self.include_fields = ""
        else:
            self.include_fields = scenario_params["Include Fields"]
        if "Additional Filters" not in scenario_params or not scenario_params["Additional Filters"]:  # None or empty
            self.additional_filters = ""
        else:
            self.additional_filters = scenario_params["Additional Filters"]
        self.url = ""
        self.total_time = 0
        self.row_output = {}
        self.input_data = {}
        self.test_passed = False
        self.test_result = "Failed"
        self.status_code = 200

    def copy_constructor(self):
        return QidoScenario(self.scenario_params, self.output_obj)

    def set_scenario(self, value):
        self.scenario = value

    def set_test_number(self, value):
        self.test_number = value

    def set_already_known_output_values(self):
        self.row_output["Test Number"] = int(self.test_number)
        self.row_output["Scenario Number"] = int(self.scenario)
        self.row_output["Query Level"] = self.query_level
        self.row_output["Response Format"] = self.response_format
        LogManager.debug(210, "Updated output: \"Test Number\"={}".format(self.row_output["Test Number"]))
        LogManager.debug(210, "Updated output: \"Scenario Number\"={}".format(self.row_output["Scenario Number"]))
        LogManager.debug(210, "Updated output: \"Query Level\"={}".format(self.row_output["Query Level"]))
        LogManager.debug(210, "Updated output: \"Response Format\"={}".format(self.row_output["Response Format"]))

        self.row_output["Study Instance UID"] = self.study_instance_uid or "------"
        self.row_output["Series Instance UID"] = self.series_instance_uid or "------"
        LogManager.debug(210, "Updated output: \"Study Instance UID\"={}".format(self.row_output["Study Instance UID"]))
        LogManager.debug(210, "Updated output: \"Series Instance UID\"={}".format(self.row_output["Series Instance UID"]))

        # We need to set them as a list on the first time, so if we will choose those scenarios again they will already be a list
        if not isinstance(self.include_fields, list):
            self.include_fields = [f.replace(" ", "") for f in self.include_fields.split(";") if f != ""]
        if not isinstance(self.additional_filters, list):
            self.additional_filters = [f.replace(" ", "") for f in self.additional_filters.split(";") if f != ""]

        if self.is_localhost:
            self.row_output["Test Type"] = "Local"
        else:
            self.row_output["Test Type"] = "Remote"
        LogManager.debug(210, "Updated output: \"Test Type\"={}".format(self.row_output["Test Type"]))

    def create_input_data(self):
        return True

    def check_validity(self):
        if self.limit != "":
            try:
                int(self.limit)
            except ValueError:
                LogManager.error(210, "Limit value is not an integer")
                return False
        if self.query_level not in ["studies", "series", "instances", "patients"]:
            LogManager.error(210, f"Invalid test plan (scenario {self.scenario}): query level must be \"studies\", \"series\", \"instances\" or \"patients\"")
            return False
        if self.response_format not in ["xml", "json"]:
            LogManager.error(210, f"Invalid test plan (scenario {self.scenario}): response format must be \"xml\" or \"json\" only")
            return False
        return True

    async def run_test(self, series_num=1):
        LogManager.debug(210, "Start running test")
        self.set_already_known_output_values()  # Take from test plan the values that are already known and update them in the output values
        if self.test_result == "Invalid test plan" or self.test_result == "Not in DB":
            self.status_code = 0
            self.row_output["Test Result"] = self.test_result
            self.write_scenario_results()
            return False

        print(f"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ SCENARIO: {self.scenario} ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
        qido_header, output_extension = self.build_headers()
        qido_url = self.build_url()
        running_status = await self.send_request(qido_url, output_extension, qido_header)

        if not running_status:
            LogManager.error(210, "send_request returned false. Stop running test")
            self.test_passed = False
            self.write_scenario_results()
            return False
        self.test_passed = True
        self.write_scenario_results()
        return True

    def build_headers(self):
        if self.response_format.lower() == "xml":
            request_header = "multipart/related;type=\"application/dicom+xml\""  # "XML"
            output_extension = "xml"
            self.row_output["Response Format"] = "xml"
        elif self.response_format.lower() == "json":
            request_header = "application/json"  # "JSON"
            output_extension = "json"
            self.row_output["Response Format"] = "json"
        else:
            LogManager.warn(210, "Invalid response format: {}".format(self.response_format))
            request_header = ""
            output_extension = "txt"
            self.row_output["Response Format"] = "Invalid"
        LogManager.debug(210, "Updated output: \"Response Format\"={}".format(self.row_output["Response Format"]))
        return request_header, output_extension

    def build_url(self):
        LogManager.debug(210, "Start building Qido url")
        base_url_prefix = "http://{}/QidoRS/qidors.svc/{}".format(self.request_params.ip, self.request_params.ae_title)
        if self.request_params.credentials.method.lower() == "openid":
            base_url_suffix = "?scope=openid&id_token={}".format(self.request_params.credentials.id_token)
        else:
            base_url_suffix = "?user_name={}&password={}".format(self.request_params.credentials.username, self.request_params.credentials.password)
        study_end_point, series_end_point = "", ""
        end_point = self.request_params.ae_title
        if self.study_instance_uid != "" and self.query_level in ["series", "instances"]:
            study_end_point = "/studies/" + self.study_instance_uid
            end_point += "/studies/<studyuid>"
            if self.series_instance_uid != "" and self.query_level == "instances":
                series_end_point = "/series/" + self.series_instance_uid
                end_point += "/series/<seriesuid>"
        end_point += "/" + self.query_level
        print(end_point)
        self.row_output["End Point"] = end_point
        url = base_url_prefix + study_end_point + series_end_point + "/" + self.query_level + base_url_suffix
        if self.limit != "":
            url += "&limit={}".format(self.limit)

        for field in self.include_fields:
            url += f"&includeField={field}"

        for filter_param in self.additional_filters:
            url += f"&{filter_param}"

        self.row_output["URL"] = self.url = url
        LogManager.debug(210, "Resulted url: " + url)
        return url

    async def send_request(self, url, extension, request_header):
        print("Start sending request with url: " + url)
        LogManager.info(210, "Start sending request with url: " + url)
        headers = {"Accept": request_header}
        print("Request headers: ", ", ".join(x[0] + ": " + x[1] for x in list(headers.items())))
        LogManager.info(210, "Request headers: ", ", ".join(x[0] + ": " + x[1] for x in list(headers.items())))

        response_data, response, error, time_obj = await self.async_get(url, headers)

        self.row_output["Response Bytes"] = len(response_data)
        LogManager.debug(210, "Updated output: \"Response Bytes\"={}".format(self.row_output["Response Bytes"]))

        if len(response_data) == 0:
            LogManager.error(210, "No data was loaded, response content is empty")
            self.row_output["Test Result"] = self.test_result = "No Data"
            self.row_output["HTTP Code"] = self.status_code = 204
            return False
        elif error != "":
            LogManager.error(210, "Response failed to return from the server")
            self.row_output["Test Result"] = self.test_result = error
            self.row_output["HTTP Code"] = self.status_code = "500"
            return False
        elif response.reason == "Service Unavailable":
            print("ERROR: QidoRS application pool is turned off or not responding. Try to recycle the app pool\n")
            LogManager.error(210, "ERROR: QidoRS application pool is turned off or not responding. Try to recycle the app pool\n")
            self.row_output["Test Result"] = self.test_result = "Application pool is down"
            self.row_output["HTTP Code"] = self.status_code = "500"
            return False
        elif response.status != 200:  # other error
            print("ERROR: send_request failed! Error: {} (Status: {})\n".format(self.status_code, response.reason))
            LogManager.error(210, "ERROR: send_request failed! Error: {} (Status: {})\n".format(self.status_code, response.reason))
            self.row_output["Test Result"] = self.test_result = response.reason
            self.row_output["HTTP Code"] = self.status_code = response.status
            return False
        else:
            self.row_output["Test Result"] = self.test_result = "Succeeded"
            self.row_output["HTTP Code"] = self.status_code = response.status

        if time_obj is None:
            LogManager.error(210, "Time object could not be initialized, probably because error in receiving the response")
            return False
        end_time_str = time_obj.time_as_string(time_obj.request_end_time)
        total_time = time_obj.request_time()
        print("Test: {}, Scenario: {}, StartTime: {}".format(self.test_number, self.scenario, time_obj.time_as_string(time_obj.request_start_time)))
        print("Test: {}, Scenario: {}, EndTime: {}".format(self.test_number, self.scenario, end_time_str))
        print("Test: {}, Scenario: {}, TotalTime: {} ms".format(self.test_number, self.scenario, total_time))
        LogManager.info(210, "Test: {}, Scenario: {}, StartTime: {}".format(self.test_number, self.scenario, time_obj.time_as_string(time_obj.request_start_time)))
        LogManager.info(210, "Test: {}, Scenario: {}, EndTime: {}".format(self.test_number, self.scenario, end_time_str))
        LogManager.info(210, "Test: {}, Scenario: {}, TotalTime: {} ms".format(self.test_number, self.scenario, total_time))

        self.row_output["Total Milliseconds"] = self.total_time = total_time
        self.row_output["Rate [MB/sec]"] = self.row_output["Response Bytes"] / self.row_output["Total Milliseconds"]  # No need to normalize, same as 1000kb/1000ms
        LogManager.debug(210, "Updated output: \"Total Milliseconds\"={}".format(self.row_output["Total Milliseconds"]))
        LogManager.debug(210, "Updated output: \"Rate [MB/sec]\"={}".format(self.row_output["Rate [MB/sec]"]))
        LogManager.info(210, "URL responded {} ({})".format(self.status_code, self.test_result))

        self.row_output["Valid Response"] = "------"
        if self.response_output_path != "":
            path = self.export_response_output(end_time_str, response_data, extension)
            self.validate_response_format(path)

        response_tags = self.get_tags_dict(response_data)
        self.validate_include_field(response_tags)
        self.verify_tag_vr(response_tags)
        return True

    def validate_response_format(self, file):
        extension = os.path.splitext(file)[1]
        if extension in ["json", "xml"]:
            if extension == "json":
                parsed = self.validate_json_format(file)
            else:
                parsed = self. validate_xml_format(file)
            if parsed:
                self.row_output["Valid Response"] = "Valid"
            else:
                self.row_output["Valid Response"] = "Invalid"
        else:
            self.row_output["Valid Response"] = "------"

    def get_tags_dict(self, response_data):
        response_tags = []
        if self.response_format == "json":
            response_tags = QidoScenario.parse_json_response(response_data)
        elif self.response_format == "xml":
            response_tags = QidoScenario.parse_xml_response(response_data)
        else:
            LogManager.error(210, "Unable to parse response format: {}".format(extension))
        return response_tags

    def validate_include_field(self, response_tags):
        self.row_output["Number of Requested Tags"] = "------"
        self.row_output["Requested Tags Received"] = "------"
        self.row_output["Missing Tags"] = "------"

        if len(self.include_fields) != 0:
            tags_failed_to_return = []
            num_of_failed_records = 0
            total_tags_failures = 0
            overall_missing_tags = set()

            for i, request in enumerate(response_tags):
                tags_failed_to_return.clear()
                for given_tag in self.include_fields:
                    if given_tag in DICOM_DICT_BY_TAG_NAME:
                        tag = DICOM_DICT_BY_TAG_NAME[given_tag]
                        tag_number = tag.tag_number.replace("0x", "")
                        if tag_number not in request.keys():
                            tags_failed_to_return.append(tag)
                            overall_missing_tags.add(tag.tag_name)
                if len(tags_failed_to_return) > 0:
                    record_study_uid = "" if "0020000D" not in request else f"<{request['0020000D'].value}>"
                    record_series_uid = "" if "0020000E" not in request else f"<{request['0020000E'].value}>"
                    record_sop_uid = "" if "00080018" not in request else f"<{request['00080018'].value}>"
                    record_identifier = f"({record_study_uid}, {record_series_uid}, {record_sop_uid})"
                    print("Record id {}: failed to return the following tags: {}".format(record_identifier, ", ".join(x.tag_name for x in tags_failed_to_return)))
                    total_tags_failures += len(tags_failed_to_return)
                    num_of_failed_records += 1

            LogManager.info(210, "Records which completed without any loss: {}/{}".format(len(response_tags)-num_of_failed_records, len(response_tags)))
            self.row_output["Number of Requested Tags"] = len(response_tags) * len(self.include_fields)
            self.row_output["Requested Tags Received"] = len(response_tags) * len(self.include_fields) - total_tags_failures
            self.row_output["Missing Tags"] = "------" if not overall_missing_tags else ", ".join(list(overall_missing_tags))
            LogManager.debug(210, "Updated output: \"Number of Requested Tags\"={}".format(self.row_output["Number of Requested Tags"]))
            LogManager.debug(210, "Updated output: \"Requested Tags Received\"={}".format(self.row_output["Requested Tags Received"]))
            LogManager.debug(210, "Updated output: \"Missing Tags\"={}".format(self.row_output["Missing Tags"]))

    def verify_tag_vr(self, response_data):
        non_identical_tags = {}
        for record in response_data:
            for query_tag in record.values():
                if query_tag.tag_number in DICOM_DICT_BY_TAG_NUMBER:
                    source_code_tag = DICOM_DICT_BY_TAG_NUMBER[query_tag.tag_number]
                    if query_tag.vr != source_code_tag.vr:
                        non_identical_tags[query_tag.tag_name] = (query_tag.vr, source_code_tag.vr)
                        print(f"Tag {query_tag.tag_name} has mismatching in VR!! {query_tag.vr} != {source_code_tag.vr}")
        self.row_output["Mismatched VRs"] = "------" if not non_identical_tags else ", ".join(non_identical_tags.keys())

    @staticmethod
    def parse_json_response(data):
        try:
            response_as_dict = loads(data)
        except JSONDecodeError as e:
            LogManager.error(210, "Failed to decode response json - " + str(e), print_to_console_flag=True)
            return []
        all_tags = []

        for record in response_as_dict:  # if we get multiple results
            record_tags = {}
            for tag in record:  # iterating the tags of the record
                tag_info = record[tag]
                tag_vr = tag_info["vr"]
                value_list = tag_info["Value"]
                if len(value_list) == 0:
                    tag_value = ""
                elif tag_vr == "PN":  # PrivateName tag contains another dict with the name format
                    tag_value = value_list[0]["Alphabetic"]
                else:  # if we have multiple values, we concat them
                    tag_value = "/".join(str(x) for x in value_list)

                try:
                    # Get the tag name from pre-defined tags dictionary
                    record_tags[tag] = DicomTagWithValue(DICOM_DICT_BY_TAG_NUMBER["0X{}".format(tag.upper())], tag_value)
                except KeyError:
                    try:
                        # try again, now with lower case
                        record_tags[tag] = DicomTagWithValue(DICOM_DICT_BY_TAG_NUMBER["0x{}".format(tag.lower())], tag_value)
                    except KeyError:
                        LogManager.error(210, "Missing tag from dicom dict. Tag will not be added")

            all_tags.append(record_tags)
        return all_tags

    @staticmethod
    def parse_xml_response(data):
        data = data.decode('utf8')
        guid_delimeter = data[:data.index("\r\n")]
        delimeter = data[:data.index("<?xml")]
        records = data.split(delimeter)
        del records[0]  # remove first item which doesn't contain anything
        last_record = records[-1]
        records[-1] = last_record[:last_record.index(guid_delimeter)]  # remove the guid delimeter from the last record

        all_tags = []
        for record in records:
            record_tags = {}
            root = ET.fromstring(record)  # parse single xml response
            for dicom_tag in root:
                values = []
                for _ in dicom_tag:  # if tag contain multiple values
                    for tag_attribute in dicom_tag:
                        values.append(tag_attribute.text)
                    break
                tag_number = dicom_tag.attrib["tag"]
                tag_vr = dicom_tag.attrib["vr"]
                tag_name = dicom_tag.attrib["keyword"]
                tag_value = "/".join(values)
                for sub_tag in dicom_tag:  # find PersonName tag
                    if "PersonName" in sub_tag.tag:  # find Alphabetic tag
                        full_name = []
                        for pn in sub_tag:
                            if "Alphabetic" in pn.tag:  # build the full name
                                for name in pn:
                                    full_name.append(name.text)
                        full_name = "^".join(full_name)
                        tag_value = full_name
                record_tags[tag_number] = DicomTagWithValue(DicomTag(tag_name, tag_number, tag_vr), tag_value)
            all_tags.append(record_tags)
        return all_tags

    # TODO: implement
    def parse_counters(self):
        pass


class RequestTimeMeasurements:
    def __init__(self):
        self.request_start_time = None
        self.request_end_time = None
        self.download_start_time = None
        self.download_end_time = None

    def request_time(self):
        return (self.request_end_time - self.request_start_time) / datetime.timedelta(milliseconds=1) + 1

    def time_to_first_chunk(self):
        return (self.download_start_time - self.request_start_time) / datetime.timedelta(milliseconds=1) + 1

    def transfer_data_time(self):
        return (self.download_end_time - self.download_start_time) / datetime.timedelta(milliseconds=1) + 1

    @staticmethod
    def time_as_string(time):
        return time.strftime('%Y-%m-%d_%H-%M-%S.%f')[:-3]
