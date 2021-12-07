import os
import sys
import winreg
import threading
import _thread
import win32serviceutil
import win32service
import win32api
import importlib
import ntpath
import time

########################################################################################################################
# Misc                                                                                                                 #
########################################################################################################################

def check_admin_rights():
    '''
    Function name: check_admin_rights
    Description  : Checks if you are running with adming rights
    Arguments    : None
    Return value : True - Running with administrator rights, False - Not running
    '''
    import ctypes
    is_admin = ctypes.windll.shell32.IsUserAnAdmin() != 0
    return is_admin


########################################################################################################################
# Algotec global exceptions                                                                                            #
########################################################################################################################


class TimeoutException(Exception):
    def __init__(self, message):
        self.message = message


class AlgotecLoggingException(Exception):
    def __init__(self, message):
         a= 2

########################################################################################################################
# Import python modules                                                                                                #
########################################################################################################################


def import_python_script(python_script_path):
    '''
    Function name: import_python_script
    Description  : Import the python script dynamically
    Arguments    : python_script - full path to a python script
    Return value : current_import_module - import module
    '''
    try:
        script_path, script_name = ntpath.split(python_script_path)
        python_script_path = os.path.expandvars(python_script_path)
        spec = importlib.util.spec_from_file_location(script_name, python_script_path)
        current_imported_module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(current_imported_module)

    except Exception as ex:
        raise Exception("Failed importing : {}".format(python_script_path)) from ex

    return current_imported_module

########################################################################################################################
# Control processes                                                                                                    #
########################################################################################################################


def check_if_process_is_running(pid, command_path):
    if (pid < 0):
        # Pids arent allowed to be negative - So the process can not be running
        return False
    import wmi
    windows_manager = wmi.WMI()
    for process in windows_manager.Win32_Process(ProcessID=pid):
        if not (process.CommandLine is None):
            if (command_path in process.CommandLine):
                return True
    return False


def get_process_pid_by_command_line(command_line):
    import wmi
    windows_manager = wmi.WMI()
    for process in windows_manager.Win32_Process():
        if (process.CommandLine == command_line):
            return int(process.Properties_('ProcessID'))
    return None

def check_if_python_script_is_running(script_name):
    '''
    Function name: get_python_process_pid_by_script_name
    Description  : Returns the PID of python process running the 'script_name'
    Arguments    : script_name - Name of script
    Return value : True - Running, False - Not running
    '''
    import wmi
    windows_manager = wmi.WMI()
    for process in windows_manager.Win32_Process():
        if (process.Name.contains("python")) and (process.CommandLine.contains(script_name)):
            # The process running will be some variation of python.exe, the argument will contain the script name
            return True

    return False

def wait_for_python_script_to_close(script_name, time_out):
    '''
    Function name: wait_for_python_script_to_close
    Description  : Keeps testing of python script is running, untill timeout is reached
    Arguments    : script_name - Name of script
                   time_out - Timeout (in secs)
    Return value : True - Script closed, False - Script running
    '''
    start_time = time.time()
    while True:
        if (time.time() - start_time >= time_out):
            return False

        if not (check_if_python_script_is_running(script_name)):
            return True

def terminate_process_by_pid(pid):
    PROCESS_TERMINATE = 1
    handle = win32api.OpenProcess(PROCESS_TERMINATE, False, pid)
    win32api.TerminateProcess(handle, -1)
    win32api.CloseHandle(handle)


########################################################################################################################
# Control services                                                                                                     #
########################################################################################################################


class windows_service_util_wrapper():

    def __init__(self, service_name):
        self.service_name = service_name

    def stop_service(self):
        win32serviceutil.StopService(self.service_name)

    def start_service(self):
        win32serviceutil.StartService(self.service_name)

    def restart_serivce(self):
        win32serviceutil.RestartService(self.service_name)

    def wait_for_service_to_stop(self, timeout = 60):
        try:
            win32serviceutil.WaitForServiceStatus(self.service_name, win32service.SERVICE_STOPPED, timeout)
        except:
            return False
        return True

    def wait_for_service_to_start(self, timeout = 60):
        try:
            win32serviceutil.WaitForServiceStatus(self.service_name, win32service.SERVICE_ACTIVE, timeout)
        except:
            return False
        return True



########################################################################################################################
# Adds all sub direcotry's to the proccesses python path                                                               #
########################################################################################################################

def add_tree_to_python_path(path):
    # Go over each directory and file in path
    for f in os.listdir(path):

        pathname = os.path.join(path, f)
        if (os.path.isdir(pathname)):
            # Add path to PYTHONPATH
            sys.path.append(pathname)
            # Since it is a directory we recurse on it
            add_tree_to_python_path(pathname)
        else:
            # current itteration is on a file, so its irrelevant
            continue


########################################################################################################################
# Get Algotec server version                                                                                           #
########################################################################################################################


VERSION_LOCATIONS = [r"SOFTWARE\Algotec\install", r"SOFTWARE\Wow6432Node\Algotec\install\versions"]
NO_VERSION_FOUND_VALUE = "0"


def get_version():
    '''
    Function name: get_version
    Description  : Get the pacs version via the winreg
    Arguments    : None
    Return value : Pacs version as a string, In case of not manging to get it NO_VERSION_FOUND_VALUE will be returned
    '''
    current_version = None
    versions = None
    last_exception = None

    for current_version_location in VERSION_LOCATIONS:
        # Iterate over the possible locations in the win reg
        try:
            versions = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, current_version_location)
            value, type = winreg.QueryValueEx(versions, "Version")
            current_version = str(value)

        except Exception as e:
            current_version = None
            last_exception = e

        finally:
            if versions is not None:
                winreg.CloseKey(versions)

        if current_version is not None:
            break

    if current_version is None:
        #print("Failed to get version. {}".format(last_exception if last_exception is not None else ""))
        return NO_VERSION_FOUND_VALUE

    return current_version

########################################################################################################################
# Threaded timeout support (Via decorator)                                                                             #
########################################################################################################################


def interrupt_function(function_name):
    '''
    Function name: interrupt_function
    Description  : Interrupts the function use the 'interrupt_main' builtin function
    Arguments    : Function_name, used for logging purposes
    Return value : None
    '''
    print("{} exceeded timeout value, raising interrupt...".format(function_name))
    _thread.interrupt_main()


def function_timeout_decorator(caller_function):
    '''
    Function name: function_timeout_decorator
    Description  : Creates a new function, which is monitored and terminates if exceeds timeout
    Arguments    : caller_function
    Return value : New 'managed' function
    '''
    default_thread_timeout = 60

    def managed_function(*args, **kwargs):
        if "timeout" in kwargs:
            # Check if kwargs contains a 'timeout' variable, if it does sets it as the timeout
            timeout = kwargs["timeout"] # secs
        else:
            timeout = default_thread_timeout
        # Initializes the thread
        timer = threading.Timer(timeout, interrupt_function, args = [caller_function.__name__])
        timer.start()
        try:
            result = caller_function(*args)
        except KeyboardInterrupt as e:
            # interrupt_function initiates a keyboard interrupt event on time out
            error_message = "Timeout reached on function : {}, timeout : {}".\
                format(caller_function.__name__, timeout)
            print(error_message)
            raise TimeoutException(error_message)
        except Exception:
            # In case of any other exception the entire call stack is raised to caller
            raise
        finally:
            timer.cancel()
        return result
    return managed_function
