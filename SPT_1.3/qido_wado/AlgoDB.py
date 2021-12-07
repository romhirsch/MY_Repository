import _thread
import threading
import time
import cx_Oracle
import AlgoGlobalFuncs
from AlgoLog import LogManager, AlgoLogLevelEnum, AlgoLoggingException


'''
AlgoDB - Relevant to python 3
Readme:
1) Installing cx_oracle : "python -m pip install cx_oracle" (in cmd)
2) Make sure your system PATH includes the path to the correct ORACLECLIENT (Needs to be 12+), 
after updating the path make sure to system reset.
3) Make sure you python version/oracle client operating system (64 bit) are compatible with your computer.

Use:
oracle_client = AlgoOracleWrapper()
a = oracle_client.execute_query("select * from DIDB_STUDIES where study_db_uid = 681", timeout = 120)

Documentation:
    cx_Oracle official documentation: https://cx-oracle.readthedocs.io/en/latest/index.html
    cx_Oracle explanation link: https://www.oracle.com/technetwork/articles/dsl/prez-python-queries-101587.html
'''
LOG_PACKAGE_ALGO_DB = 257
DB_DEFAULT_TIMEOUT = 60 # Secs


class NoConnectionError(Exception):
    def __init__(self, message):
        self.message = message


class SqlExecutionError(Exception):
    def __init__(self, message):
        self.message = message


class SqlTimeoutException(Exception):
    def __init__(self, message):
        self.message = message


class AlgoOracleWrapper:
    '''
    Important:
        cx_Oracle cursor is a iterator type object, meaning no query execution will be done until the fetch is done.
    '''
    def __init__(self, user_name="", password="", destination="medistore", max_bulk_size=100, connection_string=None):
        '''
        Function name: __init__
        Description: Initializes the AlgoOracleWrapper class
        Arguments:
            user_name   - Username used for connection to the oracle DB
            password    - Password used for connection to the oracle DB
            destination - Name used for connection (as defined in TNSNAME files on the local computer)
            max_bulk_size  - A value defining the max amount of allowed 'rows' returned on each sql query,
                          the lower the number the more 'back and forth' communications between the program and the DB.
            connection_string - Defines the connection string to oracle, if different then None will use it
        Return value: N/A
        '''
        self.__connection_handler = None
        self.destination = destination
        self.max_bulk_size = max_bulk_size
        self.connection_string = connection_string
        if connection_string is None:
            # Build connection string
            self.connection_string = "{}/{}@{}".format(user_name, password, destination)

        LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.INFO_6,
                               "Initiliazed AlgoDB with connection string = {}".format(connection_string))

    @property
    def db_name(self):
        '''
        Function name: db_name getter
        Description: db_name getter
        Arguments: N/A
        Return value: db_name
        '''
        return self._db_name

    @db_name.setter
    def db_name(self, value):
        '''
        Function name: db_name setter
        Description  : Prevents assigning value to the db_name
        Arguments    : value
        Return value : N/A
        '''
        raise NameError("Changing the db_name is not allowed")

    def __connect_to_db(self):
        '''
        Function name: __connect_to_db
        Description  : Connects to DB
        Arguments    : None
        Return value : None
        '''
        try:
            self.__connection_handler = cx_Oracle.connect(self.connection_string)
            self.cursor = self.__connection_handler.cursor()
            self.cursor.arraysize = self.max_bulk_size
        except Exception as ex:
            LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.ERROR_3,
                                   "Exception occurred when trying to connect with the following connection_string : {}".
                                   format(self.connection_string))
            LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.ERROR_3,
                                   "Exception information : {}".format(ex))
            raise


    def __verify_and_connect_to_db(self):
        '''
        Function name: __verify_and_connect_to_db
        Description  : Checks that the db_connection is initialized, if not initialize
        Arguments    : None
        Return value : Raises an exception in case its closed
        '''
        if self.__connection_handler is None:
            self.__connect_to_db()
            LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.INFO_6, "Connected to DB")

    @AlgoGlobalFuncs.function_timeout_decorator
    def execute_query(self, sql_query, timeout=DB_DEFAULT_TIMEOUT):
        '''
        Function name: execute_query
        Description:
            Executes query and returns results
        Arguments:
            sql_query - String containing the full sql query
            timeout - Timeout for execution (in secs), this must be defined explicitly in order for it to be contained in **kwargs
            Example execute_query("some sql query", timeout = 120)
        Return Value:
            A list containing Dict's, Example : ["column_name", "column_value"]
            In case of an execution error SqlExecutionError will be raised
        '''

        # Verify connection is online, and connect if not
        self.__verify_and_connect_to_db()
        try:
            LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.INFO_6,
                                   "Executing the following SQL query : {}".format(sql_query))
            self.cursor.execute(sql_query)
            query_result = self.cursor.fetchall() # list of rows
            column_data_list = self.cursor.description # List of tuples (column_name, type)
            column_names = [item[0] for item in column_data_list]

            query_result_list = []
            for current_row in query_result:
                # Creates the dict as defined in the return value
                query_result_list.append(dict(zip(column_names, current_row)))

            LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.DEBUG_7,
                                   "Recieved the following result : {}".format(query_result_list))

        except cx_Oracle.DatabaseError as ex:
            exception_arguments, = ex.args
            LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.ERROR_3,
                         "Error occurred when executing : {}, Oracle error code : {}, Oracle error message : {}".
                   format(sql_query, exception_arguments.code, exception_arguments.message))
            raise SqlExecutionError("Exception in execution / fetch, see log for more information")
        except cx_Oracle.InterfaceError as ex:
            LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.ERROR_3,
                         "The sql statement requested is not a SQL transaction {}, Oracle error message : {}".
                         format(sql_query, ex))
            raise SqlExecutionError("Exception in execution / fetch, see log for more information")
        except Exception as ex:
            print("Unrecognized error occurred with the following data : {}, sql transaction : {}".format(ex, sql_query))
            raise SqlExecutionError("Exception in execution / fetch, see log for more information")

        return query_result_list

    @AlgoGlobalFuncs.function_timeout_decorator
    def execute_transaction(self, sql_statement, payload = None, timeout=DB_DEFAULT_TIMEOUT):
        '''
        Function name: execute_insert
        Description:
            Executes SqL insert/update transaction
        Arguments:
            sql_statement - String containing the full sql statement
            timeout - Timeout for execution (in secs), this must be defined explicitly in order for it to be contained in **kwargs
            Example execute_transaction("some sql insert or update statement", timeout = 120)
        Return Value:
            rows_affected - Number of rows affected by the sql query
        '''

        # Verify connection is online, and connect if not
        self.__verify_and_connect_to_db()
        try:
            LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.INFO_6,
                                   "Executing the following sql command : {}".format(sql_statement))
            if payload is None:
                self.cursor.execute(sql_statement)
            else:
                self.cursor.execute(sql_statement, payload)

        except cx_Oracle.DatabaseError as ex:
            exception_arguments, = ex.args
            LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.ERROR_3,
                                   "Error occurred when executing : {}, "
                                   "Oracle error code : {}, "
                                   "Oracle error message : {}".
                                   format(sql_statement, exception_arguments.code, exception_arguments.message))
            raise SqlExecutionError("Exception in execution, see log for more information")
        except cx_Oracle.InterfaceError as ex:
            LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.ERROR_3,
                                   "The sql statement requested is not a SQL transaction {}, Oracle error message : {}".
                                   format(sql_statement, ex))
            raise SqlExecutionError("Exception in execution, see log for more information")
        except Exception as ex:
            LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.ERROR_3,
                                   "Unrecognized error occurred with the following data : {}".format(ex))
            raise SqlExecutionError("Exception in execution, see log for more information")

        return self.cursor.rowcount

    def commit_connection(self):
        '''
        Function name: commit_connection
        Description  : Commits the connection to the DB
        Arguments    : None
        Return value : None
        '''
        LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.DEBUG_7, "Commiting changes to DB")
        self.__connection_handler.commit()

    def close_connection(self):
        '''
        Function name: close_connection
        Description  : Closes connection to the DB
        Arguments    : None
        Return value : None
        '''
        if not (self.__connection_handler is None):
            self.__connection_handler.close()
            self.__connection_handler = None
        LogManager.log(LOG_PACKAGE_ALGO_DB, AlgoLogLevelEnum.INFO_6, "Closed connection to DB")

    def __del__(self):
        '''
        Function name: __del__
        Description  : Class destructor, verifies connection to the DB is closed
        Arguments    : None
        Return value : None
        '''
        if not (self.__connection_handler is None):
            self.close_connection()



#Example of use :
#oracle_client = AlgoOracleWrapper()
#a = oracle_client.execute_query("select * from DIDB_STUDIES where study_db_uid = 681", timeout = 120)
#print(a)
