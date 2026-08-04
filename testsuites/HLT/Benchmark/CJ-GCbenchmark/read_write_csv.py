# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import csv


def parser_csv_file(csv_file):
    data_list = list()
    with open(csv_file) as f:
        reader = csv.reader(f)
        header = next(reader)
        for row in reader:
            case_name = row[0]
            language = row[1]
            result = row[15]
            if result == "SUCCESS" or result == "FAILED" or result == "TIMEOUT":
                case_name_lang = case_name + "." + language
                cpu = list(map(float, row[2][1:-1].split(",")))
                rss = list(map(float, row[3][1:-1].split(",")))
                vms = list(map(float, row[4][1:-1].split(",")))
                shared = list(map(float, row[5][1:-1].split(",")))
                text = list(map(float, row[6][1:-1].split(",")))
                lib = list(map(float, row[7][1:-1].split(",")))
                data = list(map(float, row[8][1:-1].split(",")))
                dirty = list(map(float, row[9][1:-1].split(",")))
                uss = list(map(float, row[10][1:-1].split(",")))
                pss = list(map(float, row[11][1:-1].split(",")))
                swap = list(map(float, row[12][1:-1].split(",")))
                time = list(map(float, row[13][1:-1].split(",")))
                cost_time = float(row[14])
                cpu_load = float(row[16])
                rss_max = float(row[17])
                rss_integral = round(float(row[18]), 1)
                data_list_insert = {"name": case_name_lang, "cpu": cpu, "rss": rss, "vms": vms, "shared": shared,
                                    "text": text, "lib": lib, "data": data, "dirty": dirty, "uss": uss, "pss": pss,
                                    "swap": swap, "time": time, "result": result, "cost_time": cost_time,
                                    "cpu_load": cpu_load, "rss_max": rss_max, "rss_integral": rss_integral}
                data_list.append(data_list_insert)
    return data_list


def parser_OO_csv_file(csv_file):
    data_list_avalanche = list()
    data_list_others = list()
    name_map = {'units / msec': data_list_avalanche, 'time(s)': data_list_others}
    category = ''
    with open(csv_file) as f:
        reader = csv.reader(f)
        for row in reader:
            if row[0] == 'name':
                category = row[2]
                continue
            data_list_insert = {"name": row[0], "lang": row[1], 'value': 0 if row[2] == '' else round(float(row[2]), 2)}
            name_map.get(category).append(data_list_insert)
    return data_list_avalanche, data_list_others


def write_csv_file(csv_file, header_list, data_list):
    """
    csv_file：结果保存文件的路径
    header_list：保存的关键字，以列表形式传参，如["name", "language", "cpu", "time"]
    data_list：要保存的数据，以列表形式传参
    """
    with open(csv_file, mode="w", encoding="utf-8-sig", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(header_list)
        writer.writerows(data_list)
