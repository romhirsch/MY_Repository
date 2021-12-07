import logging
from inspect import getframeinfo, stack, currentframe
import ctypes
import os
from enum import Enum, unique
import abc
import sys
import functools
import re
import AlgoGlobalFuncs

'''
AlgoLog - Relevant to python 3
Design:
1) AlgoLog cls is an 'intermediate' class, which 'manages' the logging, by default it will always to try to initialize 
using the PACS logging DLL.
2) At the moment (9.10.2018), two logging options exist:
    a) Logging via a logging DLL (From 12.1 and onward).
    b) Logging via the python logging module (Else).
3) The logging 'options' are implemented by static classes which inherit from __AlgoLogAbstract, and must define:
    a) init function (Initializes the log connection)
    b) l function (message)

Notice:
In order to not Overhead the logging, the log level in the logger file, is checked only once per script 
(Changes in the requested log level will take affect only on process restart)

Usage:
In order to log all you need to do is call init and then LogManager.xxx().
For example:

LogManger.init(print_to_console_flag = True/False)
LogManger.info(package_id, log_level, message_1, print_to_console_flag = True/False)
LogManger.debug(package_id, log_level, message_2, print_to_console_flag = True/False)
LogManger.error(package_id, log_level, message_3, print_to_console_flag = True/False)
and so on...
'''

# Make sure to close via the DLL (In non-default logger)
# Add documentation for one time read

LOG_LOCATION_SYSTEM_KEY = "IMAGINET_LOG_DIR"

LOG_PACKAGE_EXCEPTION = 0
LOG_PACKAGE_ALGO_DB = 749

class AlgoLoggingException(Exception):
    def __init__(self, message, leading_exception, package_id):
        # Set message
        super().__init__(self, message)

        # Append to log
        log_message = "{},\n Exception info : {}".format(message, leading_exception)
        self.log(log_message, package_id)

    def log(self, message, package_id):
        # Print / Log
        if (LogManager.log_handler is None):
            print(message)
        else:
            LogManager.l(package_id, AlgoLogLevelEnum.ERROR_3, message)

class AlgoLogHandlerNotInitializedException(Exception):
    def __init__(self, message):
        self.message = message


class AlgoLogIncorrectLogLevelException(Exception):
    def __init__(self, message):
        self.message = message




@unique
class AlgoLogLevelEnum(Enum):
    # Enum dictating the allowed log levels (As defined by the algotec logging standard)
    SEVERE_1 = 1
    CRITICAL_2 = 2
    ERROR_3 = 3
    WARNING_4 = 4
    NOTICE_5 = 5
    INFO_6 = 6
    DEBUG_7 = 7

    @classmethod
    def has_value(cls, value):
        '''
        Function name: has_value
        Description  : Checks if the value is supported by the enum
        Arguments    : value, a value to be checked
        Return value : True - Part of the enum, False - Not part of the enum
        '''
        return any(value == item.value for item in cls)


class LogManager:
    log_handler = None  # type: _AlgoLogAbstract
    global_print_to_console_flag = False
    package_log_level_dict = {}
    LOGGER_CONTENT = ""
    @staticmethod
    def init(global_print_to_console_flag = False):
        '''
        Function name: init
        Description  : initializes the proper log handler (Depending on the existence of the AlgoLogDLL)
        Arguments    : global_print_to_console_flag - Dictates if all prints should be printed to console as well
        Return value : None
        '''
        if not (LogManager.log_handler is None):
            # In case log manager is allready initiliazed, no need to re-init
            return

        # Build log file location
        script_name = os.path.basename(sys.argv[0]).replace(".py", "")
        log_dir_location = os.environ[LOG_LOCATION_SYSTEM_KEY]

        # Try initializing algolog DLL, if not open via python formatter
        try:
            # The log dll, knows to print logs to "imaginet_log_dir", so no need for direct path
            _AlgoLogDll.init("{}.log".format(script_name))
            LogManager.log_handler = _AlgoLogDll
        except Exception as ex:
            print("tmr.dll was not found in %imaginet_log_dir%, please compile it from ver 12.3+")
            print("Initiliazing python logger, NOT RECOMMENDED!!")
            # Python formatter is not completley identical to AlgoLogDLL
            file_location = r"{}\{}.log".format(log_dir_location, script_name)
            _AlgoLogDefault.init(file_location)
            LogManager.log_handler = _AlgoLogDefault

        LogManager.global_print_to_console_flag = global_print_to_console_flag

    @staticmethod
    def log(package_id, log_level, message, print_to_console_flag = False):
        '''
        Function name: log
        Description  : Print the message to the log
        Arguments    : package_id - ID of the package the message belongs to
                       log_level  - Log level of the message (Taken from AlgoLogLevelEnum)
                       message    - Actual message
                       print_to_console_flag - Flag dictating if message should be printed to console as well
        Return value : None
        '''
        if LogManager.log_handler is None:
            raise AlgoLogHandlerNotInitializedException("Trying to log before initializing AlgoLog")
        if AlgoLogLevelEnum.has_value(log_level):
            raise AlgoLogIncorrectLogLevelException("Please use the AlgoLogLevelEnum when sending a message")
        package_log_level = LogManager.get_logging_level_of_package(package_id)
        if log_level.value > package_log_level.value:
            # Log level, if higher then the configured log level - no printing will be done
            return

        LogManager.log_handler.message(package_id, log_level, message)
        if LogManager.global_print_to_console_flag or print_to_console_flag:
            print("Package ID : {}, Log level : {}, message : {}".format(package_id, log_level, message))

    @staticmethod
    def debug(package_id, message, print_to_console_flag=False):
        LogManager.log(package_id, AlgoLogLevelEnum.DEBUG_7, message, print_to_console_flag)

    @staticmethod
    def info(package_id, message, print_to_console_flag=False):
        LogManager.log(package_id, AlgoLogLevelEnum.INFO_6, message, print_to_console_flag)

    @staticmethod
    def notice(package_id, message, print_to_console_flag=False):
        LogManager.log(package_id, AlgoLogLevelEnum.NOTICE_5, message, print_to_console_flag)

    @staticmethod
    def warn(package_id, message, print_to_console_flag=False):
        LogManager.log(package_id, AlgoLogLevelEnum.WARNING_4, message, print_to_console_flag)

    @staticmethod
    def error(package_id, message, print_to_console_flag=False):
        LogManager.log(package_id, AlgoLogLevelEnum.ERROR_3, message, print_to_console_flag)

    @staticmethod
    def critical(package_id, message, print_to_console_flag=False):
        LogManager.log(package_id, AlgoLogLevelEnum.CRITICAL_2, message, print_to_console_flag)

    @staticmethod
    def severe(package_id, message, print_to_console_flag=False):
        LogManager.log(package_id, AlgoLogLevelEnum.SEVERE_1, message, print_to_console_flag)

    @staticmethod
    @functools.lru_cache(maxsize=None)
    def get_logging_level_of_package(package_id):
        '''
        Function name: get_logging_level_of_package
        Description  : Gets the current set log level of the package (Will query if not saved in cache)
        Arguments    : package_id - The id of the package to be checked
        Return value : The value
        '''
        try:
            if LogManager.LOGGER_CONTENT == "":
                logger_location = r"{}\logger".format(os.environ[LOG_LOCATION_SYSTEM_KEY])
                with open(logger_location, 'r') as file_handler:
                    LogManager.LOGGER_CONTENT = file_handler.read()

            match = re.search('({})          (.)', LogManager.LOGGER_CONTENT)
            output = int(match.group(2))
        except:
            exit_code = -1

        if exit_code == 0:
            log_level = output
        else:
            # If not found, default log level
            log_level = AlgoLogLevelEnum.DEBUG_7

        return log_level


class _AlgoLogAbstract:
    __metaclass__ = abc.ABCMeta


    @abc.abstractstaticmethod
    def init(file_location):
        pass

    @abc.abstractstaticmethod
    def message(package_id, log_level, message):
        pass


class _AlgoLogDefault(_AlgoLogAbstract):
    algotec_to_python_logging_conversion = {AlgoLogLevelEnum.SEVERE_1: logging.CRITICAL,
                                            AlgoLogLevelEnum.CRITICAL_2: logging.CRITICAL,
                                            AlgoLogLevelEnum.ERROR_3: logging.ERROR,
                                            AlgoLogLevelEnum.WARNING_4: logging.WARNING,
                                            AlgoLogLevelEnum.NOTICE_5: logging.INFO,
                                            AlgoLogLevelEnum.INFO_6: logging.INFO,
                                            AlgoLogLevelEnum.DEBUG_7: logging.DEBUG}

    @staticmethod
    def init(file_location):
        '''
        Function name: init
        Description  : Initializes the logging module formatter (To be exactly the same as the DLL)
        Arguments    : file_location - Location of the log
        Return value : None
        '''
        root_logger = logging.getLogger()
        file_handler= logging.FileHandler(file_location)
        file_formatter = logging.Formatter(
            '%(asctime)s.%(msecs)03d %(levelno)s script[%(process)d,%(thread)d] %(my_func_name)s (%(my_line_no)d): %(message)s',
            datefmt="%d/%m %H:%M:%S")
        file_handler.setFormatter(file_formatter)
        our_filter = _AlgoLogDefault._ContextFilter()
        file_handler.addFilter(our_filter)
        root_logger.addHandler(file_handler)
        logging.getLogger().setLevel(logging.DEBUG)
        root_logger.propagate = False

    @staticmethod
    def message(package_id, log_level, message):
        '''
        Function name: message
        Description  : Writes the message via the logging module
        Arguments    : package_id - ID of the package the message belongs to
                       log_level  - Log level of the message (Taken from AlgoLogLevelEnum)
                       message    - Actual message
        Return value : None
        '''
        python_logging_level = _AlgoLogDefault.algotec_to_python_logging_conversion[log_level]
        logging.log(python_logging_level, message)

    class _ContextFilter(logging.Filter):
        def filter(self, record):
            # Stack number is set to 10, due to various python logger structure calls
            caller = getframeinfo(stack()[10][0])
            record.my_func_name = caller.function
            record.my_line_no = caller.lineno
            return True


class _AlgoLogDll(_AlgoLogAbstract):
    _write_log_func = None
    @staticmethod
    def init(file_location):
        '''
        Function name: init
        Description  : Initializes the DLL
        Arguments    : file_location - Location of the log
        Return value : None
        '''
        if AlgoGlobalFuncs.get_version() == AlgoGlobalFuncs.NO_VERSION_FOUND_VALUE:
            imaginet_log_dir_location = os.environ["IMAGINET_LOG_DIR"]
            dll_path = os.path.join(imaginet_log_dir_location, "tmr.dll")
            # On local PC :
            loaded_dll = ctypes.cdll.LoadLibrary(dll_path)
        else:
            # On server :
            loaded_dll = ctypes.cdll.tmr

        # Initialize(Define ctypes arguments, in order to convert to python) open_log_func function fromm DLL
        open_log_func = loaded_dll.VBLog_OpenLog
        open_log_func.argtypes = [ctypes.c_char_p, ctypes.c_char_p]  # log_file_name,app_name

        # Initialize write_log_func
        # function fromm DLL using ctypes
        _AlgoLogDll._write_log_func = loaded_dll.VBLog_Log
        _AlgoLogDll._write_log_func.argtypes = [ctypes.c_char_p, ctypes.c_long, ctypes.c_char_p, ctypes.c_long,
                                         ctypes.c_long]  # sMsg, long lLevel ,sFileName, long lLine, long lPackageName
        open_log_func(file_location.encode("utf-8"), "script".encode("utf-8"))

    @staticmethod
    def message(package_id, log_level, message):
        '''
        Function name: message
        Description  : Writes the message via the DLL
        Arguments    : package_id - ID of the package the message belongs to
                       log_level  - Log level of the message (Taken from AlgoLogLevelEnum)
                       message    - Actual message
        Return value : None
        '''
        # We get frame info from the second frame, due to the 2 calls from the original function
        caller = getframeinfo(stack()[2][0])
        if (caller.filename == "AlgoLog" and caller.__class__ == type(AlgoLoggingException)):
            # In case the log was written from the AlgoLoggingException, we get two stack backwards (for original calling function)
            caller = getframeinfo(stack()[4][0])
        try:
            caller_description = "{} : {}".format(caller.filename, caller.function)
            _AlgoLogDll._write_log_func(message.encode("utf-8"), log_level.value, caller_description.encode("utf-8"),
                                        caller.lineno, package_id)
        except Exception as ex:
            print("Exception occurred when trying to write the following message to the log file: {}, "
                  "Exception info : {}".format(message, ex))



# Example of use:
#LOG_PACKAGE_TEST = 15
#PRINT_TO_CONSOLE_FLAG = True

#LogManger.init(PRINT_TO_CONSOLE_FLAG)
#LogManger.log(package_id=LOG_PACKAGE_TEST, log_level=AlgoLogLevelEnum.WARNING_4, message="some_message", print_to_console_flag=True)
#LogManger.log(LOG_PACKAGE_TEST, AlgoLogLevelEnum.WARNING_4, "some_message", False)