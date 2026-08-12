#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import json
import math
import requests
import argparse
import os.path
from push_to_cptl import token
import pandas as pd

cur_path = os.path.dirname(os.path.abspath(__file__))

# run `nohup http-server  
home_dir = ''
http_date_dir = ''
productName = 'Cangjie'

# 保存的数据
execution_time_cjnative_x86 = []
execution_time_cjnative_arm = []
execution_time_cjvm_x86 = []
execution_time_cjvm_arm = []

memory_peak_cjnative_x86 = []
memory_peak_cjnative_arm = []
memory_peak_cjvm_x86 = []
memory_peak_cjvm_arm = []

memory_cjnative_x86 = []
memory_cjnative_arm = []
memory_cjvm_x86 = []
memory_cjvm_arm = []

cpu_cjnative_x86 = []
cpu_cjnative_arm = []
cpu_cjvm_x86 = []
cpu_cjvm_arm = []

# 劣化阈值，当劣化超过该阈值时，邮件中会画出劣化用例的折线图
threshold = 0.15

benchmarks_game_name = 'Benchmark_Game'
oo_benchmark_name = 'Object_Orient_Benchmark'
concurrency_benchmark_name = 'Concurrency_Benchmark'
micro_benchmark_name = 'Micro-Bench(原子级)'
taibai_name = 'TAIBAI'

benchmark_suite_dict = {
    benchmarks_game_name: {'llvmgc_cj', 'cjvm_cj', 'go', 'java'},
    oo_benchmark_name: {'llvmgc_cj', 'cjvm_cj', 'go', 'java'},
    concurrency_benchmark_name: {'llvmgc_cj', 'cjvm_cj', 'go', 'loom'}, 
    micro_benchmark_name: {'llvmgc_cj', 'cjvm_cj', 'go', 'java'},
    taibai_name: {'elfSize(MB)', 'time(s)', 'Compile efficiency(s/kloc)', 'memory_max(MB)'}
}

micro_benchmark_info = [
'array',
'collections_arraylist',
'collections_cmap',
'collections_hashmap',
'collections_hashset',
'client_http',
'client_http2',
'client_https',
'server_http',
'server_http2',
'server_https',
'http',
'http2',
'https',
'json',
'oldjson',
'serialize',
'filestream',
'io',
'expression',
'loop',
'libast_api',
'libast_scene',
'atomic',
'cffi',
'concurrency',
'convert',
'createobject',
'gzip',
'lambda',
'log',
'objectpool',
'regex',
'string',
'stringbuilder',
'override',
'url'
]


color_dict = {
    'llvmgc_cj': 'red',
    'cjvm_cj': 'green',
    'go': 'blue',
    'swift': 'yellow',
    'java': 'black',
    'loom': 'black'
}

image_dir = {}
image_num = 0

def calculate_rate(a, b):
    c = []
    for i in range(len(a)):
        if b[i] == 0:
            c.append(0)
        else:
            c.append(round(a[i] / b[i], 5))
    return c



def get_one_timestamp_result(timestamp, level_str):
    header = {'Content-Type': 'application/json',
              'Authorization': token()}
    body = {'productName': productName,
            'levelStr': level_str,
            'timestamp': [timestamp]}
    r = requests.post(
        url='',
        headers=header,
        data=json.dumps(body)
    )
    x = json.loads(r.content)
    return x


def get_all_timestamp(productName, level_str):
    header = {'Content-Type': 'application/json',
              'Authorization': token()}
    params = {'productName': productName,
              'level_str': level_str,
              'page': 100,
              'pageSize': 100, }

    time_result = requests.get(
        url='',
        headers=header,
        params=params
    )
    x = json.loads(time_result.content)
    timestamps = x['data']['list']
    return timestamps


def update_timestamp(x):
    return str(x)[:8]



def geometric_mean(numbers):
    numbers_without_zeros = [num for num in numbers if num > 0]
    if len(numbers_without_zeros) == 0:
        return 0
    log_sum = sum(math.log(num) for num in numbers_without_zeros)
    return round(math.exp(log_sum / len(numbers_without_zeros)), 5)


# cur_data should be get from get_one_timestamp_result(timestamp,level_str)
def store_one_result_to_dict(cur_dict, cur_data, test_suite_name=benchmarks_game_name):
    for j in cur_data['data']['data']:
        cur_funcname = j['funcName']
        for one_lang in j['result']:
            cur_data = j['result'][one_lang]['value']
            if one_lang in benchmark_suite_dict[test_suite_name]:
                if cur_funcname not in cur_dict.keys():
                    cur_dict[cur_funcname] = {}
                if one_lang not in cur_dict[cur_funcname].keys():
                    cur_dict[cur_funcname][one_lang] = cur_data
    return cur_dict


def get_cur_and_last_result(productName, level_str, test_suite_name=benchmarks_game_name):
    timestamps = get_all_timestamp(productName, level_str)  # len should >= 2
    if (len(timestamps) == 0):
        return None, None, (None, None)
    version_time = ''
    baseline_time = ''
    version_flag = 0
    baseline_flag = 0
    for i in range(len(timestamps)):
        if version in str(timestamps[i]['timeStamp']):
            version_time = timestamps[i]['timeStamp']
            version_flag = 1
            break
    for i in range(len(timestamps)):
        if baseline in str(timestamps[i]['timeStamp']):
            baseline_time = timestamps[i]['timeStamp']
            baseline_flag = 1
            break
    
    # 如果缺失version当天的数据，则往前找到有数据的那天(1107 -> 1106)
    if version_flag == 0:
        min_version = int(version)
        versionid = 0
        for i in range(len(timestamps)):
            temp_num = min_version - timestamps[i]['timeStamp'] / 10000
            if (temp_num > 0):
                min_version = (timestamps[i]['timeStamp'] / 10000)
                versionid = i
                break
        version_time = timestamps[versionid]['timeStamp']

    # 如果缺失baseline当天的数据，则往后找到有数据的那天(0929 -> 0930)
    if baseline_flag == 0:
        min_baseline = int(baseline)
        baselineid = 0
        for i in range(len(timestamps)):
            temp_num = timestamps[i]['timeStamp'] / 10000 - min_baseline
            if (temp_num > 0):
                baselineid = i
        baseline_time = timestamps[baselineid]['timeStamp']

    print("baseline_time: ", baseline_time)
    print("version_time: ", version_time)
    print("level_str: ", level_str)
    cur = get_one_timestamp_result(version_time, level_str)
    last = get_one_timestamp_result(baseline_time, level_str)
    cur_dict = {}
    cur_dict = store_one_result_to_dict(cur_dict, cur, test_suite_name=test_suite_name)

    last_dict = {}
    last_dict = store_one_result_to_dict(last_dict, last, test_suite_name=test_suite_name)
    return cur_dict, last_dict, (cur['data']['data'][0]['timeStamp'], last['data']['data'][0]['timeStamp'])


'''
----------------------------------------------------------------------------
-----------------------------  Benchmark_Game  -----------------------------
----------------------------------------------------------------------------
'''

def gather_benchmarks_result(arch='aarch64', case_name='Execution_Time'):
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', benchmarks_game_name, case_name])

    # geomean
    cur_result, last_result, (cur_ts, last_ts) = get_cur_and_last_result(productName, level_str, test_suite_name=benchmarks_game_name)
    benchmark_list = ["binarytrees", "fannkuchredux", "fasta", "knucleotide", "mandelbrot", "nbody", "regexredux", "revcomp","spectralnorm"]
    for caseName in benchmark_list:
        cur_llvm = cur_result["#" + caseName]["llvmgc_cj"]
        cur_cjvm = cur_result["#" + caseName]["cjvm_cj"]
        last_llvm = last_result["#" + caseName]["llvmgc_cj"]
        last_cjvm = last_result["#" + caseName]["cjvm_cj"]
        cur_go = cur_result["#" + caseName]["go"]
        cur_java = cur_result["#" + caseName]["java"]

        if arch == "aarch64":
            if case_name == "Execution_Time":
                execution_time_cjnative_arm.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, cur_llvm/cur_java])
                execution_time_cjvm_arm.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, cur_cjvm/cur_java])
            elif case_name == "Memory_Peak":
                memory_peak_cjnative_arm.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, cur_llvm/cur_java])
                memory_peak_cjvm_arm.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, cur_cjvm/cur_java])
            elif case_name == "Memory":
                memory_cjnative_arm.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, cur_llvm/cur_java])
                memory_cjvm_arm.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, cur_cjvm/cur_java])
            elif case_name == "CPU":
                cpu_cjnative_arm.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, cur_llvm/cur_java])
                cpu_cjvm_arm.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, cur_cjvm/cur_java])
        else:
            if case_name == "Execution_Time":
                execution_time_cjnative_x86.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, cur_llvm/cur_java])
                execution_time_cjvm_x86.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, cur_cjvm/cur_java])
            elif case_name == "Memory_Peak":
                memory_peak_cjnative_x86.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, cur_llvm/cur_java])
                memory_peak_cjvm_x86.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, cur_cjvm/cur_java])
            elif case_name == "Memory":
                memory_cjnative_x86.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, cur_llvm/cur_java])
                memory_cjvm_x86.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, cur_cjvm/cur_java])
            elif case_name == "CPU":
                cpu_cjnative_x86.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, cur_llvm/cur_java])
                cpu_cjvm_x86.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, cur_cjvm/cur_java])

    return


'''
-----------------------------------------------------------------------------------
-----------------------------  Concurrency_Benchmark  -----------------------------
-----------------------------------------------------------------------------------
'''

def gather_concurrency_benchmark_result(arch='aarch64', case_name='Execution_Time'):
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', concurrency_benchmark_name, case_name])

    # geomean
    cur_result, last_result, (cur_ts, last_ts) = get_cur_and_last_result(productName, level_str, test_suite_name=concurrency_benchmark_name)

    if case_name == "Execution_Time":
        benchmark_list = ["Echo_-iter 10000 -connections 100", "EnterExit_-bacon", "EnterExit_-biased", "EnterExit_-mon-contended -threads 128", 
                        "EnterExit_-mon-contended -threads 16", "EnterExit_-mon-contended -threads 32", "EnterExit_-mon-contended -threads 64", 
                        "EnterExit_-mon-uncontended", "ProducerConsumer_-iter 2000000 -threadPairs 128", "ProducerConsumer_-iter 2000000 -threadPairs 16",
                        "ProducerConsumer_-iter 2000000 -threadPairs 256", "ProducerConsumer_-iter 2000000 -threadPairs 32", "ProducerConsumer_-iter 2000000 -threadPairs 64",
                        "Scheduler_enmasse", "Scheduler_preempt", "StartEndCost_4000000"]
        for caseName in benchmark_list:
            cur_llvm = cur_result["#" + caseName]["llvmgc_cj"]
            cur_cjvm = cur_result["#" + caseName]["cjvm_cj"]
            last_llvm = last_result["#" + caseName]["llvmgc_cj"]
            last_cjvm = last_result["#" + caseName]["cjvm_cj"]
            cur_go = cur_result["#" + caseName]["go"]
            cur_java = cur_result["#" + caseName]["loom"]

            if arch == "aarch64":
                execution_time_cjnative_arm.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, cur_llvm/cur_java])
                execution_time_cjvm_arm.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, cur_cjvm/cur_java])
            else:
                execution_time_cjnative_x86.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, cur_llvm/cur_java])
                execution_time_cjvm_x86.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, cur_cjvm/cur_java])
    
    elif case_name == "Throughput":
        benchmark_list = ["WaitNotifyExtended_base s=0 p=128 c=128 v=4", "WaitNotifyExtended_base s=0 p=16 c=16 v=4", 
                          "WaitNotifyExtended_base s=0 p=32 c=32 v=4", "WaitNotifyExtended_base s=0 p=64 c=64 v=4"]
        for caseName in benchmark_list:
            cur_llvm = cur_result["#" + caseName]["llvmgc_cj"]
            cur_cjvm = cur_result["#" + caseName]["cjvm_cj"]
            last_llvm = last_result["#" + caseName]["llvmgc_cj"]
            last_cjvm = last_result["#" + caseName]["cjvm_cj"]
            cur_go = cur_result["#" + caseName]["go"]
            cur_java = cur_result["#" + caseName]["loom"]

            if arch == "aarch64":
                execution_time_cjnative_arm.append([caseName, last_llvm/cur_llvm, cur_go/cur_llvm, cur_java/cur_llvm])
                execution_time_cjvm_arm.append([caseName, last_cjvm/cur_cjvm, cur_go/cur_cjvm, cur_java/cur_cjvm])
            else:
                execution_time_cjnative_x86.append([caseName, last_llvm/cur_llvm, cur_go/cur_llvm, cur_java/cur_llvm])
                execution_time_cjvm_x86.append([caseName, last_cjvm/cur_cjvm, cur_go/cur_cjvm, cur_java/cur_cjvm])

    elif case_name == "Memory_Peak":
        benchmark_list = ["PerThreadMemUsage_4000"]
        for caseName in benchmark_list:
            cur_llvm = cur_result["#" + caseName]["llvmgc_cj"]
            cur_cjvm = cur_result["#" + caseName]["cjvm_cj"]
            last_llvm = last_result["#" + caseName]["llvmgc_cj"]
            last_cjvm = last_result["#" + caseName]["cjvm_cj"]
            cur_go = cur_result["#" + caseName]["go"]
            cur_java = cur_result["#" + caseName]["loom"]

            if arch == "aarch64":
                memory_peak_cjnative_arm.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, cur_llvm/cur_java])
                memory_peak_cjvm_arm.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, cur_cjvm/cur_java])
            else:
                memory_peak_cjnative_x86.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, cur_llvm/cur_java])
                memory_peak_cjvm_x86.append([caseName, cur_cjvm/last_llvm, cur_cjvm/cur_go, cur_cjvm/cur_java])

    return


'''
-------------------------------------------------------------------------------------
-----------------------------  Object_Orient_Benchmark  -----------------------------
-------------------------------------------------------------------------------------
'''

def gather_oo_benchmark_result(arch='aarch64', case_name='Execution_Time'): 
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', oo_benchmark_name, case_name])

    # geomean
    cur_result, last_result, (cur_ts, last_ts) = get_cur_and_last_result(productName, level_str, test_suite_name=oo_benchmark_name)

    if case_name == "Execution_Time":
        benchmark_list = ["complex/object", "complex/struct", "game_of_life", "NCEIterator"]
        for caseName in benchmark_list:
            cur_llvm = cur_result["#" + caseName]["llvmgc_cj"]
            cur_cjvm = cur_result["#" + caseName]["cjvm_cj"]
            last_llvm = last_result["#" + caseName]["llvmgc_cj"]
            last_cjvm = last_result["#" + caseName]["cjvm_cj"]
            cur_go = cur_result["#" + caseName]["go"]
            cur_java = cur_result["#" + caseName]["java"]

            if arch == "aarch64":
                execution_time_cjnative_arm.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, (cur_llvm/cur_java) if cur_java != 0 else 0])
                execution_time_cjvm_arm.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, (cur_cjvm/cur_java) if cur_java != 0 else 0])
            else:
                execution_time_cjnative_x86.append([caseName, cur_llvm/last_llvm, cur_llvm/cur_go, (cur_llvm/cur_java) if cur_java != 0 else 0])
                execution_time_cjvm_x86.append([caseName, cur_cjvm/last_cjvm, cur_cjvm/cur_go, (cur_cjvm/cur_java) if cur_java != 0 else 0])
    
    elif case_name == "Memory_Allocation":
        benchmark_list = ["avalanche/Normalized throughput/16t", "avalanche/Normalized throughput/1t", 
                          "avalanche/Normalized throughput/32t", "avalanche/Normalized throughput/8t",
                          "avalanche/Throughput/16t", "avalanche/Throughput/1t", "avalanche/Throughput/32t", "avalanche/Throughput/8t"]
        for caseName in benchmark_list:
            cur_llvm = cur_result["#" + caseName]["llvmgc_cj"]
            cur_cjvm = cur_result["#" + caseName]["cjvm_cj"]
            last_llvm = last_result["#" + caseName]["llvmgc_cj"]
            last_cjvm = last_result["#" + caseName]["cjvm_cj"]
            cur_go = cur_result["#" + caseName]["go"]
            cur_java = cur_result["#" + caseName]["java"]

            if arch == "aarch64":
                execution_time_cjnative_arm.append([caseName, last_llvm/cur_llvm, cur_go/cur_llvm, cur_java/cur_llvm])
                execution_time_cjvm_arm.append([caseName, last_cjvm/cur_cjvm, cur_go/cur_cjvm, cur_java/cur_cjvm])
            else:
                execution_time_cjnative_x86.append([caseName, last_llvm/cur_llvm, cur_go/cur_llvm, cur_java/cur_llvm])
                execution_time_cjvm_x86.append([caseName, last_cjvm/cur_cjvm, cur_go/cur_cjvm, cur_java/cur_cjvm])

    return


# '''
# -----------------------------------------------------------------------------
# -----------------------------  Micro_Benchmark  -----------------------------
# -----------------------------------------------------------------------------
# '''

def gather_micro_benchmark_result(arch='aarch64', case_name='array'):  # array or others.
    level_str = '/'.join([arch, micro_benchmark_name, 'Execution_Time', case_name])

    # geomean
    cur_result, last_result, (cur_ts, last_ts) = get_cur_and_last_result(productName, level_str,
                                                                         test_suite_name=micro_benchmark_name)

    cj_llvm_results = [(cur_result[i]['llvmgc_cj'] if i in cur_result else 0) for i in sorted(cur_result.keys())]
    cj_jet_results = [(cur_result[i]['cjvm_cj'] if i in cur_result else 0) for i in sorted(cur_result.keys())]
    go_results = [(cur_result[i]['go'] if i in cur_result else 0) for i in sorted(cur_result.keys())]
    java_results = [(cur_result[i]['java'] if i in cur_result else 0) for i in sorted(cur_result.keys())]

    last_cj_llvm_results = [(last_result[i]['llvmgc_cj'] if i in last_result else 0) for i in sorted(cur_result.keys())]
    last_cj_jet_results = [(last_result[i]['cjvm_cj'] if i in last_result else 0) for i in sorted(cur_result.keys())]

    if arch == "aarch64":
        execution_time_cjnative_arm.append([case_name, geometric_mean(calculate_rate(cj_llvm_results, last_cj_llvm_results)),
                                                       geometric_mean(calculate_rate(cj_llvm_results, go_results)),
                                                       geometric_mean(calculate_rate(cj_llvm_results, java_results))])
        execution_time_cjvm_arm.append([case_name, geometric_mean(calculate_rate(cj_jet_results, last_cj_jet_results)),
                                                   geometric_mean(calculate_rate(cj_jet_results, go_results)),
                                                   geometric_mean(calculate_rate(cj_jet_results, java_results))])
    else:
        execution_time_cjnative_x86.append([case_name, geometric_mean(calculate_rate(cj_llvm_results, last_cj_llvm_results)),
                                                       geometric_mean(calculate_rate(cj_llvm_results, go_results)),
                                                       geometric_mean(calculate_rate(cj_llvm_results, java_results))])
        execution_time_cjvm_x86.append([case_name, geometric_mean(calculate_rate(cj_jet_results, last_cj_jet_results)),
                                                   geometric_mean(calculate_rate(cj_jet_results, go_results)),
                                                   geometric_mean(calculate_rate(cj_jet_results, java_results))])
        
    return


def micro_bench():

    for i in micro_benchmark_info:
        gather_micro_benchmark_result('x86', i)
        gather_micro_benchmark_result('aarch64', i)
    return


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--benchmark", type=str, default='all', help="")
    parser.add_argument("--version", type=str, default='20240929', help="For example: 20240820")
    parser.add_argument("--baseline", type=str, default='20240927', help="For example: 20240820")

    args = parser.parse_args()
    benchmark = args.benchmark
    version = args.version
    baseline = args.baseline

    null_list = ["", ""]

    micro_bench()
    gather_benchmarks_result('x86', 'Execution_Time')
    gather_benchmarks_result('aarch64', 'Execution_Time')
    gather_benchmarks_result('x86', 'Memory_Peak')
    gather_benchmarks_result('aarch64', 'Memory_Peak')
    gather_benchmarks_result('x86', 'Memory')
    gather_benchmarks_result('aarch64', 'Memory')
    gather_benchmarks_result('x86', 'CPU')
    gather_benchmarks_result('aarch64', 'CPU')
    gather_concurrency_benchmark_result('x86', 'Execution_Time')
    gather_concurrency_benchmark_result('aarch64', 'Execution_Time')
    gather_concurrency_benchmark_result('x86', 'Throughput')
    gather_concurrency_benchmark_result('aarch64', 'Throughput')
    gather_concurrency_benchmark_result('x86', 'Memory_Peak')
    gather_concurrency_benchmark_result('aarch64', 'Memory_Peak')
    gather_oo_benchmark_result('x86', 'Execution_Time')
    gather_oo_benchmark_result('aarch64', 'Execution_Time')
    gather_oo_benchmark_result('x86', 'Memory_Allocation')
    gather_oo_benchmark_result('aarch64', 'Memory_Allocation')


    execution_time_list = execution_time_cjnative_x86 + null_list + \
                          execution_time_cjnative_arm + null_list + \
                          execution_time_cjvm_x86 + null_list + \
                          execution_time_cjvm_arm
    df_cjnative = pd.DataFrame(execution_time_list, columns=['case', 'Latest/Previous', 'Cangjie/GO', 'Cangjie/Java'])
    df_cjnative.to_excel('execution_time.xlsx', index=False)


    memory_peak_list = memory_peak_cjnative_x86 + null_list + \
                       memory_peak_cjnative_arm + null_list + \
                       memory_peak_cjvm_x86 + null_list + \
                       memory_peak_cjvm_arm
    df_cjnative = pd.DataFrame(memory_peak_list, columns=['case', 'Latest/Previous', 'Cangjie/GO', 'Cangjie/Java'])
    df_cjnative.to_excel('memory_peak.xlsx', index=False)

    memory_list = memory_cjnative_x86 + null_list + \
                  memory_cjnative_arm + null_list + \
                  memory_cjvm_x86 + null_list + \
                  memory_cjvm_arm
    df_cjnative = pd.DataFrame(memory_list, columns=['case', 'Latest/Previous', 'Cangjie/GO', 'Cangjie/Java'])
    df_cjnative.to_excel('memory.xlsx', index=False)

    cpu_list = cpu_cjnative_x86 + null_list + \
               cpu_cjnative_arm + null_list + \
               cpu_cjvm_x86 + null_list + \
               cpu_cjvm_arm
    df_cjnative = pd.DataFrame(cpu_list, columns=['case', 'Latest/Previous', 'Cangjie/GO', 'Cangjie/Java'])
    df_cjnative.to_excel('cpu.xlsx', index=False)
