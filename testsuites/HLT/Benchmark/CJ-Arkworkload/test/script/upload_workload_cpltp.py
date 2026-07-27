#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.
import sys
import os
import csv
import datetime
import platform
import subprocess
import time
import requests
import json

cj_csv = './CJ-Arkworkload/test/cjCompileRes/CjResult.csv'
swift_csv = './CJ-Arkworkload/test/swiftCompileRes/SwiftResult.csv'
arkts_csv = './CJ-Arkworkload/test/arkTsCompileRes/ArkTsResult.csv'
baseline_lang = 'Swift'

def collect_language_info():
    # Collect Cangjie & Swift language version info
    commit_id_list = []
    commit_id_list.append("-------------------------------------------------------------")
    commit_id_list.append("Cangjie对比项为Swift,同时监控ArkTs性能")
    commit_id_list.append("-------------------------------------------------------------")
    # Cangjie Version Info
    out_bytes_cj = subprocess.check_output(['cjc', '-v'])
    commit_id_cj = out_bytes_cj.decode('utf-8').strip().split('\n')
    commit_id_list.append('Cangjie Version: ' + '\n'.join([commit_id_cj[0]]))
    # Swift Version Info
    out_bytes_swift = subprocess.check_output(['swift', '-v'], stderr=subprocess.STDOUT)
    commit_id_swift = out_bytes_swift.decode('utf-8').strip().split('\n')
    commit_id_list.append('Swift Version: ' + '\n'.join([commit_id_swift[0]]))
    # ArkTs Version Info
    commit_id_list.append('ArkTS Version: FROM GITEE ' + str(timestamp))
    return commit_id_list

def parser_csv(result_csv):
    """
    parser_csv: read result_csv and get resultline
    """
    resultline = {}
    with open(result_csv) as f:
        renders = csv.reader(f)
        for render in renders:
            resultline.setdefault(render[0], round(sum(map(float,render[1:]))/len(render[1:]), 4))
    return resultline

def parser_result_csv(result_csv):
    raw = []
    # Open result csv file
    with open(result_csv) as f:
        renders = csv.reader(f)
        for render in renders:
            results = {}
            case_name = render[0]
            results.setdefault('Cangjie', {'value': round(sum(map(float,render[1:]))/len(render[1:]), 4), 'baseline': swiftRes[case_name]})
            results.setdefault('Swift', {'value': swiftRes[case_name], 'baseline': swiftRes[case_name]})
            results.setdefault('ArkTs', {'value': arktsRes[case_name], 'baseline': swiftRes[case_name]})
            cur_level_str = level_str 
            tmp_summary = []
            
            cur_level_str = cur_level_str + "/" + "Execution_Time"
            tmp_summary.append("Execution_Time(ms): 运行耗时")
            
            tmp_summary += commit_id_list
            tmp_summary = '\n'.join(tmp_summary)
            temp = template_new(level_str=cur_level_str, funcName=case_name, result=results,
                                timestamp=timestamp, summary=tmp_summary)
            print(temp)
            temp.setdefault('message', 'Cangjie,Swift,ArkTs')
            raw.append(temp)
        # post to cpltp
        post_one_url_new(raw, version_json)

def post_one_url_new(raw, version_json=None):
    # remember to adjust cmc_version, or script will read from cangjie package
    cmc_version = "Cangjie 1.1.0.B010-20231031020103"
    if version_json is not None and os.path.exists(version_json):
        with open(version_json, encoding='utf-8') as fp:
            version_data = json.load(fp)
        cmc_version = version_data.get("bundle")[0].get("version") + "-" + version_data.get("bundle")[0].get("serial")
    header = {'Content-Type': 'application/json',
              'Authorization': token()}
    data = json.dumps(raw)
    data = bytes(data, 'utf-8')
    # print(data)
    r = requests.post(
        url='{}'.format(
            cmc_version),
        headers=header,
        data=data)
    print(r.content.decode('utf-8'))
    if json.loads(r.content.decode('utf-8')).get("code") == '406':
        updata_version()
        time.sleep(300)
        post_one_url_new(raw, version_json)

def token():
    header = {'Content-Type': 'application/json'}
    r = requests.get(
        url='',
        headers=header)
    return json.loads(r.content.decode('utf-8'))['data']

def template_new(level_str, funcName, result, timestamp, summary=""):
    t = {"level_str": level_str, "funcName": funcName,
         "result": result, "timestamp": timestamp,
         "description": "", "summary": summary}
    return t

def updata_version():
    header = {'Content-Type': 'application/json',
              'Authorization': token()}
    r = requests.post(
        url="",
        headers=header
    )
    print(r.content.decode('utf-8'))

if __name__ == '__main__':
    timestamp = int(datetime.datetime.now().strftime('%Y%m%d%H%M'))
    arch = platform.machine()
    arch = 'x86' if arch == 'x86_64' else 'UNKNOWN'
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', 'CJ-ArkWorkload'])
    version_json = sys.argv[1] if len(sys.argv) == 2 else None

    # collect_language_info
    commit_id_list = collect_language_info()

    # Call parser_csv
    swiftRes = parser_csv(swift_csv)
    arktsRes = parser_csv(arkts_csv)
    parser_result_csv(cj_csv)