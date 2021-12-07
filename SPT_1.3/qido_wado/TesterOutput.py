import sys
import csv
import datetime
import itertools
import xlsxwriter
from AlgoLog import LogManager
from abc import ABC, abstractmethod


class OutputWriter(ABC):

    @abstractmethod
    def write_scenario(self, scenario):
        raise NotImplementedError

    @abstractmethod
    def write_headers(self):
        raise NotImplementedError


class ExcelOutput(OutputWriter):

    def __init__(self, headers, path):
        self.m_path = path
        self.output_headers = headers
        self.row_index = 1
        self.first_row = True
        self.workbook = xlsxwriter.Workbook(self.path)
        self.worksheet = self.workbook.add_worksheet('Results table')
        self.base_style = {'border': True, 'center_across': True}

    @property
    def path(self):
        return f"{self.m_path}\\results-{datetime.datetime.now().strftime('%m%d_%H%M%S')}.xlsx"

    def write_scenario(self, scenario):
        if self.first_row:
            self.write_headers()
            self.first_row = False
        if not scenario.test_passed:
            self.write_failed_scenario(scenario)
        else:
            self.write_passed_scenario(scenario)

    def write_passed_scenario(self, scenario):
        for header in scenario.row_output:
            cell_format = self.workbook.add_format(self.base_style)
            if scenario.row_output[header] in self.decoration_by_cell_value:
                new_style = {**self.base_style, **self.decoration_by_cell_value[scenario.row_output[header]]}  # append new style to the basic style
                cell_format = self.workbook.add_format(new_style)
            self.worksheet.write(scenario.index, self.output_headers[header], scenario.row_output[header], cell_format)

    def write_failed_scenario(self, scenario):
        cell_format = self.workbook.add_format({'border': True, 'center_across': True, 'bg_color': 'red'})
        self.worksheet.write(scenario.index, 0, int(scenario.test_number), cell_format)
        self.worksheet.write(scenario.index, 1, int(scenario.scenario), cell_format)
        self.worksheet.write(scenario.index, 2, str(scenario.test_result), cell_format)
        self.worksheet.write(scenario.index, 3, int(scenario.status_code), cell_format)
        self.worksheet.write(scenario.index, 4, "Local" if scenario.is_localhost else "Remote", cell_format)
        for i in range(5, len(self.output_headers)):  # set failed for all the other columns
            self.worksheet.write(scenario.index, i, "Failed", cell_format)
        self.worksheet.write(scenario.index, self.output_headers["URL"], scenario.url, cell_format)

    def write_headers(self):
        header_style = self.workbook.add_format({'border': 5})
        header_style.set_bold()
        header_style.set_bg_color("silver")
        header_style.set_center_across()
        for header, pos in self.output_headers.items():
            self.worksheet.write(0, pos, header, header_style)
            if header in self.column_width_by_header_type:
                self.worksheet.set_column(pos, pos, self.column_width_by_header_type[header])
            else:
                self.worksheet.set_column(pos, pos, len(header) * 1.05)

    def summarize_results(self, tests_results, start_line_statistics):
        print("\n\n===========================================\n\t\t\t\tRESULTS\n===========================================")
        self.worksheet.write_row(start_line_statistics, 0, ["Test num", "Duration", "Succession rate"], cell_format=self.workbook.add_format({'align': 'center'}))
        stats_row = start_line_statistics + 1  # one row ahead for the headers
        for test, results in tests_results.items():
            self.worksheet.set_row(stats_row, cell_format=self.workbook.add_format({'align': 'center'}))
            self.worksheet.write_row(stats_row, 0, [int(test), str(results[0]) + " sec", "{}/{}".format(results[1], results[1] + results[2])])
            print("Test {}:\n\tSucceeded scenarios: {}\n\tFailed scenarios: {}".format(test, results[1], results[2]))
            LogManager.info(210, "Test {}: Succeeded scenarios: {}, Failed scenarios: {}".format(test, results[1], results[2]))
            stats_row += 1
        print("===========================================\n")

    def calc_statistic_line(self, title, function, params, line):
        stat_name_cell_position = 'H' + str(line)
        value_cell_position = 'I' + str(line)
        self.worksheet.write_string(stat_name_cell_position, title, cell_format=self.workbook.add_format({'align': 'right'}))
        self.worksheet.write_array_formula(value_cell_position, '{' + f'=={function}({params})' + '}',  cell_format=self.workbook.add_format({'align': 'left'}))

    def create_chart(self, x_col, x_name, y_col, y_name, last_line):
        chart = self.workbook.add_chart({'type': 'line'})
        chart.add_series({
            'categories': "='Results table'!$" + x_col + "$2:$" + x_col + "$" + last_line,
            'values': "='Results table'!$" + y_col + "$2:$" + y_col + "$" + last_line})
        chart.set_x_axis({'name': x_name})
        chart.set_y_axis({'name': y_name})
        return chart

    def create_arguments_worksheet(self, arguments):
        arguments_worksheet = self.workbook.add_worksheet('Test Arguments Input')
        for row, arg in enumerate(arguments):
            arguments_worksheet.write(row, 0, arg)
            arguments_worksheet.write(row, 1, arguments[arg])

    def create_test_plan_worksheet(self, test_plan_path):
        if test_plan_path == "":
            return
        test_plan_worksheet = self.workbook.add_worksheet('Test Plan Input')
        with open(test_plan_path, 'r') as f:
            reader = csv.reader(f)
            for row_idx, row_val in enumerate(reader):
                for col_idx, col_val in enumerate(row_val):
                    test_plan_worksheet.write(row_idx, col_idx, col_val)


class WadoExcelOutput(ExcelOutput):
    decoration_by_cell_value = {"Succeeded": {'bg_color': '#00FF00'},
                                "RICE": {'bg_color': '#FF6666'},
                                "JPEG": {'bg_color': '#FF6600'},
                                "UNCOMPRESSED": {'bg_color': '#FFC000'},
                                "Study": {'bold': True},
                                "Image": {'font_color': '#808080', 'italic': True},
                                "pixel data": {'bg_color': 'cyan'},
                                "metadata": {'bg_color': '#0080FF'},
                                "Loading Time Ratio": {'num_format': '0.####%'}
                                }
    column_width_by_header_type = {"Study Instance UID": 50, "Series Instance UID": 50, "Sop Instance UID": 50,
                                   "URL": 200, "Study Physical Path": 30}

    def __init__(self, headers, path):
        super().__init__(headers, path)

    def write_statistics(self, last_line, tests_results):
        start_line_statistics = last_line + 3
        last_line = str(last_line)
        self.summarize_results(tests_results, start_line_statistics)
        stats_to_write = [("Average Images Per Sec: ", "AVERAGE", f"P2:P{last_line}"),
                          ("Average Images Per Sec (No waiting): ", "AVERAGE", f"Q2:Q{last_line}"),
                          ("Total Images: ", "SUM", f"O2:O{last_line}"),
                          ("Total Time (ms): ", "SUM", f"I2:I{last_line}"),
                          ("Total Loaded Size (KB): ", "SUM", f"M2:M{last_line}"),
                          ("Average Loaded Size (KB/s): ", "", f"(I{start_line_statistics + 3} / I{start_line_statistics + 4}) * 1000"),  # change I if value's position change
                          ("Average Images Per Sec - JSON: ", "AVERAGEIF", f"H2:H{last_line},\"json\", P2:P{last_line}"),
                          ("Average Images Per Sec - XML: ", "AVERAGEIF", f"H2:H{last_line},\"xml\", P2:P{last_line}")]
        for i, stat in enumerate(stats_to_write):
            self.calc_statistic_line(stat[0], stat[1], stat[2], start_line_statistics + i)

        # ---------------------------------------- Graphs ----------------------------------------
        statistics_worksheet = self.workbook.add_worksheet('Statistics')

        # create graph 'image per seconds depends on number of images'
        chart1 = self.create_chart("O", 'Number of Images Loaded', "P", "Images Per Second", last_line)
        statistics_worksheet.insert_chart('A1', chart1)

        # create graph 'image per seconds depends on number of images without waiting'
        chart2 = self.create_chart("O", 'Number of Images Loaded', "Q", "Images Per Second (No wait)", last_line)
        statistics_worksheet.insert_chart('I1', chart2)

        # create graph 'loaded size depends on the total time'
        chart3 = self.create_chart("M", 'Loaded Size [kb]', "I", "Total Time [milliseconds]", last_line)
        statistics_worksheet.insert_chart('Q1', chart3)

        # create graph 'loading rate depends on loaded size'
        chart4 = self.create_chart("M", 'Loaded size [kb]', "R", "loading rate [MB/sec]", last_line)
        statistics_worksheet.insert_chart('A16', chart4)

        # create graph 'loading rate depends on loaded size without waiting'
        chart5 = self.create_chart("M", 'Loaded size [kb]', "S", "loading rate [MB/sec] (No wait)", last_line)
        statistics_worksheet.insert_chart('I16', chart5)

        self.workbook.close()


class QidoExcelOutput(ExcelOutput):
    decoration_by_cell_value = {"Succeeded": {'bg_color': '#00FF00'},
                                "studies": {'font_color': 'navy'},
                                "series": {'font_color': 'blue'},
                                "instances": {'font_color': '#0099ff'},
                                "patients": {'font_color': 'purple'},
                                "json": {'bg_color': 'cyan'},
                                "xml": {'bg_color': '#0080FF'}}
    column_width_by_header_type = {"Study Instance UID": 50, "Series Instance UID": 50, "Sop Instance UID": 50,
                                   "End Point": 50, "URL": 180}
    decoration_by_header_type = {}

    def __init__(self, headers, path):
        super().__init__(headers, path)

    def write_statistics(self, last_line, tests_results):
        start_line_statistics = last_line + 3
        last_line = str(last_line)
        self.summarize_results(tests_results, start_line_statistics)
        stats_to_write = [("Average Scenario Time: ", "AVERAGE", f"H2:H{last_line}"),
                          ("Average Bytes Loaded: ", "AVERAGE", f"I2:I{last_line}"),
                          ("Average Bytes Loaded - JSON: ", "AVERAGEIF", f"K2:K{last_line},\"json\", I2:I{last_line}"),
                          ("Average Bytes Loaded - XML: ", "AVERAGEIF", f"K2:K{last_line},\"xml\", I2:I{last_line}"),
                          ("Average Rate: ", "AVERAGE", f"J2:J{last_line}")]
        for i, stat in enumerate(stats_to_write):
            self.calc_statistic_line(stat[0], stat[1], stat[2], start_line_statistics + i)
        # Implement graphs here
        self.workbook.close()


class CsvOutput(OutputWriter):
    def __init__(self, headers, path):
        self.m_path = path + self.path
        self.output_headers = headers
        self.first_row = True

    @property
    def path(self):
        return f"\\results-{datetime.datetime.now().strftime('%m%d_%H%M%S')}.csv"

    def write_scenario(self, scenario):
        if self.first_row:
            self.write_headers()
            self.first_row = False
        with open(self.m_path, 'a', newline='') as csv_results:
            writer = csv.writer(csv_results)
            line = []
            if not scenario.test_passed:
                line = [scenario.test_number, scenario.scenario, scenario.test_result, scenario.status_code,
                        "Local" if scenario.is_localhost else "Remote", "Could not fetch more data ", scenario.url]
            else:
                for column in self.output_headers.keys():
                    line.append(scenario.row_output[column])
            writer.writerow(line)
            LogManager.debug(210, f"Wrote to csv line {scenario.index}: {line}")

    def write_headers(self):
        with open(self.m_path, 'a', newline='') as csv_output:
            writer = csv.writer(csv_output)
            writer.writerow(self.output_headers.keys())

    @staticmethod
    def summarize_results(tests_results, start_line_statistics):
        print("\n\n===========================================\n\t\t\t\tRESULTS\n===========================================")
        stats_row = start_line_statistics + 1  # one row ahead for the headers
        for test, results in tests_results.items():
            print("Test {}:\n\tSucceeded scenarios: {}\n\tFailed scenarios: {}".format(test, results[1], results[2]))
            LogManager.info(210, "Test {}: Succeeded scenarios: {}, Failed scenarios: {}".format(test, results[1], results[2]))
            stats_row += 1

    def write_statistics(self, last_line, tests_results):
        start_line_statistics = last_line + 3
        self.summarize_results(tests_results, start_line_statistics)


class CmdOutput(OutputWriter):
    def __init__(self, headers):
        self.output_headers = headers
        self.first_row = True

    def write_scenario(self, scenario):
        if self.first_row:
            self.write_headers()
            self.first_row = False
        line = ["Scenario results:\t"]
        if not scenario.test_passed:
            line.append(str(scenario.test_number) + "\t|\t" + str(scenario.scenario) + "\t|\t" + "Scenario Failed due to: " + scenario.test_result + " - " + str(scenario.status_code) + "\t|\t")
            line.append(f"url: {scenario.url}" if scenario.url != "" else "")
            line.append(" Rest of the line remains empty")
        else:
            for column in self.output_headers.keys():
                line.append(str(scenario.row_output[column]) + "\t|\t")
        print(*line, file=sys.stdout)
        LogManager.debug(210, f"Wrote to stdout: {line}")

    def write_headers(self):
        print("\t|\t".join(list(self.output_headers.keys())), file=sys.stdout)

    @staticmethod
    def summarize_results(tests_results, start_line_statistics):
        print("\n\n===========================================\n\t\t\t\tRESULTS\n===========================================")
        stats_row = start_line_statistics + 1  # one row ahead for the headers
        for test, results in tests_results.items():
            print("Test {}:\n\tSucceeded scenarios: {}\n\tFailed scenarios: {}".format(test, results[1], results[2]))
            LogManager.info(210, "Test {}: Succeeded scenarios: {}, Failed scenarios: {}".format(test, results[1], results[2]))
            stats_row += 1

    def write_statistics(self, last_line, tests_results):
        start_line_statistics = last_line + 3
        self.summarize_results(tests_results, start_line_statistics)



