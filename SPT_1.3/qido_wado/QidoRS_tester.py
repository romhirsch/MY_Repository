"""
QidoRS tester
Purpose: Send http request to perform web querying via QidoRS application pool
Created by: Nitzan Shpigel, September 2020
"""

import sys
import random
import argparse
from TestScenario import TestScenario
from TesterRun import QidoRunner
from AlgoLog import LogManager


def run_test(input_args):
    if "active" not in input_args:
        tester = QidoRunner(input_args)
        return tester.run(input_args)
    else:
        if input_args["active"] == "True":
            tester = QidoRunner(input_args)
            final_results = tester.run(input_args)
            return final_results
        else:
            return True


def parse_arguments():
    if "--json" in sys.argv:
        print("Parsing arguments from json file")
        LogManager.info(210, "Parsing arguments from json file")
        return QidoRunner.parse_json(sys.argv[2])
    elif "--args" in sys.argv:
        print("Parsing arguments from command line")
        LogManager.info(210, "Parsing arguments from command line")
        try:
            scenario_idx = sys.argv.index("--scenario")  # This is for the case that we run a single scenario with command line arguments
        except ValueError:
            scenario_idx = None
        return [QidoRunner.parse_command_line(sys.argv[2:scenario_idx])]
    else:
        print("Invalid command line. Must start with --args or --json")
        LogManager.error(210, "Invalid command line. Must start with --args or --json")
        return []


def init_help_menu():
    logo = '''
       ____  _     _       _____   _____   _______        _            
      / __ \(_)   | |     |  __ \ / ____| |__   __|      | |           
     | |  | |_  __| | ___ | |__) | (___      | | ___  ___| |_ ___ _ __ 
     | |  | | |/ _` |/ _ \|  _  / \___ \     | |/ _ \/ __| __/ _ \ '__|
     | |__| | | (_| | (_) | | \ \ ____) |    | |  __/\__ \ ||  __/ |   
      \___\_\_|\__,_|\___/|_|  \_\_____/     |_|\___||___/\__\___|_|    
    '''
    details = "\r usage: %(prog)s [-h]\n"\
              "\t\t--json <test_params_path>\n"\
              "\t\t--args [--called_ae <called_ae> --ip <ip/localhost> [--username <username>] [--password <password>] " \
              "[--auth_method <basic\\openid>] [--id_token <id_token>] [--db_ip <ip/localhost> [--db_username <db_username>] " \
              "[--db_password <db_password>] --test_plan_path <test_plan_path> --output_format <output_format>"\
              "[--restart_between_tests <\"true\"\\\"false\">] [--export_response_output <\"true\"\\\"false\">] [--request_timeout_minutes <timeout>]]]\n"\
              "\t\t[--scenario [<limit> <response_format> <query_level> [<study_uid>] [<series_uid>] [<include_fields>] [<additional_filters>]]]\n"\
              "\t\t[--load [<duration>]]\n"\
              "\t\t[--spikes [<duration>]]\n"\
              "\t\t[--stress [<interval> <base> <growth> <duration>]]"
    usage = '\r{}{}\n{}.'.format(''.ljust(len('usage:')), logo, details)
    parser = argparse.ArgumentParser(
        prog="WadoRS_tester.py",
        description='You must supply exactly one of --json or --args, not both. The other are optionals and only one of them can be chosen',
        formatter_class=argparse.RawTextHelpFormatter,
        usage=usage,
        epilog="""Authentication method can be only one of the following: basic - using username and password, or openid - using id token.
        \nOutput can be saved as Excel, CSV or presented at the console, according to configuration.""")

    parser.add_argument('json', metavar="--json <json_path>", nargs='?',
                        help='Path to json configurations file.')
    parser.add_argument('args', metavar="--args [...]", nargs='?',
                        help='Using command-line arguments instead of json configurations file.')
    parser.add_argument('--scenario', metavar="<limit> <response_format> <query_level> [<study_uid>] [<series_uid>] [<include_fields>] [<additional_filters>]", nargs='?',
                        help='Configure single scenario parameters, instead of using the CSV test plan\n'
                             '-	limit (integer) - restricts the number of returning results\n'
                             '-	response_format – the response format. can be xml/json.\n'
                             '-	query_level – can be patients/studies/series/instances.\n'
                             '-	include_fields – list of fields you want to receive "forcibly", divided by semi-colon (;).\n'
                             '-	additional_filters – list of filters in the form of <tag>=<value>, divided by semi-colon (;).\n'
                             '*You can\'t missing a middle argument, if you don\'t want to use some arguments you should remove them from the end')
    parser.add_argument('--load', metavar="<duration>", nargs='?',
                        help='Run load test for <duration> minutes. Every one minute it sends 100 (can be configured) requests at once.')
    parser.add_argument('--spikes', metavar="<duration>", nargs='?',
                        help='Run spikes test for <duration> minutes. Every one minute it sends random amount of requests (200-500) at once.')
    parser.add_argument('--stress', metavar="<interval> <base> <growth> <duration>", nargs='?',
                        help='Run stress test for <duration> minutes. Starts with <base> concurrent scenarios and increment by <growth> percents every <interval> seconds.')

    parser.parse_args()


if __name__ == '__main__':
    if any(x in sys.argv for x in ['-h', '--help']):
        init_help_menu()
    LogManager.init(False)
    LogManager.info(210, f"QidoRS tester started with arguments:{sys.argv}")

    parsed_args = parse_arguments()

    if not parsed_args:
        print("Unable to start running the test - mandatory arguments are missing")
        LogManager.error(210, "Unable to start running the test - mandatory arguments are missing")
        sys.exit(1)
    LogManager.info(210, f"Parsed arguments are: {parsed_args}")

    is_succeeded = True
    times_to_run_the_script = len(parsed_args)
    for current_parsed_args in parsed_args:
        is_test_passed = run_test(current_parsed_args)
        if not is_test_passed:
            print("Tester number {} was failed!".format(len(parsed_args) - times_to_run_the_script + 1))
            is_succeeded = False
        LogManager.info(210, "Tester number {} was completed".format(len(parsed_args) - times_to_run_the_script + 1))
        times_to_run_the_script -= 1

    if not is_succeeded:
        LogManager.error(210, "QidoRS tester failed!")
        print("QidoRS tester failed!")
        sys.exit(1)
    else:
        LogManager.info(210, "QidoRS tester passed!")
        print("QidoRS tester passed!")
        sys.exit(0)
