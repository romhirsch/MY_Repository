import AlgoDB
from AlgoLog import LogManager
import sys
import socket
import subprocess


class OracleAccessLayer(object):
    __singleton_instance = None
    __oracle_client = None

    def __init__(self, username, password, ip):
        LogManager.init(False)
        connection_string = f"{username}/{password}@//{ip}:1521/mst1"
        self.__oracle_client = AlgoDB.AlgoOracleWrapper(connection_string=connection_string)

    @classmethod
    def instance(cls, username, password, ip):
        if not cls.__singleton_instance:
            cls.__singleton_instance = cls(username, password, ip)
        return cls.__singleton_instance

    def query(self, query):
        results = self.__oracle_client.execute_query(query, timeout=30)
        if len(results) == 0:
            print("No results from DB!")
        return results


def copy2clip(txt):
    cmd = 'echo '+txt.strip()+'|clip'
    return subprocess.check_call(cmd, shell=True)


def run():
    if len(sys.argv) > 1:
        ip = sys.argv[1]
    else:
        ip = "localhost"
    result = query(ip)

    study_uid = result["STUDY_UID"]
    series_uid = result["SERIES_UID"]
    sop_uid = result["SOP_UID"]
    wado_url = f"http://{ip}/WadoRS/WadoRS.svc/{socket.gethostname()}FIR/studies/{study_uid}/series/{series_uid}/instances/{sop_uid}/metadata?user_name=ci&password=ci"
    qido_url = f"http://{ip}/QidoRS/qidors.svc/{socket.gethostname()}FIR/studies/{study_uid}/series/{series_uid}/instances?limit=10&user_name=ci&password=ci"

    print("Latest study was pushed on " + result["INSERT_TIME"].strftime('%d/%m/%Y, %H:%M'))
    print("\tStudy instance UID: \t" + study_uid)
    print("\tSeries instance UID: \t" + series_uid)
    print("\tSop instance UID: \t" + sop_uid)
    print(f"\nWado url:\n\t" + wado_url)
    print(f"\nQido url:\n\t" + qido_url)

    copy2clip(sop_uid)
    copy2clip(series_uid)
    copy2clip(study_uid)


def query(ip):
    query_string = "select stu.study_instance_uid study_uid, ser_join.ser series_uid, sop_join.sop sop_uid, stu.INSERT_TIME " \
                   "from" \
                   "(select study_instance_uid, insert_time from didb_studies order by insert_time desc) stu, " \
                   "(select min(series_instance_uid) ser, study_instance_uid from didb_serieses group by study_instance_uid) ser_join, " \
                   "(select min(sop_instance_uid) sop, series_instance_uid from didb_raw_images group by series_instance_uid) sop_join " \
                   "where ser_join.study_instance_uid = stu.study_instance_uid and rownum <= 1"
    DAL = OracleAccessLayer.instance("medistore", "a1r4c3h6", ip)
    output = DAL.query(query_string)[0]
    return output


if __name__ == '__main__':
    run()
