import threading
import AlgoDB
from AlgoLog import LogManager


class OracleAccessLayer(object):
    __singleton_lock = threading.Lock()
    __singleton_instance = None
    __oracle_client = None

    def __init__(self, username, password, ip):
        # LogManager.init(False)
        connection_string = f"{username}/{password}@//{ip}:1521/mst1"
        self.__oracle_client = AlgoDB.AlgoOracleWrapper(connection_string=connection_string)
        LogManager.debug(210, "AlgoOracleWrapper instance was created with connection string: {}".format(connection_string))

    @classmethod
    def instance(cls, username, password, ip):
        if not cls.__singleton_instance:
            with cls.__singleton_lock:
                if not cls.__singleton_instance:
                    cls.__singleton_instance = cls(username, password, ip)
        return cls.__singleton_instance

    def __query(self, query):
        thread_lock = threading.Lock()
        results = {}
        with thread_lock:
            try:
                results = self.__oracle_client.execute_query(query, timeout=120)
            except AlgoDB.SqlExecutionError:
                LogManager.error(210, "Database execution error - check SQL logs")
                print("Database execution error - check SQL logs")
            except AlgoDB.SqlTimeoutException:
                LogManager.error(210, "AlgoDB caught SqlTimeoutException")
                print("AlgoDB caught SqlTimeoutException")
        if len(results) == 0:
            print("No results from DB!")
            LogManager.warn(210, "No results for query: " + str(query))
        return results

    def get_series_of_study(self, study_instance_uid):
        results = self.__query(f"SELECT series_instance_uid FROM didb_serieses_table "
                               f"WHERE study_instance_uid='{study_instance_uid}'")
        if len(results) == 0:
            print("get_series_of_study is empty")
            LogManager.warn(210, "get_series_of_study is empty")
            return {}
        return results

    def get_study_information(self, study_instance_uid):
        results = self.__query(f"SELECT * FROM didb_studies "
                               f"WHERE study_instance_uid='{study_instance_uid}'")
        if len(results) == 0:
            print("get_study_information is empty")
            LogManager.warn(210, "get_study_information is empty")
            return {}
        return results[0]

    def get_series_information(self, series_instance_uid):
        results = self.__query(f"SELECT * FROM didb_serieses_table "
                               f"WHERE series_instance_uid='{series_instance_uid}'")
        if len(results) == 0:
            print("get_series_information is empty")
            LogManager.warn(210, "get_series_information is empty")
            return {}
        return results[0]

    def get_hcff_files(self, study_instance_uid):
        results = self.__query(f"SELECT didb_studies.study_instance_uid, didb_studies.study_db_uid, didb_study_header_location.directory_path, didb_study_header_location.num_of_files FROM didb_studies "
                               f"JOIN didb_study_header_location "
                               f"ON didb_studies.study_db_uid = didb_study_header_location.study_db_uid "
                               f"WHERE study_instance_uid='{study_instance_uid}'")
        if len(results) == 0:
            print("get_hcff_files is empty")
            LogManager.warn(210, "get_hcff_files is empty")
            return {}
        return results[0]

    def get_sop_information(self, sop_instance_uid):
        results = self.__query(f"SELECT * FROM didb_raw_images "
                               f"WHERE sop_instance_uid='{sop_instance_uid}'")
        if len(results) == 0:
            print("get_sop_information is empty")
            LogManager.warn(210, "get_sop_information is empty")
            return {}
        return results[0]

    def get_n_random_sops(self, n):
        a = f"SELECT * FROM " + f"(SELECT STUDY_INSTANCE_UID, SERIES_INSTANCE_UID, SOP_INSTANCE_UID " + f"FROM didb_raw_images ORDER BY DBMS_RANDOM.RANDOM) " + f"WHERE rownum < '{n}'"
        results = self.__query(a)
        if len(results) == 0:
            print("get_n_random_sops is empty")
            LogManager.warn(210, "get_n_random_sops is empty")
            return {}
        return results
