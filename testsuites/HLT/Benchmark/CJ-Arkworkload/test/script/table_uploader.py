#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import argparse
import pandas as pd
import push_to_cptl


def parse_command_line_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument('--table-file-path', dest='table_file_path', type=str)
    parser.add_argument('--table-path', dest='table_path', type=str)
    parser.add_argument('--summary', dest='summary', type=str)
    parser.add_argument('--version-json-file-path', dest='version_json_file_path', type=str)
    parser.add_argument('--timestamp', dest='timestamp', type=str)
    return parser.parse_args()


if __name__ == '__main__':
    arguments = parse_command_line_arguments()
    table = pd.read_csv(arguments.table_file_path)
    table = table.fillna('')
    print(table)
    level_str = arguments.table_path
    records = list()
    for index, row in table.iterrows():
        record = dict()
        record['level_str'] = level_str
        record['funcName'] = row['Unnamed: 0']
        result = dict()
        headers = list()
        for name, value in row.items():
            if name == 'Unnamed: 0':
                continue
            headers.append(str(name))
            pair = {'value': value, 'baseline': 0}
            result[name] = pair
        print(headers)
        record['result'] = result
        record['timestamp'] = arguments.timestamp
        record['description'] = ''
        record['summary'] = arguments.summary
        record['message'] = ','.join(headers)
        records.append(record)

    push_to_cptl.post_one_url_new(records, arguments.version_json_file_path)

