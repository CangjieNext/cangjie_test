#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import csv
import datetime
import os
import sys
import json
import requests
import subprocess
import decimal
import argparse
import push_to_cptl as p
import report_email as r
import pathlib

results = dict()
compile_results = dict()
repeat_time = 3
taskName = 'smoke'
category = 'time'
productName = 'CangjieLang'
cj_compile_name = 'cj_compile'


def get_last_result(productName, envTypeName, taskName, category):
    params = {'productName': productName,
              'envTypeName': envTypeName,
              'taskName': taskName,
              'category': category}
    r = requests.get(
        url='http://api/cpltp/api/tasklog/testcase/api/v1/task/performance/getPerformanceTaskLastResults/testcases',
        params=params
    )
    x = json.loads(r.content)
    data = x['data']
    return data


def get_last_result_new(productName, level_str):
    params = {'productName': productName,
              'level_str': level_str}
    r = requests.get(
        url='http://api/cpltp/api/tasklog/testcase/api/v1/task/performance/daily/getPerformanceTaskLastResults/testcases',
        params=params
    )
    x = json.loads(r.content)
    data = x['data']
    return data


def parser_cj_measurements_csv(filename="all_measurements.csv", taskName="smoke"):
    with open(filename) as f:
        render = csv.reader(f)
        for row in render:
            case_name = row[0]
            if case_name == 'name':
                continue
            language = row[1]
            version = row[2]
            args = row[3]
            size = row[4]
            cpu = row[5]
            mem = row[6]
            status = row[7]
            cpu_load = row[8]
            elapsed = row[9]
            print(*row)
            if taskName == "compile_smoke":
                if language == cj_compile_name:
                    if case_name not in compile_results.keys():
                        compile_results[case_name] = float(elapsed)
                    else:
                        compile_results[case_name] += float(elapsed)
            else:
                if language != cj_compile_name:
                    if case_name not in results.keys():
                        results[case_name] = float(elapsed)
                    else:
                        results[case_name] += float(elapsed)
    level_str = '/'.join([backend + '_smoke_' + arch, 'CJCF-Bench', 'benchmarksgame', 'time'])
    if taskName != "compile_smoke":
        for x in results:
            results[x] = round(results[x] / repeat_time, 5)
        data = get_last_result_new(productName=productName, level_str=level_str)
        if data:
            last_commit = data[0]['summary']
            raw = []
            total_result = {}
            for case_name in results:
                result = {'cj/s': {'value': results[case_name], 'baseline': 0}}
                raw.append(p.template_new(
                    level_str=level_str, funcName=case_name, result=result, timestamp=timestamp, summary=commit_id))
                for last_one in data:
                    if last_one['number'] == case_name:
                        cur_case = case_name
                        last_result = last_one['result']['cj/s']['value']
                        cur_result = results[case_name]
                        total_result[cur_case] = [str(decimal.Decimal(cur_result).quantize(decimal.Decimal("0.001"))),
                                                  str(decimal.Decimal(last_result).quantize(decimal.Decimal("0.001"))),
                                                  str(decimal.Decimal((1 - cur_result / last_result) * 100).quantize(
                                                      decimal.Decimal("0.001"))) + '%']
            if not debug:
                p.post_one_url_new(raw)
            r.report_benchmarks_game(total_result, commit_id, last_commit, email_backend, debug, user, password)

        else:  # push for first data.
            raw = []
            for case_name in results:
                result = {'cj/s': {'value': results[case_name], 'baseline': 0}}
                raw.append(p.template_new(
                    level_str=level_str, funcName=case_name, result=result, timestamp=timestamp, summary=commit_id))
            if not debug:
                p.post_one_url_new(raw)
    else:
        for x in compile_results:
            compile_results[x] = round(compile_results[x] / repeat_time, 5)


def parser_cj_measurements_csv_new():
    workspace = pathlib.Path(os.path.dirname(__file__)).absolute()
    sys.path.append(str(pathlib.Path.joinpath(workspace.parent, "Framework", "scripts")))
    import read_write_csv as rwc
    data_list = rwc.parser_csv_file(pathlib.Path.joinpath(workspace.parent, "Framework", "tmp", csv_file))
    for data in enumerate(data_list):
        if (data[0] + 1 < len(data_list) and data[1].get("name") != data_list[data[0] + 1].get("name")) or data[
            0] == len(data_list) - 1:
            if data[1].get("result") == "SUCCESS":
                if taskName == "compile_smoke":
                    if data[1].get("name").split(".")[0] not in compile_results:
                        compile_results.setdefault(data[1].get("name").split(".")[0], max(data[1].get("time")) / 1e9)
                else:
                    if data[1].get("name").split(".")[0] not in results:
                        results.setdefault(data[1].get("name").split(".")[0], max(data[1].get("time")) / 1e9)
            else:
                if taskName == "compile_smoke":
                    if data[1].get("name").split(".")[0] not in compile_results:
                        compile_results.setdefault(data[1].get("name").split(".")[0], 0)
                else:
                    if data[1].get("name").split(".")[0] not in results:
                        results.setdefault(data[1].get("name").split(".")[0], 0)
    level_str = '/'.join([backend + '_smoke_' + arch, 'CJCF-Bench', 'benchmarksgame', 'time'])
    if taskName == "smoke":
        data = get_last_result_new(productName=productName, level_str=level_str)
        if data:
            last_commit = data[0]['summary']
            raw = []
            total_result = {}
            for case_name in results:
                result = {'cj/s': {'value': results[case_name], 'baseline': 0}}
                raw.append(p.template_new(
                    level_str=level_str, funcName=case_name, result=result, timestamp=timestamp, summary=commit_id))
                for last_one in data:
                    if last_one['number'] == case_name:
                        cur_case = case_name
                        last_result = last_one['result']['cj/s']['value']
                        cur_result = results[case_name]
                        total_result[cur_case] = [str(decimal.Decimal(cur_result).quantize(decimal.Decimal("0.001"))),
                                                  str(decimal.Decimal(last_result).quantize(decimal.Decimal("0.001"))),
                                                  str(decimal.Decimal((1 - cur_result / last_result) * 100).quantize(
                                                      decimal.Decimal("0.001"))) + '%']
            if not debug:
                p.post_one_url_new(raw)
            r.report_benchmarks_game(total_result, commit_id, last_commit, email_backend, debug, user, password)

        else:  # push for first data.
            raw = []
            for case_name in results:
                result = {'cj/s': {'value': results[case_name], 'baseline': 0}}
                raw.append(p.template_new(
                    level_str=level_str, funcName=case_name, result=result, timestamp=timestamp, summary=commit_id))
            if not debug:
                p.post_one_url_new(raw)


def get_codesize_so(x: str):
    cmd = "size " + x + " | awk 'END{print $4}'"
    print(cmd)
    res = os.popen(cmd).read()
    print(res)
    return res


so_list = ['libcangjie-runtime.so', 'libcangjie-std-core.so']


def check_codesize():
    out_bytes = subprocess.check_output(['which', 'cjc'])
    cjc_path = out_bytes.decode('utf-8')
    path = pathlib.Path(cjc_path)
    raw = []
    total_result = {}
    level_str = '/'.join([backend + '_smoke_' + arch, 'codesize'])
    data = get_last_result_new(productName=productName, level_str=level_str)
    if data:
        last_commit = data[0]['summary']
        for so in so_list:
            a = get_codesize_so(
                str(path.parent.parent.joinpath('runtime').joinpath('lib').joinpath(lib_dir).joinpath(so)))
            cur_result = int(a) / 1024
            result = {'KB': {'value': cur_result, 'baseline': 0}}
            raw.append(p.template_new(
                level_str=level_str, funcName=so, result=result, timestamp=timestamp, summary=commit_id))
            for last_one in data:
                if last_one['number'] == so:
                    last_result = last_one['result']['KB']['value']
                    print(cur_result, last_result, cur_result - last_result)
                    total_result[so] = [str(decimal.Decimal(cur_result).quantize(decimal.Decimal("0.001"))),
                                        str(decimal.Decimal(last_result).quantize(decimal.Decimal("0.001"))),
                                        str(decimal.Decimal(cur_result - last_result).quantize(
                                            decimal.Decimal("0.001")))]
        r.report_code_size(total_result, commit_id, last_commit, email_backend, debug, user, password)
        if not debug:
            p.post_one_url_new(raw)
    else:  # first push.
        for so in so_list:
            a = get_codesize_so(
                str(path.parent.parent.joinpath('runtime').joinpath('lib').joinpath(lib_dir).joinpath(so)))
            cur_result = int(a) / 1024
            result = {'KB': {'value': cur_result, 'baseline': 0}}
            raw.append(p.template_new(
                level_str=level_str, funcName=so, result=result, timestamp=timestamp, summary=commit_id))
        if not debug:
            p.post_one_url_new(raw)


def compile_smoke():
    tolerance = float(-5.0)
    send = False
    if csv_file == "all_measurements.csv":
        parser_cj_measurements_csv(filename=csv_file, taskName="compile_smoke")
    else:
        parser_cj_measurements_csv_new()
    level_str = '/'.join([backend + '_smoke_' + arch, 'CJCF-Bench', 'benchmarksgame', 'compile_time'])
    data = get_last_result_new(productName=productName, level_str=level_str)
    # data = get_last_result(productName=productName, envTypeName=backend, taskName='compile_smoke', category=category)
    raw = []
    total_result = {}
    if data:
        last_commit = data[0]['summary']
        for case_name in compile_results.keys():
            result = {'cj/s': {'value': compile_results[case_name], 'baseline': 0}}
            raw.append(p.template_new(
                level_str=level_str, funcName=case_name, result=result, timestamp=timestamp, summary=commit_id))
            # raw.append(p.template(taskName="compile_smoke", funcName=case_name, result=result, category=category,
            #                       timestamp=timestamp, backend=backend, summary=commit_id))
            for last_one in data:
                if last_one['number'] == case_name:
                    cur_case = case_name
                    last_result = last_one['result']['cj/s']['value']
                    cur_result = compile_results[case_name]
                    cur_rate = float(decimal.Decimal((1 - cur_result / last_result) * 100).quantize(
                        decimal.Decimal("0.001")))
                    total_result[cur_case] = [str(decimal.Decimal(cur_result).quantize(decimal.Decimal("0.001"))),
                                              str(decimal.Decimal(last_result).quantize(decimal.Decimal("0.001"))),
                                              str(cur_rate) + '%']
                    if cur_rate < tolerance or cur_rate > -tolerance:
                        send = True
        if send or debug:
            r.report_compile_smoke(total_result, commit_id, last_commit, email_backend, debug, user, password, tolerance)
        if not debug:
            p.post_one_url_new(raw)
    else:  # first push.
        for case_name in compile_results.keys():
            result = {'cj/s': {'value': compile_results[case_name], 'baseline': 0}}
            raw.append(p.template_new(
                level_str=level_str, funcName=case_name, result=result, timestamp=timestamp, summary=commit_id))
            # raw.append(p.template(taskName="compile_smoke", funcName=case_name, result=result, category=category,
            #                       timestamp=timestamp, backend=backend, summary=commit_id))
        if not debug:
            p.post_one_url_new(raw)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--csv_file", default='all_measurements.csv', type=str, help="all_measurements.csv")
    parser.add_argument("--backend", type=str, help="llvmgc,jet")
    parser.add_argument("--arch", type=str, help="x86,aarch64")
    parser.add_argument("--debug", action='store_true', help="debug for send mail")
    parser.add_argument("--user", type=str, help="user for send mail")
    parser.add_argument("--password", type=str, help="password for send mail")
    args = parser.parse_args()
    csv_file = args.csv_file
    backend = args.backend
    debug = args.debug
    arch = args.arch
    email_backend = backend + '_' + arch
    if arch == 'aarch64':
        lib_dir = 'linux_aarch64_llvm'
    elif arch == 'x86':
        lib_dir = 'linux_x86_64_llvm'
    user = args.user
    password = args.password
    print(debug, backend, csv_file)

    timestamp = int(datetime.datetime.now().strftime('%Y%m%d%H%M'))
    out_bytes = subprocess.check_output(['cjc', '-v'])
    commit_id = out_bytes.decode('utf-8')
    print(commit_id)
    if csv_file == "all_measurements.csv":
        parser_cj_measurements_csv(csv_file)
        if backend == 'llvmgc':
            check_codesize()
            compile_smoke()
    else:
        if "compile" in csv_file:
            taskName = "compile_smoke"
        if taskName == "smoke":
            parser_cj_measurements_csv_new()
        else:
            if backend == "llvmgc":
                check_codesize()
                compile_smoke()
