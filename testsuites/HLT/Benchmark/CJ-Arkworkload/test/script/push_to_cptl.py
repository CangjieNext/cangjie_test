#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.
import csv
import json
import datetime
import os
import time

import requests
import argparse

csv_results = dict()
mem_results = dict()

cj_compile_name = 'cj_compile'
swift_compile_name = 'swift_compile'

case_suite_info = {
    'benchmarksgame': ['regexredux', 'revcomp', 'knucleotide', 'mandelbrot', 'fannkuchredux', 'fasta', 'nbody',
                       'spectralnorm', 'binarytrees', 'pidigits'],
    'others': ['gameoflive', 'whileloop', 'SplitOnLargeString', 'ReplaceOnLargeString', 'SubstringOnLargeString',
               'ContainsOnLargeString', 'SearchFromLeftOnLargeString', 'SearchFromRightOnLargeString',
               'SplitOnSmallString', 'ReplaceOnSmallString', 'SubstringOnSmallString', 'ContainsOnSmallString',
               'SearchFromLeftOnSmallString', 'SearchFromRightOnSmallString',
               'client_server', 'cookie_tostring', 'header_write', 'binarytrees_single', 'mandelbrot_single',
               'mandelbrot_for', 'regexredux_single', 'spectralnorm_single',
               'hashmap_add', 'hashmap_del', 'hashmap_mod', 'hashmap_search', 'hashmap_traverse',
               'buffer_add', 'stringbuilder_add'],
}


def parser_all_measurements_csv(filename="all_measurements.csv"):
    global csv_results, mem_results
    with open(filename) as f:
        render = csv.reader(f)
        for row in render:
            case_name = row[0]
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

            def set_result(n, e, m):
                if n not in csv_results:
                    csv_results[n] = float(e)
                else:
                    csv_results[n] += float(e)

                if n not in mem_results:
                    mem_results[n] = float(m)
                else:
                    mem_results[n] += float(m)

            name = case_name + '.' + language
            if name == 'name.lang':
                continue
            if compile_test:
                if language == cj_compile_name or language == swift_compile_name:  # only get compile result.
                    set_result(name, elapsed, mem)
            else:
                if language != cj_compile_name and language != swift_compile_name:  # not get compile result.
                    set_result(name, elapsed, mem)

    for i in csv_results.keys():
        csv_results[i] = int(float(csv_results[i]) / 3 * 1000) / 1000  # default run 3 times.
        mem_results[i] = int(float(mem_results[i]) / 3 * 1000) / 1000


def token():
    header = {'Content-Type': 'application/json'}
    r = requests.get(
        url='',
        headers=header)
    return json.loads(r.content.decode('utf-8'))['data']


def template(taskName, funcName, result, category, timestamp, backend, summary=""):
    t = {"envTypeName": backend, "taskName": taskName,
         "category": category, "funcName": funcName,
         "result": result, "timestamp": timestamp,
         "description": "", "summary": summary}
    return t


def template_new(level_str, funcName, result, timestamp, summary=""):
    t = {"level_str": level_str, "funcName": funcName,
         "result": result, "timestamp": timestamp,
         "description": "", "summary": summary}
    return t


def parse_result_new(raw_result):
    raw = []
    result = {}
    case_count = {}
    summary = ""
    if task == 'benchmarksgame' and category == 'time' and backend == 'llvmgc' and not compile_test:
        summary = post_summary()
    for i in raw_result.keys():
        case, lang = i.split('.')
        if not (compile_test or case in case_suite_info[task]):
            continue
        if case not in case_count:
            case_count.setdefault(case, 1)
        else:
            case_count[case] += 1
        result[lang] = {'value': raw_result[i]}

        if case_count[case] == lang_number:
            for j in result:
                result[j].setdefault('baseline', result[baseline_lang]['value'])
            temp = template_new(level_str, case, result, timestamp, summary)
            if task == 'benchmarksgame' and backend != 'jet':
                if compile_test:
                    temp['message'] = 'cj_compile,swift_compile'
                else:
                    temp['message'] = 'cj,go,swift'
            raw.append(temp)
            result = {}
    return raw


def post_one_url(raw, version_json=None):
    cmc_version = "CangjieLangV100R001C00B001"
    if version_json is not None and os.path.exists(version_json):
        with open(version_json, encoding='utf-8') as fp:
            version_data = json.load(fp)
        cmc_version = version_data.get("bundle")[0].get("version") + "-" + version_data.get("bundle")[0].get("serial")
    header = {'Content-Type': 'application/json',
              'Authorization': token()}
    data = json.dumps(raw)
    data = bytes(data, 'utf-8')
    print(data)
    r = requests.post(
        url='api/tasklog/testcase/api/v1/task/performance/result/{}/testcases'.format(cmc_version),
        headers=header,
        data=data)
    print(r.content.decode('utf-8'))
    if json.loads(r.content.decode('utf-8')).get("code") == '406':
        updata_version()
        time.sleep(300)
        post_one_url(raw, version_json)


def post_one_url_new(raw, version_json=None):
    cmc_version = "CangjieLangV100R001C00B001"
    if version_json is not None and os.path.exists(version_json):
        with open(version_json, encoding='utf-8') as fp:
            version_data = json.load(fp)
        cmc_version = version_data.get("bundle")[0].get("version") + "-" + version_data.get("bundle")[0].get("serial")
    header = {'Content-Type': 'application/json',
              'Authorization': token()}
    data = json.dumps(raw)
    data = bytes(data, 'utf-8')
    print("--------")
    print(data)
    print("--------")
    r = requests.post(
        url='api/tasklog/testcase/api/v1/task/performance/result/daily/{}/testcases'.format(
            cmc_version),
        headers=header,
        data=data)
    print(r.content.decode('utf-8'))
    if json.loads(r.content.decode('utf-8')).get("code") == '406':
        updata_version()
        time.sleep(300)
        post_one_url_new(raw, version_json)


def updata_version():
    header = {'Content-Type': 'application/json',
              'Authorization': token()}
    r = requests.post(
        url="",
        headers=header
    )
    print(r.content.decode('utf-8'))


def post_summary():
    total = 0
    summary = {}
    for x in csv_results.keys():
        suffix = x[str(x).rfind('.') + 1:]
        case_name = x[:str(x).rfind('.')]
        if case_name in case_suite_info['benchmarksgame']:
            if suffix == baseline_lang or suffix == 'cj':
                print(x, csv_results[x], suffix)
                if case_name not in summary:
                    summary[case_name] = {suffix: csv_results[x]}
                else:
                    summary[case_name].update({suffix: csv_results[x]})
            # if str(x).endswith('cj'):
    print(json.dumps(summary, indent=4))
    better = 0
    close = 0
    tolerance = 0.02
    mean_cj = 1
    mean_base = 1
    for x in summary:
        if len(summary[x]) == 2:
            total += 1
            gap_date = abs(
                (float(summary[x][baseline_lang]) - float(summary[x]['cj'])) / float(summary[x][baseline_lang]))
            if gap_date <= tolerance:
                close += 1
            elif gap_date > tolerance and float(summary[x]['cj']) < float(summary[x][baseline_lang]):
                better += 1
            mean_cj *= (1 / float(summary[x]['cj']))
            mean_base *= (1 / float(summary[x][baseline_lang]))
    mean_cj = pow(mean_cj, 1 / total)
    mean_base = pow(mean_base, 1 / total)
    summary = """Benchmarks Game 测试套执行了{}个用例，其中[cj]相比[{}]，有{}个用例较优，有{}个用例持平，有{}个用例较差。
性能几何平均值比为{}(越大越好)。
Benchmarks Game have {} cases, compare to [{}], [cj] has {} better cases, {} close cases, {} worse case.
Rate of performance geometric mean is {}(bigger is better).""".format(total, baseline_lang, better, close,
                                                                      total - better - close, mean_cj / mean_base,
                                                                      total, baseline_lang, better, close,
                                                                      total - better - close, mean_cj / mean_base)
    print(summary)

    return summary


level_str = ''

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--csv_file", default='all_measurements.csv', type=str, help="all_measurements.csv")
    parser.add_argument("--backend", type=str, help="llvmgc,jet")
    parser.add_argument("--arch", type=str, help="x86,arm")
    parser.add_argument("--compile", type=bool, default=False, help="True for collect compile data")
    parser.add_argument("--debug", type=bool, default=False, help="debug for send mail")
    parser.add_argument("--task", type=str, default='benchmarksgame', help="benchmarksgame,others")
    parser.add_argument("--res", type=str, help="time,mem")
    args = parser.parse_args()
    csv_file = args.csv_file
    backend = args.backend
    debug = args.debug
    arch = args.arch
    task = args.task
    compile_test = args.compile
    category = args.res
    second_name = 'CJCF-Bench'

    print(arch, backend, compile_test, task, category)

    baseline_lang = 'go'
    lang_number = 2  # default run cj, go.
    if task == 'benchmarksgame':
        lang_number = 3  # default run cj, go, swift.
    if compile_test:
        lang_number = 2
        baseline_lang = swift_compile_name

    if backend == 'jet' and csv_file == "pgo.csv":
        lang_number = 1  # only run cj.
        baseline_lang = 'cj'
    if backend == 'jet' and csv_file == "nopgo.csv":
        lang_number = 2  # only run cj go.
        baseline_lang = 'go'

    show_category = 'compile_' + category if compile_test else category
    if csv_file == "pgo.csv":
        show_category += "_pgo"
    level = [backend + '_' + arch, second_name, task, show_category]
    level_str = '/'.join(level)
    print(level_str)

    parser_all_measurements_csv(csv_file)
    timestamp = int(datetime.datetime.now().strftime('%Y%m%d%H%M'))

    if category == 'time':
        raw = parse_result_new(csv_results)
        if not debug:
            post_one_url_new(raw)
    if category == 'mem':
        raw = parse_result_new(mem_results)
        if not debug:
            post_one_url_new(raw)

