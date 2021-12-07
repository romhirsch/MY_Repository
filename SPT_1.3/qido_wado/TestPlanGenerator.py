"""
Purpose: Creates a custom csv test-plan which is the input for WadoRS or QidoRS testers
Created by Nitzan Shpigel, August 2020
"""

import os
import argparse
import csv
import sys
import threading
from json import JSONDecodeError, load
import random
import AlgoDB
from AlgoLog import LogManager
from abc import ABC, abstractmethod, abstractproperty
import copy


class OracleAccessLayer(object):
    __singleton_lock = threading.Lock()
    __singleton_instance = None
    __oracle_client = None

    def __init__(self, username, password, ip):
        LogManager.init(False)
        connection_string = f"{username}/{password}@//{ip}:1521/mst1"
        self.__oracle_client = AlgoDB.AlgoOracleWrapper(connection_string=connection_string)

    @classmethod
    def instance(cls, username, password, ip):
        if not cls.__singleton_instance:
            with cls.__singleton_lock:
                if not cls.__singleton_instance:
                    cls.__singleton_instance = cls(username, password, ip)
        return cls.__singleton_instance

    def query(self, query):
        thread_lock = threading.Lock()
        with thread_lock:
            results = self.__oracle_client.execute_query(query, timeout=30)
        if len(results) == 0:
            print("No results from DB!")
        return results


class ScenarioLine:
    def __init__(self, columns, writer):
        self.columns = columns
        self.writer = writer

    def write_header(self):
        self.writer.writerow(
            ["Scenario", "Test Number", "Loading Type", "Loading Format", "Study Instance UID", "Series Instance UID",
             "Sop Instance UID", "Study Images", "Series Images", "Modality", "Comment"])

    def write_line(self):
        self.writer.writerow(self.columns.values())


class Test(ABC):
    name = "test"
    test_args = {}
    input_data = []

    def __init__(self, test_args, tests_amount, load_prob_map, input_data):
        self.test_args = test_args
        self.tests_amount = tests_amount
        self.load_prob_map = load_prob_map
        self.input_data = input_data

    def get_file_name(self):
        return self.name + "_test_plan"

    @abstractmethod
    def generate_test(self, writer):
        pass


class StressTest(Test):
    name = "stress"

    def __init__(self, test_args, tests_amount, load_prob_map, input_data):
        super().__init__(test_args, tests_amount, load_prob_map, input_data)
        self.concurrent_limit = self.test_args["concurrent_limit"]
        self.metadata_ratio = self.test_args["metadata_ratio"]
        self.json_ratio = self.test_args["json_ratio"]

    def generate_test(self, writer):
        wrote_headers = False
        scenario_num = 1
        for test in range(1, self.concurrent_limit):
            studies = copy.deepcopy(self.input_data)
            for internal_scenario in range(1, test + 1):
                if len(studies) == 0:
                    print("No more studies to fetch, if you want more results try different filters")
                    break
                rand = random.Random()
                loading_type_rnd = rand.random()
                format_type_rnd = rand.random()
                load_level = random.choices(list(self.load_prob_map.keys()), weights=self.load_prob_map.values(), k=1)[0]
                scenario_line = {}
                scenario_line["scenario_num"] = scenario_num
                scenario_line["test_number"] = test
                scenario_line["loading_type"] = "metadata" if loading_type_rnd < float(self.metadata_ratio) else "pixel data"
                if scenario_line["loading_type"] == "metadata":
                    scenario_line["format_type"] = "JSON" if format_type_rnd < float(self.json_ratio) else "XML"
                else:
                    scenario_line["format_type"] = "1.2.840.10008.1.2"
                pop_study = studies.pop(0)
                scenario_line["study_uid"] = pop_study["STUDY_UID"]
                scenario_line["series_uid"] = pop_study["SERIES_UID"] if load_level != 'study' else ""
                scenario_line["sop_uid"] = pop_study["SOP_UID"] if load_level == 'image'else ""
                scenario_line["study_images"] = pop_study["NUMBER_OF_STUDY_IMAGES"]
                scenario_line["series_images"] = pop_study["NUMBER_OF_SERIES_IMAGES"]
                scenario_line["modality"] = pop_study["STUDY_MODALITY"].strip('\\')
                scenario_line["comment"] = ""
                scenario = ScenarioLine(scenario_line, writer)
                if not wrote_headers:
                    scenario.write_header()
                    wrote_headers = True
                scenario.write_line()
                scenario_num += 1


class SmokeTest(Test):
    name = "smoke"

    def generate_test(self, writer):
        print("TBD - Not implemented")
        raise NotImplementedError


class LogicTest(Test):
    name = "logic"

    def __init__(self, test_args, tests_amount, load_prob_map, input_data):
        super().__init__(test_args, tests_amount, load_prob_map, input_data)
        self.study_pixeldata_ratio = self.test_args["study_pixeldata_ratio"]
        self.series_metadata_ratio = self.test_args["series_metadata_ratio"]
        self.series_pixeldata_ratio = self.test_args["series_pixeldata_ratio"]
        self.json_ratio = self.test_args["json_ratio"]
        self.load_all_series = self.test_args["load_all_series"]

    def generate_test(self, writer):
        wrote_headers = False
        studies = copy.deepcopy(self.input_data)
        scenario_num = 0
        for test in range(1, self.tests_amount):
            if len(studies) == 0:
                print("No more studies to fetch, if you want more results try different filters")
                break
            # Study metadata
            scenario_num += 1
            rand = random.Random()
            format_type_rnd = rand.random()
            scenario_line = {}
            scenario_line["scenario_num"] = scenario_num
            scenario_line["test_number"] = test
            scenario_line["loading_type"] = "metadata"
            scenario_line["format_type"] = "JSON" if format_type_rnd < float(self.json_ratio) else "XML"
            pop_study = studies.pop(0)
            scenario_line["study_uid"] = pop_study["STUDY_UID"]
            scenario_line["series_uid"] = ""
            scenario_line["sop_uid"] = ""
            scenario = ScenarioLine(scenario_line, writer)
            if not wrote_headers:
                scenario.write_header()
                wrote_headers = True
            scenario.write_line()

            # Study pixel data
            if rand.random() < float(self.study_pixeldata_ratio):
                scenario_line = {}
                scenario_num += 1
                test += 1
                scenario_line["scenario_num"] = scenario_num
                scenario_line["test_number"] = test
                scenario_line["loading_type"] = "pixel data"
                scenario_line["format_type"] = "1.2.840.10008.1.2"
                scenario_line["study_uid"] = pop_study["STUDY_UID"]
                scenario_line["series_uid"] = ""
                scenario_line["sop_uid"] = ""
                scenario = ScenarioLine(scenario_line, writer)
                if not wrote_headers:
                    scenario.write_header()
                    wrote_headers = True
                scenario.write_line()

            # Series metadata
            if rand.random() < float(self.series_metadata_ratio):
                scenario_num += 1
                scenario_line = {}
                scenario_line["scenario_num"] = scenario_num
                scenario_line["test_number"] = test
                scenario_line["loading_type"] = "metadata"
                scenario_line["format_type"] = "JSON" if format_type_rnd < float(self.json_ratio) else "XML"
                scenario_line["study_uid"] = pop_study["STUDY_UID"]
                scenario_line["series_uid"] = pop_study["SERIES_UID"]
                scenario_line["sop_uid"] = ""
                scenario = ScenarioLine(scenario_line, writer)
                if not wrote_headers:
                    scenario.write_header()
                    wrote_headers = True
                scenario.write_line()

                # Series pixel data
                if rand.random() < float(self.series_pixeldata_ratio):
                    scenario_line = {}
                    scenario_num += 1
                    test += 1
                    scenario_line["scenario_num"] = scenario_num
                    scenario_line["test_number"] = test
                    scenario_line["loading_type"] = "pixel data"
                    scenario_line["format_type"] = "1.2.840.10008.1.2"
                    scenario_line["study_uid"] = pop_study["STUDY_UID"]
                    scenario_line["series_uid"] = "*" if rand.random() < float(self.load_all_series) else pop_study["SERIES_UID"]
                    scenario_line["sop_uid"] = ""
                    scenario = ScenarioLine(scenario_line, writer)
                    if not wrote_headers:
                        scenario.write_header()
                        wrote_headers = True
                    scenario.write_line()


class ParallelTest(Test):
    name = "parallel"

    def __init__(self, test_args, tests_amount, load_prob_map, input_data):
        super().__init__(test_args, tests_amount, load_prob_map, input_data)
        self.concurrent_limit = self.test_args["concurrent_limit"]
        self.metadata_ratio = self.test_args["metadata_ratio"]
        self.json_ratio = self.test_args["json_ratio"]

    def generate_test(self, writer):
        wrote_headers = False
        studies = copy.deepcopy(self.input_data)
        for scenario_num in range(1, self.concurrent_limit + 1):
            if len(studies) == 0:
                print("No more studies to fetch, if you want more results try different filters")
                break
            pop_study = studies.pop(0)
            rand = random.Random()
            loading_type_rnd = rand.random()
            format_type_rnd = rand.random()
            load_level = random.choices(list(self.load_prob_map.keys()), weights=self.load_prob_map.values(), k=1)[0]
            scenario_line = {}
            scenario_line["scenario_num"] = scenario_num
            scenario_line["test_number"] = 1
            scenario_line["loading_type"] = "metadata" if loading_type_rnd < float(self.metadata_ratio) else "pixel data"
            if scenario_line["loading_type"] == "metadata":
                scenario_line["format_type"] = "JSON" if format_type_rnd < float(self.json_ratio) else "XML"
            else:
                scenario_line["format_type"] = "1.2.840.10008.1.2"
            scenario_line["study_uid"] = pop_study["STUDY_UID"]
            scenario_line["series_uid"] = pop_study["SERIES_UID"] if load_level != 'study' else ""
            scenario_line["sop_uid"] = pop_study["SOP_UID"] if load_level == 'image' else ""
            scenario_line["study_images"] = pop_study["NUMBER_OF_STUDY_IMAGES"]
            scenario_line["series_images"] = pop_study["NUMBER_OF_SERIES_IMAGES"]
            scenario_line["modality"] = pop_study["STUDY_MODALITY"].strip('\\')
            scenario_line["comment"] = ""
            scenario = ScenarioLine(scenario_line, writer)
            if not wrote_headers:
                scenario.write_header()
                wrote_headers = True
            scenario.write_line()


class SequentialTest(Test):
    name = "sequential"

    def __init__(self, test_args, tests_amount, load_prob_map, input_data):
        super().__init__(test_args, tests_amount, load_prob_map, input_data)
        self.metadata_ratio = self.test_args["metadata_ratio"]
        self.json_ratio = self.test_args["json_ratio"]

    def generate_test(self, writer):
        wrote_headers = False
        studies = copy.deepcopy(self.input_data)
        for test in range(1, self.tests_amount):
            if len(studies) == 0:
                print("No more studies to fetch, if you want more results try different filters")
                break
            pop_study = studies.pop(0)
            rand = random.Random()
            loading_type_rnd = rand.random()
            format_type_rnd = rand.random()
            load_level = random.choices(list(self.load_prob_map.keys()), weights=self.load_prob_map.values(), k=1)[0]
            scenario_line = {}
            scenario_line["scenario_num"] = test
            scenario_line["test_number"] = test
            scenario_line["loading_type"] = "metadata" if loading_type_rnd < float(self.metadata_ratio) else "pixel data"
            if scenario_line["loading_type"] == "metadata":
                scenario_line["format_type"] = "JSON" if format_type_rnd < float(self.json_ratio) else "XML"
            else:
                scenario_line["format_type"] = "1.2.840.10008.1.2"
            scenario_line["study_uid"] = pop_study["STUDY_UID"]
            scenario_line["series_uid"] = pop_study["SERIES_UID"] if load_level != 'study' else ""
            scenario_line["sop_uid"] = pop_study["SOP_UID"] if load_level == 'image' else ""
            scenario_line["study_images"] = pop_study["NUMBER_OF_STUDY_IMAGES"]
            scenario_line["series_images"] = pop_study["NUMBER_OF_SERIES_IMAGES"]
            scenario_line["modality"] = pop_study["STUDY_MODALITY"].strip('\\')
            scenario_line["comment"] = ""
            scenario = ScenarioLine(scenario_line, writer)
            if not wrote_headers:
                scenario.write_header()
                wrote_headers = True
            scenario.write_line()


class StudyWithSeriesTest(Test):
    name = "studyWithSeries"

    def __init__(self, test_args, tests_amount, load_prob_map, input_data):
        super().__init__(test_args, tests_amount, load_prob_map, input_data)
        self.loading_type = self.test_args["loading_type"]

    def generate_test(self, writer):
        wrote_headers = False
        studies = copy.deepcopy(self.input_data)
        index = 0
        for _ in range(1, self.tests_amount):
            if len(studies) == 0:
                print("No more studies to fetch, if you want more results try different filters")
                break
            pop_study = studies.pop(0)
            if self.loading_type == "metadata":
                loading_type = "metadata"
                format_type = random.choice(["JSON", "XML"])
            else:
                loading_type = "pixel data"
                format_type = "1.2.840.10008.1.2"

            scenario_line = {"scenario_num": index, "test_number": index, "loading_type": loading_type, "format_type": format_type,
                             "study_uid": pop_study["STUDY_UID"], "series_uid": "", "sop_uid": "",
                             "study_images": pop_study["NUMBER_OF_STUDY_IMAGES"],
                             "series_images": "", "modality": pop_study["STUDY_MODALITY"].strip('\\'), "comment": ""}
            scenario = ScenarioLine(scenario_line, writer)
            if not wrote_headers:
                scenario.write_header()
                wrote_headers = True
            scenario.write_line()
            index += 1

            # now get all series
            results = Main.DAL.query("select study_instance_uid, series_instance_uid, number_of_series_images from didb_serieses "
                                     "where study_instance_uid = '{}'".format(pop_study["STUDY_UID"]))
            for res in results:
                if self.loading_type == "metadata":
                    loading_type = "metadata"
                    format_type = random.choice(["JSON", "XML"])
                else:
                    loading_type = "pixel data"
                    format_type = "1.2.840.10008.1.2"

                scenario_line = {"scenario_num": index, "test_number": index, "loading_type": loading_type,
                                 "format_type": format_type, "study_uid": res["STUDY_INSTANCE_UID"],
                                 "series_uid": res["SERIES_INSTANCE_UID"], "sop_uid": "", "study_images": "",
                                 "series_images": res["NUMBER_OF_SERIES_IMAGES"],
                                 "modality": pop_study["STUDY_MODALITY"].strip('\\'), "comment": ""}
                scenario = ScenarioLine(scenario_line, writer)
                scenario.write_line()
                index += 1


class Main:
    global DAL

    @staticmethod
    def parse_json(path):
        try:
            with open(path) as file:
                data = load(file)
                return data
        except JSONDecodeError as e:
            print("Json format is incorrect - " + str(e))
            return None
        except IOError as e:
            print("IOError while reading json file - " + str(e))
            return None
        except BaseException as e:
            print("Unexpected error while reading the json file - " + str(e))
            return None

    @staticmethod
    def get_writer(path, filename):
        full_path = path + "\\" + filename
        if os.path.exists(full_path + ".csv"):
            i = 1
            new_path = "{}({}).csv"
            while os.path.exists(new_path.format(full_path, i)):
                i += 1
            full_path = new_path.format(full_path, i)
        else:
            full_path = full_path + ".csv"

        f = open(full_path, 'w', newline='')
        writer = csv.writer(f)
        return writer, f

    @staticmethod
    def main(test, args):
        general_settings = args["general"]
        if test not in ["stress", "smoke", "logic", "parallel", "sequential", "studyWithSeries"]:
            print("Test type \"{}\" doesn't exist, please choose one of the following: [stress, smoke, logic, parallel, sequential]".format(test))
            return False
        else:
            print(f"Test '{test}' was chosen")
        test_args = args[test]
        min_images = general_settings['min_study_images']
        sort_by_date = (general_settings['sort_by_insert_date'] == "True")
        tests_amount = general_settings['tests_num']
        prob_map = general_settings['load_level_prob']

        res = ""
        for k, v in general_settings.items():
            res += f"{k}={v}, "
            if 0 < len(res) % 70 < 10:
                res += "\n\t\t"
        print(f"Script arguments: \n\t\t{res[:-2]}\n")

        res = ""
        for k, v in test_args.items():
            res += f"{k}={v}, "
            if 0 < len(res) % 200 < 10:
                res += "\n\t\t"
        print(f"{test} test arguments: \n\t\t{res[:-2]}\n")

        username, password, ip = "medistore", "a1r4c3h6", "localhost"  # default
        if "db_username" in general_settings:
            username = general_settings["db_username"]
        if "db_password" in general_settings:
            password = general_settings["db_password"]
        if "ip" in general_settings:
            ip = general_settings["ip"]

        output_path = general_settings["output_path"]

        Main.DAL = OracleAccessLayer.instance(username, password, ip)
        query_string = "select * from("\
                       "(select stu.study_instance_uid study_uid, ser_join.ser series_uid, stu.NUMBER_OF_STUDY_IMAGES, stu.STUDY_MODALITY, stu.INSERT_TIME "\
                       "from didb_studies stu, (select min(series_instance_uid) ser, study_instance_uid from didb_serieses group by study_instance_uid) ser_join "\
                       "where ser_join.study_instance_uid = stu.study_instance_uid and stu.study_instance_uid LIKE '{}' and number_of_study_images > {}) stu_ser_join "\
                       "join "\
                       "(select ser.series_instance_uid series_uid, sop_join.sop_uid sop_uid, ser.NUMBER_OF_SERIES_IMAGES "\
                       "from didb_serieses ser, (select min(sop_instance_uid) sop_uid, series_instance_uid from didb_raw_images group by series_instance_uid) sop_join "\
                       "where sop_join.series_instance_uid = ser.series_instance_uid) ser_sop_join "\
                       "on "\
                       "stu_ser_join.series_uid=ser_sop_join.series_uid) "\
                       "WHERE rownum <= {} " \
                       "{} "

        sorting = "order by stu_ser_join.insert_time desc" if sort_by_date else ""
        input_data = []
        if general_settings["study_list_path"] != "":
            with open(general_settings["study_list_path"]) as f:
                text = f.read().splitlines()
            for std in text:
                single_query_result = DAL.query(query_string.format(std, 1, 1, sorting))
                input_data.append(single_query_result[0])
        else:
            input_data = Main.DAL.query(query_string.format('%', min_images, tests_amount, sorting))

        if len(input_data) == 0:
            print("Input data is empty!")
        else:
            print("Got {} results".format(len(input_data)))

        if test == "stress":
            t = StressTest(test_args, tests_amount, prob_map, input_data)
        elif test == "smoke":
            t = SmokeTest(test_args, tests_amount, prob_map, input_data)
        elif test == "logic":
            t = LogicTest(test_args, tests_amount, prob_map, input_data)
        elif test == "parallel":
            t = ParallelTest(test_args, tests_amount, prob_map, input_data)
        elif test == "sequential":
            t = SequentialTest(test_args, tests_amount, prob_map, input_data)
        elif test == "studyWithSeries":
            t = StudyWithSeriesTest(test_args, tests_amount, prob_map, input_data)
        else:
            LogManager.error(210, "Error! test name undefined")
            print("Error! test name undefined")
            return False

        writer, f = Main.get_writer(output_path, t.get_file_name())
        t.generate_test(writer)
        f.close()
        print("Output location: " + f.name)
        return True


def init_help_menu():
    parser = argparse.ArgumentParser(
        description='''
  _____         _     ____  _                ____                           _             
 |_   _|__  ___| |_  |  _ \| | __ _ _ __    / ___| ___ _ __   ___ _ __ __ _| |_ ___  _ __ 
   | |/ _ \/ __| __| | |_) | |/ _` | '_ \  | |  _ / _ \ '_ \ / _ \ '__/ _` | __/ _ \| '__|
   | |  __/\__ \ |_  |  __/| | (_| | | | | | |_| |  __/ | | |  __/ | | (_| | || (_) | |   
   |_|\___||___/\__| |_|   |_|\__,_|_| |_|  \____|\___|_| |_|\___|_|  \__,_|\__\___/|_|   
    \nGenerates test plans by demand which will be used as the input for WadoRS_tester.py script. ''',
        formatter_class=argparse.RawTextHelpFormatter,
        epilog="""An example for correct test-plan-config json:\n{"stress":\n{\n\t"concurrent_limit": 5,\n\t"metadata_ratio": 0.5,\n\t"json_ratio": 0.7\n},\n"smoke":\n{\n\t\n},\n"logic":\n{\n\t"study_pixeldata_ratio": 0.7,\n\t"series_metadata_ratio": 0.3,\n\t"series_pixeldata_ratio": 0.5,\n\t"json_ratio": 0.5,\n\t"load_all_series": 0.5\n},\n"parallel":\n{\n\t"concurrent_limit": 5,\n\t"metadata_ratio": 0.5,\n\t"json_ratio": 0.7\n},\n"sequential":{\n\t"metadata_ratio": 0.5,\n\t"json_ratio": 0.7\n},\n"general":\n{\n\t"ip": "localhost",\n\t"db_username": "medistore",\n\t"db_password": "a1r4c3h6",\n\t"study_list_path": "",\n\t"output_path": "\\\\10.3.100.174\\share\\Wado-tester",\n\t"tests_num": 10,\n\t"min_study_images": 500,\n\t"load_level_prob":\n\t{\n\t\t"study": 60,\n\t\t"series": 30,	\n\t\t"image": 10\n\t}\n}\n}""")
    parser.add_argument('test type', help='The test type you want to create. Must be out of these options: [stress, logic, smoke, parallel, sequential]')
    parser.add_argument('configuration path', help='The path for the test-plan-config.json')
    parser.parse_args()


if __name__ == '__main__':
    init_help_menu()
    if len(sys.argv) < 3:
        print("Some arguments are missing! Use --help for example")
        sys.exit(1)
    test_type = sys.argv[1]
    parsed_args = Main.parse_json(sys.argv[2])
    if parsed_args is None:
        print("Failed to parse arguments")
        sys.exit(1)
    success = Main.main(test_type, parsed_args)
    if not success:
        print("The script was failed to finish, check logs for more info")
        sys.exit(1)
    print(f"\n{test_type.capitalize()} test plan was successfully created!")
