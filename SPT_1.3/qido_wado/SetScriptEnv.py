import os
import sys
import subprocess as proc
import shutil
import socket
import json
from TestPlanGenerator import Main as Generator


def run():
    if "--copy" in sys.argv:
        copy_files()
    test_type = sys.argv[1] if len(sys.argv) > 1 else "sequential"  # default
    test_plan_path = create_test_plan(test_type)
    create_test_params(test_plan_path)
    print("\nRun the tester with -h argument for detailed instruction (e.g. WadoRS_tester.py -h)\n")
    os.system("py WadoRS_tester.py -h")


def copy_files():
    source = os.getenv("imaginet_root") + r"\scripts\Web_Services_Testers"
    dest = os.getcwd()
    shutil.copytree(source, os.getcwd())
    print("\nAll files were copied into " + dest)


def create_test_plan(test_type):
    out = proc.getoutput(f'py TestPlanGenerator.py {test_type} .\\test-plan-config.json').splitlines()
    test_plan_path = ".\\"
    for i in out:
        if i.startswith("Output location: "):
            test_plan_path = i[i.index("Output location: ") + 17:]
    print("\nTest plan was created in " + test_plan_path)
    return test_plan_path


def create_test_params(test_plan_path):
    single_test_args = {"active": "True", "called_ae": socket.gethostname() + "FIR", "ip": "localhost", "username": "x",
                        "password": "x", "db_ip": "localhost", "db_username": "medistore", "db_password": "a1r4c3h6",
                        "test_plan_path": test_plan_path, "restart_between_tests": "False",
                        "output_format": "csv", "output_path": ".\\Results", "export_response_output": "True",
                        "request_timeout_minutes": 3, "requests_per_minutes": 100, "comment": "test1"}
    list_args = [single_test_args]
    with open('auto-test-params.json', 'w') as outfile:
        json.dump(list_args, outfile, indent=4)
    print("\nTest params was created in " + os.getcwd() + "\\" + 'auto-test-params.json')


if __name__ == "__main__":
    run()
