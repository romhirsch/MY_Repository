import os
import ast
import sys
import csv
import time
import AlgoDB
import random
import asyncio
import argparse
import datetime
import subprocess
import TesterOutput
from TestScenario import WadoScenario, QidoScenario, TestScenario
import TesterRun
from AlgoLog import LogManager
from json import load, JSONDecodeError
from DatabaseAccessLayer import OracleAccessLayer
from multiprocessing import Queue
from abc import ABC, abstractmethod


class TesterRunner:
    def __init__(self, args_dict):
        self.temp_files_path = "Web-services-responses-output"
        self.check_arguments_validity(args_dict)
        self.ae_title = args_dict["called_ae"]
        self.ip = args_dict["ip"]
        self.credentials = Credentials(args_dict["authentication"]["method"], args_dict["authentication"]["username"],
                                       args_dict["authentication"]["password"], args_dict["authentication"]["token_id"],
                                       args_dict["authentication"]["db_username"], args_dict["authentication"]["db_password"])
        self.db_ip = args_dict["db_ip"]
        self.restart_between_tests = ast.literal_eval(args_dict["restart_between_tests"])
        self.export_response_output = ast.literal_eval(args_dict["export_response_output"])
        self.output_format = args_dict["output_format"]
        self.output_path = args_dict["output_path"]
        self.test_plan_path = args_dict["test_plan_path"]
        self.timeout = int(args_dict["request_timeout_minutes"])
        self.requests_per_minutes = int(args_dict["requests_per_minutes"])
        self.caching = args_dict["caching"]
        self.request_params = RequestParams(self.ip, self.ae_title, self.credentials, self.caching, self.timeout)
        self.DAL = OracleAccessLayer.instance(self.credentials.db_username, self.credentials.db_password, self.db_ip)
        self.scenarios_list = []
        self.headers = {}
        self.is_localhost = (self.ip.lower() == "localhost")

        self.response_output_path = ""
        if self.export_response_output:
            self.response_output_path = os.environ.get('TEMP') + '\\' + self.temp_files_path

        if self.output_path == "":
            self.output_path = os.getcwd()

        if "--scenario" in sys.argv:
            self.scenario_provider = CommandLineScenarioProvider(self)
        elif self.test_plan_path == "":
            self.scenario_provider = RandomFromDBScenarioProvider(self)
        else:
            self.scenario_provider = CsvConfigurationScenarioProvider(self, self.test_plan_path)

    def run(self, args_dict):
        print("Run method was started with the following arguments: " + str(args_dict))
        LogManager.info(210, "Run method was started with the following arguments: " + str(args_dict))
        self.update_log_level(7)
        self.clean_temp_files()

        if not os.path.exists(self.output_path):
            LogManager.debug(210, "Output path folder {} doesn't exist, creating it...".format(self.output_path))
            os.mkdir(self.output_path)

        TestScenario.running_index = 1  # Reset the row index between sequential testers runs, so the next output will start at the first line
        tests_and_scenarios_dict = self.scenario_provider.get_scenarios()

        if any(arg in sys.argv for arg in ['--load', '--spikes', '--stress']):  # Performance test
            return self.run_performance_mode(tests_and_scenarios_dict)
        else:  # Regular test
            return self.run_normal_mode(tests_and_scenarios_dict)

    def run_performance_mode(self, scenarios_dict):
        if "--stress" in sys.argv:
            perf_args = sys.argv[sys.argv.index("--stress") + 1:]  # interval, base, growth, duration
        elif "--load" in sys.argv:
            duration = int(sys.argv[sys.argv.index("--load") + 1])
            perf_args = [60, self.requests_per_minutes, 0, duration]  # duration
        else:  # spikes
            duration = int(sys.argv[sys.argv.index("--spikes") + 1])
            perf_args = [60, random.randrange(200, 500, 100), 0, duration]  # duration
        return self.start_performance_test(perf_args, scenarios_dict)

    def run_normal_mode(self, test_to_scenarios_dict):
        if self.test_plan_path == "" and "--scenario" not in sys.argv:
            LogManager.error(210, "Test plan path is empty! This should happen only when running single scenario mode.")
            raise Exception("Test plan path is empty!")
        loop = asyncio.get_event_loop()
        tests_results = {}

        for test_num, test_scenarios_list in test_to_scenarios_dict.items():
            concurrent_tasks = []
            series_num = 0
            if len(test_scenarios_list) > 1:
                is_parallel = True
            else:
                is_parallel = False
            for scenario in test_scenarios_list:
                scenario.is_parallel = is_parallel
                is_valid = scenario.check_validity()
                is_data_created = scenario.create_input_data()
                if not is_valid:
                    LogManager.error(210, "Scenario input is not valid, skipping it...", True)
                    scenario.test_passed = False
                    scenario.test_result = "Invalid test plan"
                elif not is_data_created:
                    LogManager.error(210, "Failed to create input data, please check logs to identify the issue", True)
                    scenario.test_passed = False
                    scenario.test_result = "Not in DB"

                series_num += 1
                self.scenarios_list.append(scenario)
                concurrent_tasks.append(scenario.run_test(series_num))

            LogManager.debug(210, "About to run {} concurrent tasks for test number {}".format(len(concurrent_tasks), test_num))
            async_scenarios = asyncio.gather(*concurrent_tasks, return_exceptions=False)  # if True - Doesn't throw exceptions and mark the test as failure

            print(f"\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Running test {test_num} ({len(test_scenarios_list)} scenarios) ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
            start_test_time = datetime.datetime.now()
            LogManager.info(210, "Test #{} started at {}".format(test_num, start_test_time.strftime('%H:%M:%S')))
            try:
                loop.run_until_complete(async_scenarios)
            except BaseException as e:
                LogManager.error(210, f"Running scenario failed due to unhandled exception: {e}\n Continue with other scenarios...")

            end_test_time = datetime.datetime.now()
            LogManager.info(210, "Test #{} finished at {}".format(test_num, end_test_time.strftime('%H:%M:%S')))
            test_duration = end_test_time - start_test_time
            LogManager.info(210, "Test #{} run for {} seconds".format(test_num, test_duration.seconds))
            results = async_scenarios.result()

            tests_results[test_num] = self.calc_test_results(test_duration, results)
            self.perform_restart_if_needed()
            time.sleep(2)  # sleep between tests to reduce overload

        self.summarize_results(tests_results)
        self.update_log_level(4)
        return True

    @staticmethod
    def calc_test_results(test_duration, results):
        succeeded, failed = 0, 0
        for task_result in results:
            if isinstance(task_result, Exception) or not task_result:
                failed += 1
            else:
                succeeded += 1
        return test_duration.seconds, succeeded, failed

    def perform_restart_if_needed(self):
        restart_succeeded = True
        if self.is_localhost and self.restart_between_tests:
            LogManager.debug(210, "Trying restart service and app pool")
            restart_succeeded = self.perform_restart()
        if not restart_succeeded:
            print("Restart failed, continue without restarting")
            LogManager.warn(210, "Restart failed, continue without restarting")

    @abstractmethod
    def generate_random_scenario(self, study):
        pass

    @abstractmethod
    def restart_app_pool(self):
        pass

    @abstractmethod
    def restart_service(self):
        pass

    def summarize_results(self, tests_results):
        last_line = TestScenario.running_index + 1
        self.output.write_statistics(last_line, tests_results)

    def start_performance_test(self, test_args, scenarios_from_test_plan):
        if len(test_args) < 4:
            LogManager.error(210, "Too little arguments were given for stress test. should be --stress <interval> <base> <growth> <duration>")
            return False
        for arg in test_args:
            try:
                int(arg)
            except ValueError:
                LogManager.error(210, "Argument {} is not an integer".format(arg), True)
                return False
        interval, base, growth, duration = test_args
        print("Interval: {}, Initial amount: {}, Growth: {}, Duration: {}".format(interval, base, growth, duration))
        self.update_log_level(7)
        start_test_time = datetime.datetime.now()
        perf_test_obj = StressObj(interval, base, growth, duration, start_test_time, scenarios_from_test_plan)
        loop = asyncio.get_event_loop()
        loop.run_until_complete(StressObj.manage_tasks_queue(self, loop, perf_test_obj))
        test_results = perf_test_obj.results
        total_time = round((datetime.datetime.now() - perf_test_obj.start_time) / datetime.timedelta(seconds=1), 1)
        total_passed = len([res for res in test_results if test_results[res] is True])
        total_failed = len([res for res in test_results if test_results[res] is False])
        self.summarize_results({1: (total_time, total_passed, total_failed)})
        self.update_log_level(4)
        print("Stress test was finished after {} minutes".format(round((datetime.datetime.now() - start_test_time) / datetime.timedelta(minutes=1), 1)))
        return True

    def clean_temp_files(self):
        if self.export_response_output:
            self.response_output_path = self.response_output_path + "\\" + self.temp_files_path
            if not os.path.exists(self.response_output_path):
                LogManager.debug(210, "TEMP folder doesn't exist. Create one in:{}".format(self.response_output_path))
                os.makedirs(self.response_output_path)
            for filename in os.listdir(self.response_output_path):
                file_path = os.path.join(self.response_output_path, filename)
                try:
                    os.unlink(file_path)
                except Exception as e:
                    LogManager.warn(210, f"Failed to delete {file_path}. Reason: {e}")

    def perform_restart(self):
        bool_restart_app_pool = self.restart_app_pool()
        bool_restart_service = self.restart_service()
        if not bool_restart_app_pool:
            print("Failed to restart application pool")
            LogManager.error(210, "Failed to restart application pool")
            return False
        elif not bool_restart_service:
            print("Failed to restart service")
            LogManager.error(210, "Failed to restart service")
            return False
        else:
            return True

    def update_log_level(self, level):
        if self.is_localhost:
            os.system(f'cmd /c "logupdate 581 {level}"')
            LogManager.debug(210, f"flperf log level was updated to {level}")

    @staticmethod
    @abstractmethod
    def read_test_scenarios(test_csv_path):
        pass

    @staticmethod
    def check_arguments_validity(args):
        if "called_ae" not in args:
            LogManager.error(210, "called_ae is missing from the arguments input")
            raise Exception("Mandatory argument {} is missing".format("called_ae"))
        if "ip" not in args:
            LogManager.error(210, "ip is missing from the arguments input")
            raise Exception("Mandatory argument {} is missing".format("ip"))
        if "authentication" not in args:
            LogManager.error(210, "ip is missing from the arguments input")
            raise Exception("Mandatory argument {} is missing".format("ip"))
        else:
            if "username" not in args["authentication"]:
                args["authentication"]["username"] = "ci"
                LogManager.warn(210, "username is missing from the arguments input, using default: {}".format(args["authentication"]["username"]))
            if "password" not in args["authentication"]:
                args["authentication"]["password"] = "ci"
                LogManager.warn(210, "password is missing from the arguments input, using default {}".format(args["authentication"]["password"]))
            if "id_token" not in args["authentication"]:
                args["authentication"]["id_token"] = ""
                LogManager.warn(210, "password is missing from the arguments input, using default {}".format(args["authentication"]["id_token"]))
            if "db_username" not in args["authentication"]:
                args["authentication"]["db_username"] = "medistore"
                LogManager.warn(210, "db_username is missing from the arguments input, using default {}".format(args["authentication"]["db_username"]))
            if "db_password" not in args["authentication"]:
                args["authentication"]["db_password"] = "a1r4c3h6"
                LogManager.warn(210, "db_password is missing from the arguments input, using default {}".format(args["authentication"]["db_password"]))
        if "db_ip" not in args:
            args["db_ip"] = args["ip"]
            LogManager.warn(210, "db_ip is missing, using the ip argument instead")
        if "restart_between_tests" not in args:
            args["restart_between_tests"] = "False"
            LogManager.warn(210, "restart_between_tests is missing from the arguments input, using default {}".format(args["restart_between_tests"]))
        if "export_response_output" not in args:
            args["export_response_output"] = "False"
            LogManager.warn(210, "export_response_output is missing from the arguments input, using default: {}".format(args["export_response_output"]))
        if "output_format" not in args:
            LogManager.error(210, "output_format is missing from the arguments input")
            raise Exception("Mandatory argument {} is missing".format("output_format"))
        if args["output_format"] not in ["excel", "csv", "cmd"]:
            LogManager.error(210, "Output format {} is not supported.".format(self.output_format))
            raise Exception("output_format is not of type: excel, csv or cmd")
        if "output_path" not in args:
            LogManager.error(210, "output_path is missing from the arguments input")
            raise Exception("Mandatory argument {} is missing".format("output_path"))
        if "test_plan_path" not in args:
            LogManager.error(210, "test_plan_path is missing from the arguments input")
            raise Exception("Mandatory argument {} is missing".format("test_plan_path"))
        if "request_timeout_minutes" not in args:
            args["request_timeout_minutes"] = 3
            LogManager.warn(210, "request_timeout_minutes is missing from the arguments input, using default {}".format(args["request_timeout_minutes"]))
        if not isinstance(args["request_timeout_minutes"], int) and not args["request_timeout_minutes"].isdigit():
            args["request_timeout_minutes"] = 3
            LogManager.warn(210, "request_timeout_minutes is not an integer, using default {}".format(args["request_timeout_minutes"]))
        if "requests_per_minutes" not in args:
            args["requests_per_minutes"] = 100
            LogManager.warn(210, "requests_per_minutes is missing from the arguments input, using default {}".format(args["requests_per_minutes"]))
        if "caching" not in args:
            args["caching"] = "False"
            LogManager.warn(210, "caching is missing from the arguments input, using default {}".format(args["caching"]))

    @staticmethod
    def parse_command_line(argv):
        parser = argparse.ArgumentParser()
        parser.add_argument("--called_ae", required=True,
                            help="Called AE hostname")
        parser.add_argument("--ip", required=True,
                            help="PACS ip. If running from PACS use \'localhost\'\n")
        parser.add_argument("--username", required=False, default="ci",
                            help="Login username. Default is ci")
        parser.add_argument("--password", required=False, default="ci",
                            help="Login password.")
        parser.add_argument("--db_ip", required=False, default="localhost",
                            help="The database IP address")
        parser.add_argument("--db_username", required=False, default="medistore",
                            help="Database username.")
        parser.add_argument("--db_password", required=False, default="a1r4c3h6",
                            help="Database password.")
        parser.add_argument("--id_token", required=False, default="",
                            help="ID token for openID authentication.")
        parser.add_argument("--auth_method", required=False, default="basic",
                            help="Authentication method can be 'basic' (username & passoword) or 'openid' authentication.")
        parser.add_argument("--restart_between_tests", required=False, default="False",
                            help="Restarting svwload service and WadoRS application pool between every session, or keep them running")
        parser.add_argument("--test_plan_path", required=False,
                            help="Path for the tests scenarios to run.\n"
                                 "The test plan must contains the following header:\n"
                                 "Scenario|Test Nmber|Loading Type|Loading Format|Study Instance UID|Series Instance UID|Sop Instance UID\n"
                                 "A row for example:\t 1,1,pixel data,1.2.840.10008.1.2,1.2.840.113704.7.1.0.154871286716117.1322730488.220,*,\n"
                                 "(UIDs with '*' include all the UIDs belong to the higher level. An empty UID will ignore the current level and will load as the higher level)")
        parser.add_argument("--output_format", required=True,
                            help="The format for the output results. Currently supports excel, csv or command line")
        parser.add_argument("--output_path", required=False, default="",
                            help="Where to save the results output. Default is the script running folder")
        parser.add_argument("--export_response_output", required=False, default="False",
                            help="Whether to save the loaded data in their chosen format as temporary files")
        parser.add_argument("--request_timeout_minutes", required=False, default=2,
                            help="How much time to wait before the request reach timeout")
        parser.add_argument("--requests_per_minute", required=False, default=100,
                            help="How much requests to send in 1 minute while doing load tests")
        parser.add_argument("--caching", required=False, default="False",
                            help="Whether to keep wado results in cache")

        called_ae = parser.parse_args(argv).called_ae
        input_ip = parser.parse_args(argv).ip
        input_username = parser.parse_args(argv).username
        input_password = parser.parse_args(argv).password
        db_ip = parser.parse_args(argv).db_ip
        db_user = parser.parse_args(argv).db_username
        db_pass = parser.parse_args(argv).db_password
        token = parser.parse_args(argv).id_token
        auth = parser.parse_args(argv).auth_method
        restart_between_tests = parser.parse_args(argv).restart_between_tests
        test_plan_path = parser.parse_args(argv).test_plan_path
        output_format_type = parser.parse_args(argv).output_format
        result_output_path = parser.parse_args(argv).output_path
        export_temporary_files = parser.parse_args(argv).export_response_output
        request_timeout = parser.parse_args(argv).request_timeout_minutes
        requests_per_minute = parser.parse_args(argv).requests_per_minute
        url_caching = parser.parse_args(argv).caching
        return {"called_ae": called_ae, "ip": input_ip, "authentication": {"method":auth, "username": input_username,
                "password": input_password, "id_token": token,"db_username": db_user, "db_password": db_pass},
                "db_ip": db_ip, "test_plan_path": test_plan_path, "restart_between_tests": restart_between_tests,
                "output_format": output_format_type, "output_path": result_output_path, "response_output_path": export_temporary_files,
                "request_timeout_minutes": request_timeout, "requests_per_minute": requests_per_minute, "caching": url_caching}

    @staticmethod
    def parse_json(path):
        try:
            with open(path) as file:
                data = load(file)
                return data
        except JSONDecodeError as e:
            print("Json format is incorrect - " + str(e))
            LogManager.error(210, "Json format is incorrect - " + str(e))
        except IOError as e:
            print("IOError while reading json file - " + str(e))
            LogManager.error(210, "IOError while reading json file - " + str(e))
        except BaseException as e:
            print("Unexpected error while reading the json file - " + str(e))
            LogManager.error(210, "Unexpected error while reading the json file - " + str(e))


class WadoRunner(TesterRunner):
    def __init__(self, args):
        super().__init__(args)
        self.temp_files_path = "WadoRS-responses"
        if self.output_format == "excel":
            self.output = TesterOutput.WadoExcelOutput(self.headers, self.output_path)
            self.output.create_arguments_worksheet(args)
            self.output.create_test_plan_worksheet(self.test_plan_path)
        elif self.output_format == "csv":
            self.output = TesterOutput.CsvOutput(self.headers, self.output_path)
        elif self.output_format == "cmd":
            self.output = TesterOutput.CmdOutput(self.headers)
        else:
            self.output = None

        TestScenario.init_general_params(self.DAL, self.is_localhost, self.output, self.request_params, self.response_output_path +"\\" + self.temp_files_path)
        headers_list = ["Test Number", "Scenario Number", "Test Result", "HTTP Code", "Test Type", "Loading Level", "Loading Type",
                        "Loading Format", "Total Time [millisec]", "Loading Time [millisec]", "Loading Time Ratio",
                        "Time to First Image [millisec]", "Loaded Size [KB]", "Actual Size [KB]", "Total Images Loaded",
                        "Images per Second", "Images per Second (without first image)", "Loading Rate [MB/sec]",
                        "Loading Rate (without first image) [MB/sec]", "Image Compression Type on Disk", "Modality", "Images in Study",
                        "Images in Series", "Series in Study", "Number of HCFFs", "All HCFFs Sizes [KB]", "HCFFs Total Size [KB]",
                        "HCFF Avg Size [KB]", "Connect To Device [millisec]", "SVWLoad Time [millisec]",
                        "SVWLoad Reformat [millisec]", "Send Data To AppPool [millisec]", "Valid Response", "Study Instance UID",
                        "Series Instance UID", "Sop Instance UID", "URL", "Study Physical Path"]
        # Convert the headers list to a dictionary that its value is the column number
        for idx in range(len(headers_list)):
            self.headers[headers_list[idx]] = idx

    def read_test_scenarios(self, test_csv_path):
        all_scenarios = {}
        try:
            with open(test_csv_path, newline='') as file:
                reader = csv.DictReader(file)
                for row in reader:
                    scenario_dict = {"Scenario": row["Scenario"].strip(), "Test Number": row["Test Number"].strip(),
                                     "Loading Type": row["Loading Type"].strip(), "Loading Format": row["Loading Format"].strip(),
                                     "Study Instance UID": row["Study Instance UID"].strip(),
                                     "Series Instance UID": row["Series Instance UID"].strip(),
                                     "Sop Instance UID": row["Sop Instance UID"].strip()}

                    if scenario_dict["Series Instance UID"] == "*":  # We want all the series of the study so we run a separated scenario for each of them
                        LogManager.debug(210, "Found a series with *, querying for all series of this study")
                        series = self.DAL.get_series_of_study(scenario_dict["Study Instance UID"])
                        if len(series) == 0:
                            LogManager.error(210, "Cannot find additional series in DB for study: " + scenario_dict["Study Instance UID"])
                            continue
                        for ser in series:
                            scenario_dict["Series Instance UID"] = ser["SERIES_INSTANCE_UID"]
                            scenario = WadoScenario(scenario_dict, self.output)
                            all_scenarios.setdefault(row["Test Number"], []).append(scenario)  # If Test number key exists - append the scenario to it's list, otherwise - create new list and append the scenario
                    else:
                        scenario = WadoScenario(scenario_dict, self.output)
                        all_scenarios.setdefault(row["Test Number"], []).append(scenario)
        except IOError:
            LogManager.error(210, "Cannot open or read test plan from path: " + test_csv_path)
            raise Exception("Cannot open or read test plan from path")
        except KeyError as e:
            LogManager.error(210, "{} is missing in the test plan".format(e))
            raise Exception("{} is missing in the test plan".format(e))
        except BaseException as e:
            LogManager.error(210, "Error while reading test plan. Message: " + str(e))
            raise Exception("Error while reading test plan")
        return all_scenarios

    def restart_app_pool(self):
        LogManager.debug(210, "Restarting WadoRS application pool")
        os.environ['PATH'] = os.environ.get('PATH') + r";C:\Windows\System32\inetsrv"  # adding appcmd to PATH
        log_file_path = '%imaginet_log_dir%\\WadoRS.log'
        log_file_path_exp = os.path.expandvars(log_file_path)
        open(log_file_path_exp, 'w').close()  # clean logs
        LogManager.info(210, "WadoRS.log was cleaned")

        child = subprocess.Popen('powershell.exe appcmd recycle apppool /apppool.name:WadoRSAppPool', stdout=subprocess.PIPE)
        LogManager.debug(210, "Executing command: appcmd recycle apppool /apppool.name:WadoRSAppPool")
        stream_data = child.communicate()[0].decode('ascii')
        if "successfully recycled" in stream_data:
            LogManager.debug(210, "Restart WadoRS application pool succeeded")
            return True
        else:
            LogManager.error(210, "Restart WadoRS application pool failed: {}".format(stream_data))
            return False

    def restart_service(self):
        LogManager.info(210, "Restarting SVWLOAD service")
        log_file_path = '%imaginet_log_dir%\\SVWLOAD.log'
        log_file_path_exp = os.path.expandvars(log_file_path)
        open(log_file_path_exp, 'w').close()  # clean logs
        LogManager.info(210, "SVWLOAD.log was cleaned")

        child = subprocess.Popen('admincommand restart_service svwload', stdout=subprocess.PIPE)
        LogManager.debug(210, "admincommand restart_service svwload")
        stream_data = child.communicate()[0].decode('ascii')
        if "Restarted service WLOAD_SERVICE" in stream_data:
            LogManager.info(210, "Restarting svwload succeeded")
            return True
        else:
            LogManager.error(210, "Restart svwload failed!\n{}".format(stream_data))
            return False

    def generate_random_scenario(self, study):
        rand_series_uid = random.choice([study["SERIES_INSTANCE_UID"], ""])
        rand_sop_uid = random.choice([study["SOP_INSTANCE_UID"], ""])
        scenario_dict = {"Scenario": 1, "Test Number": 1, "Loading Type": "metadata",
                         "Loading Format": random.choice(["xml", "json"]), "Study Instance UID": study["STUDY_INSTANCE_UID"],
                         "Series Instance UID": rand_series_uid, "Sop Instance UID": rand_sop_uid}
        scen = WadoScenario(scenario_dict, self.output)
        self.scenarios_list.append(scen)
        return scen

    def single_scenario_test(self, scenario_args):
        if len(scenario_args) < 3:
            raise Exception("Too little arguments were given for single scenario run."
                            "Mandatory arguments are Loading type, Loading format and Study instance UID, in that order."
                            "Optional arguments are Series Instance UID and Sop Instance UID")
        single_scenario_dict = {"Scenario": 1, "Test Number": 1, "Loading Type": scenario_args[0],
                                "Loading Format": scenario_args[1], "Study Instance UID": scenario_args[2]}
        if len(scenario_args) == 5:
            single_scenario_dict["Series Instance UID"] = scenario_args[3]
            single_scenario_dict["Sop Instance UID"] = scenario_args[4]
        elif len(scenario_args) == 4:
            single_scenario_dict["Series Instance UID"] = scenario_args[3]
            single_scenario_dict["Sop Instance UID"] = ""
        elif len(scenario_args) == 3:
            single_scenario_dict["Series Instance UID"] = ""
            single_scenario_dict["Sop Instance UID"] = ""
        else:
            LogManager.warn(210, "No need to input more than 5 arguments, some of them would not be considered")
        return WadoScenario(single_scenario_dict, self.output)


class QidoRunner(TesterRunner):
    def __init__(self, args):
        super().__init__(args)
        self.temp_files_path = "QidoRS-responses"
        if self.output_format == "excel":
            self.output = TesterOutput.QidoExcelOutput(self.headers, self.output_path)
            self.output.create_arguments_worksheet(args)
            self.output.create_test_plan_worksheet(self.test_plan_path)
        elif self.output_format == "csv":
            self.output = TesterOutput.CsvOutput(self.headers, self.output_path)
        elif self.output_format == "cmd":
            self.output = TesterOutput.CmdOutput(self.headers)
        else:
            self.output = None

        TestScenario.init_general_params(self.DAL, self.is_localhost, self.output, self.request_params, self.response_output_path + "\\" + self.temp_files_path)
        headers_list = ["Test Number", "Scenario Number", "Test Result", "HTTP Code", "Test Type", "Query Level",
                        "End Point", "Total Milliseconds", "Response Bytes", "Rate [MB/sec]", "Response Format",
                        "Number of Requested Tags", "Requested Tags Received", "Missing Tags", "Mismatched VRs",
                        "Valid Response", "Study Instance UID", "Series Instance UID", "URL"]
        # Convert the headers list to a dictionary that its value is the column number
        for idx in range(len(headers_list)):
            self.headers[headers_list[idx]] = idx

    def read_test_scenarios(self, test_csv_path):
        all_scenarios = {}
        try:
            with open(test_csv_path, newline='') as file:
                reader = csv.DictReader(file)
                parallel_scenario = {}
                for row in reader:
                    scenario_dict = {"Scenario": row["Scenario"].strip(), "Test Number": row["Test Number"].strip(),
                                     "Limit": row["Limit"].strip(), "Response Format": row["Response Format"].strip(),
                                     "Query Level": row["Query Level"].strip(),
                                     "Study Instance UID": row["Study Instance UID"].strip(),
                                     "Series Instance UID": row["Series Instance UID"].strip(),
                                     "Include Fields": row["Include Fields"].strip(), "Additional Filters": row["Additional Filters"].strip()}
                    scenario = QidoScenario(scenario_dict, self.output)
                    all_scenarios.setdefault(row["Test Number"], []).append(scenario)
        except IOError:
            LogManager.error(210, "Cannot open or read test plan from path: " + test_csv_path)
            raise Exception("Cannot open or read test plan from path")
        except KeyError as e:
            LogManager.error(210, "{} is missing in the test plan".format(e))
            raise Exception("{} is missing in the test plan".format(e))
        except BaseException as e:
            LogManager.error(210, "Error while reading test plan. Message: " + str(e))
            raise Exception("Error while reading test plan")
        return all_scenarios

    def restart_app_pool(self):
        LogManager.debug(210, "Restarting QidoRS application pool")
        os.environ['PATH'] = os.environ.get('PATH') + r";C:\Windows\System32\inetsrv"  # adding appcmd to PATH
        log_file_path = '%imaginet_log_dir%\\QidoRS.log'
        log_file_path_exp = os.path.expandvars(log_file_path)
        open(log_file_path_exp, 'w').close()  # clean logs
        LogManager.info(210, "QidoRS.log was cleaned")

        child = subprocess.Popen('powershell.exe appcmd recycle apppool /apppool.name:QidoRSAppPool', stdout=subprocess.PIPE)
        LogManager.debug(210, "Executing command: appcmd recycle apppool /apppool.name:QidoRSAppPool")
        stream_data = child.communicate()[0].decode('ascii')
        if "successfully recycled" in stream_data:
            LogManager.debug(210, "Restart QidoRS application pool succeeded")
            return True
        else:
            LogManager.error(210, "Restart QidoRS application pool failed: {}".format(stream_data))
            return False

    def restart_service(self):
        print("Restarting SVQE service")
        LogManager.info(210, "Restarting SVQE service")
        log_file_path = '%imaginet_log_dir%\\SVQE.log'
        log_file_path_exp = os.path.expandvars(log_file_path)
        open(log_file_path_exp, 'w').close()  # clean logs
        LogManager.info(210, "SVQE.log was cleaned")

        child = subprocess.Popen('admincommand restart_service svqe', stdout=subprocess.PIPE)
        LogManager.debug(210, "admincommand restart_service svqe")
        stream_data = child.communicate()[0].decode('ascii')
        if "Restarted service QE_SERVICE" in stream_data:
            LogManager.info(210, "Restart svqe succeeded")
            return True
        else:
            LogManager.error(210, "Restart svqe failed!\n{}".format(stream_data))
            return False

    def generate_random_scenario(self, study):
        end_point = random.choice(["studies", "series", "instances", "patients",
                                   "studies/<studyuid>/series", "studies/<studyuid>/instances",
                                   "studies/<studyuid>/series/<seriesuid>/instances"])
        query_level = end_point.split("/")[-1]
        study_uid, series_uid = "", ""
        if "<studyuid>" in end_point:
            study_uid = study["STUDY_INSTANCE_UID"]
        if "<seriesuid>" in end_point:
            series_uid = study["SERIES_INSTANCE_UID"]
        if end_point in ["studies", "series", "instances", "patients"]:
            limit = random.randrange(10, 100, 10)
        else:
            limit = 0
        scenario = {"Scenario": 1, "Test Number": 1, "Limit": limit, "Query Level": query_level,
                    "Response Format": random.choice(["xml", "json"]), "Study Instance UID": study_uid,
                    "Series Instance UID": series_uid, "Include fields": "", "Additional Filters": ""}
        return QidoScenario(scenario, self.output)

    def single_scenario_test(self, scenario_args):
        if len(scenario_args) < 3:
            raise Exception("Too little arguments were given for single scenario.\n"
                            "Mandatory arguments are: Limit, Response Format and Query Level, in that order.\n"
                            "Optional arguments are: Study Instance UID and Series Instance UID")
        single_scenario_dict = {"Scenario": 1, "Test Number": 1, "Limit": scenario_args[0], "Response Format": scenario_args[1], "Query Level": scenario_args[2]}
        if len(scenario_args) == 7:
            single_scenario_dict["Study Instance UID"] = scenario_args[3]
            single_scenario_dict["Series Instance UID"] = scenario_args[4]
            single_scenario_dict["Include fields"] = scenario_args[5]
            single_scenario_dict["Additional Filters"] = scenario_args[6]
        elif len(scenario_args) == 6:
            single_scenario_dict["Study Instance UID"] = scenario_args[3]
            single_scenario_dict["Series Instance UID"] = scenario_args[4]
            single_scenario_dict["Include fields"] = scenario_args[5]
            single_scenario_dict["Additional Filters"] = ""
        elif len(scenario_args) == 5:
            single_scenario_dict["Study Instance UID"] = scenario_args[3]
            single_scenario_dict["Series Instance UID"] = scenario_args[4]
            single_scenario_dict["Include fields"] = ""
            single_scenario_dict["Additional Filters"] = ""
        elif len(scenario_args) == 4:
            single_scenario_dict["Study Instance UID"] = scenario_args[3]
            single_scenario_dict["Series Instance UID"] = ""
            single_scenario_dict["Include fields"] = ""
            single_scenario_dict["Additional Filters"] = ""
        elif len(scenario_args) == 3:
            single_scenario_dict["Study Instance UID"] = ""
            single_scenario_dict["Series Instance UID"] = ""
            single_scenario_dict["Include fields"] = ""
            single_scenario_dict["Additional Filters"] = ""
        else:
            LogManager.warn(210, "No need to input more than 5 arguments, they would not be considered")
        return QidoScenario(single_scenario_dict, self.output)


class StressObj:
    test_num = 0
    scenario_num = 0

    def __init__(self, interval, initial_amount, growth_rate, duration, start_time, tests_dict):
        self.interval = int(interval)
        self.initial_amount = int(initial_amount)
        self.growth_rate = int(growth_rate)
        self.duration = int(duration)
        self.start_time = start_time
        self.tests_dict = tests_dict
        self.consumers_num = 0
        self.results = {}

    @staticmethod
    async def manage_tasks_queue(tester_run_obj, loop, perf_test_obj):
        queue = asyncio.Queue()
        requests_capacity = perf_test_obj.initial_amount
        perf_test_obj.consumers_num = requests_capacity
        LogManager.debug(210, "Created queue with {} consumers".format(requests_capacity))
        producers = [loop.create_task(StressObj.producer(queue, perf_test_obj))]
        consumers = [loop.create_task(StressObj.consumer(i, queue, perf_test_obj)) for i in range(1, requests_capacity + 1)]
        loop.create_task(StressObj.increase_consumers(loop, consumers, queue, perf_test_obj))
        await asyncio.gather(*producers, return_exceptions=True)
        LogManager.info(210, "Done creating scenarios, waiting for remaining tasks to be finished")
        print("Done creating scenarios, waiting for remaining tasks to be finished")
        # await queue.join()  # to wait until all tasks in queue are consumed

        LogManager.debug(210, "No more tasks to perform, killing consumers")
        for c in consumers:
            c.cancel()

    @staticmethod
    async def increase_consumers(loop, consumers, queue, perf_test_obj):
        while (datetime.datetime.now() - perf_test_obj.start_time) / datetime.timedelta(minutes=1) < perf_test_obj.duration:
            consumers_to_add = round(len(consumers) * (perf_test_obj.growth_rate/100))
            for _ in range(0, consumers_to_add):
                consumers.append(loop.create_task(StressObj.consumer(len(consumers) + 1, queue, perf_test_obj)))
            perf_test_obj.consumers_num += consumers_to_add
            print("Consumers capacity was extended by {} to {} ".format(consumers_to_add, len(consumers)))
            await asyncio.sleep(perf_test_obj.interval)
        print("Finish increasing")

    @staticmethod
    async def producer(queue, perf_test_obj):
        TestScenario.running_index = 1
        while (datetime.datetime.now() - perf_test_obj.start_time) / datetime.timedelta(minutes=1) < perf_test_obj.duration:
            random_test = random.choice(list(perf_test_obj.tests_dict.values()))  # Get random test from the input
            tmp_scenario = random.choice(random_test)  # Get random scenario from the test's scenarios
            scenario = tmp_scenario.copy_constructor()  # it is important to create a copy of the scenario otherwise it will override others
            scenario.set_test_number(scenario.index)
            scenario.set_scenario(scenario.index)
            is_valid = scenario.check_validity()
            is_data_created = scenario.create_input_data()

            if not is_valid:
                LogManager.error(210, "Scenario input is not valid")
                scenario.test_passed = False
                scenario.test_result = "Invalid test plan"
            elif not is_data_created:
                LogManager.error(210, "Failed to create input data, please check logs to identify the issue")
                scenario.test_passed = False
                scenario.test_result = "Not in DB"

            await queue.put(scenario)
            if queue.qsize() > perf_test_obj.consumers_num:  # When there are more tasks awaiting than active consumers - suspend the producing
                await asyncio.sleep(perf_test_obj.interval)  # after this interval we will get more consumers
        print("Finished producing")

    @staticmethod
    async def consumer(consumer_id, queue, perf_test_obj):
        print("*** Consumer {} was created".format(consumer_id))
        if perf_test_obj.consumers_num > 1:  # if we have multiple consumers so it must be parallel
            is_parallel = True
        else:
            is_parallel = False

        while (datetime.datetime.now() - perf_test_obj.start_time) / datetime.timedelta(minutes=1) < perf_test_obj.duration:
            task_item = await queue.get()
            task_item.is_parallel = is_parallel

            result = await task_item.run_test()
            perf_test_obj.results[task_item.scenario] = result
            queue.task_done()
            print(f"--- Consumer {consumer_id}:\tFinished scenario {task_item.scenario}!")
        print(f"Consumer {consumer_id} finished its job. {queue.qsize()} more tasks in queue")


class ScenarioProvider:
    def get_scenarios(self):
        pass


class RandomFromDBScenarioProvider(ScenarioProvider):
    def __init__(self, tester):
        self.tester = tester

    def get_scenarios(self):
        samples_studies = self.tester.DAL.get_n_random_sops(100)
        if len(samples_studies) == 0:
            LogManager.error(210, "Failed to fetch studies from database")
            raise Exception("Failed to fetch studies from database")
        random_scenarios = {}
        for i, study in enumerate(samples_studies):
            random_scenarios[i] = [self.tester.generate_random_scenario(study)]
        return random_scenarios


class CsvConfigurationScenarioProvider(ScenarioProvider):
    def __init__(self, tester, test_plan_path):
        self.tester = tester
        self.test_plan_path = test_plan_path

    def get_scenarios(self):
        return self.tester.read_test_scenarios(self.test_plan_path)


class CommandLineScenarioProvider(ScenarioProvider):
    def __init__(self, tester):
        self.tester = tester

    def get_scenarios(self):
        single_scenario_dict = self.tester.single_scenario_test(sys.argv[sys.argv.index("--scenario") + 1:])
        return {1: [single_scenario_dict]}


class RequestParams:
    def __init__(self, ip, ae_title, credentials, caching, timeout):
        self.ip = ip
        self.ae_title = ae_title
        self.credentials = credentials
        self.caching = caching
        self.timeout = timeout

class Credentials:
    def __init__(self, method, username, password, id_token, db_username, db_password):
        self.method = method
        self.username = username
        self.password = password
        self.id_token = id_token
        self.db_username = db_username
        self.db_password = db_password