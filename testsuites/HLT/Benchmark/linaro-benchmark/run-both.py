#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

#! /usr/bin/env python3

import os
import sys
import pickle
import platform
import datetime
import subprocess
import push_to_cptl as p

# set path
dir_runner = os.path.dirname(os.path.realpath(__file__))
dir_benchmark = os.path.join(dir_runner, 'benchmarks-cj/')
file_timeStamp = os.path.join(dir_runner, 'script/timeStamp.log')
dir_pkl = os.path.join(dir_runner, 'out/pkl/')
file_cjLog = os.path.join(dir_runner, 'script/cj.log')
file_cjLog_lto = os.path.join(dir_runner, 'script/cj_lto.log')
file_cjLog_jet_vm = os.path.join(dir_runner, 'script/cj_vm.log')
file_cjLog_jet_aot = os.path.join(dir_runner, 'script/cj_aot.log')
file_cjLog_jet_vm_pgo = os.path.join(dir_runner, 'script/cj_vm_pgo.log')
file_cjLog_jet_aot_pgo = os.path.join(dir_runner, 'script/cj_aot_pgo.log')

sys.path.append(dir_benchmark)

# set collection
testcases = []
result_java = {}

backend_shell_dict = {
    'llvmgc': 'script/run-cj.sh',
    'llvmgc_lto': 'script/run-cj-lto.sh',
    'jet_vm': 'script/run-jet-vm.sh',
    'jet_aot': 'script/run-jet-aot.sh',
    'jet_vm_pgo': 'script/run-jet-vm-pgo.sh',
    'jet_aot_pgo': 'script/run-jet-aot-pgo.sh',
}

cj_result_files = {
    'llvmgc': file_cjLog,
    'llvmgc_lto': file_cjLog_lto,
    'jet_vm': file_cjLog_jet_vm,
    'jet_aot': file_cjLog_jet_aot,
    'jet_vm_pgo': file_cjLog_jet_vm_pgo,
    'jet_aot_pgo': file_cjLog_jet_aot_pgo
}

cj_result_dict = {
    'llvmgc': {},
    'llvmgc_lto': {},
    'jet_vm': {},
    'jet_aot': {},
    'jet_vm_pgo': {},
    'jet_aot_pgo': {}
}


def RunCj():
    # init env
    subprocess.call(r"bash script/init-cj.sh", shell=True)

    # get testlist
    with open('testlist', 'r') as f:
        dir_cases = f.readlines()
    for i in range(0, len(dir_cases)):
        dir_cases[i] = dir_cases[i].strip('\n')
        casename = dir_cases[i].split('/')[-1]
        # run testcases
        script = backend_shell_dict[backend]
        subprocess.call(r"bash {} {} {}".format(script, casename, dir_cases[i]), shell=True)


def is_float(string):
    try:
        float(string)
        return True
    except ValueError:
        return False


def ParseCj():
    # parse result
    # with open('testlist', 'r') as f:
    #     dir_cases = f.readlines()

    for backend in cj_result_files.keys():
        print('start parse {}'.format(backend))
        file_cjLog = cj_result_files[backend]
        with open(file_cjLog, "r") as f1:
            cases = f1.readlines()
            result_cj = cj_result_dict[backend]

            # save into dict
            for i in range(0, len(cases)):
                arr = cases[i].strip("\n").split(":")
                if len(arr) != 2:  # bad line.
                    print("Parse Result Failed!:", cases[i])
                    continue
                res = arr[1].strip("ns")
                if not is_float(res):
                    print("Parse Result Failed!:", cases[i])
                    res = '0'
                result_cj[arr[0]] = float(res)


def RunJava():
    # init env
    subprocess.call(r"bash script/init-java.sh", shell=True)

    # run testcases
    subprocess.call(r"python3 run.py", shell=True)


def ParseJava():
    # get timestamp
    print('start parse java')

    with open(file_timeStamp, "r") as f1:
        timeStamp = f1.readline().strip("\n")
        dir_log = dir_pkl + timeStamp + ".pkl"

    # get result from pickle
    with open(dir_log, "rb") as f2:
        data = pickle.load(f2)
    with open('testlist', 'r') as f3:
        dir_cases = f3.readlines()

    level_strs = dir_cases.copy()
    # save into dict
    for i in range(0, len(dir_cases)):
        arr = dir_cases[i].strip('\n').split("/")
        dir_cases[i] = "benchmarks/" + arr[0] + "/" + arr[1] + "." + arr[2]
        level_strs[i] = arr[0] + "/" + arr[1] + "/" + arr[2]
        times = data['benchmarks'][dir_cases[i]]
        time = times[0]
        result_java[level_strs[i]] = time

    print("result_java", result_java)


def Push2CPL():
    # parse data of cj and java
    summary_list = []

    summary_list.append("Execution_Time(ns/iter): 运行耗时")
    summary_list.append("---------------------------------")
    summary_list.append("llvmgc和cjvm的BaseLine均为java")
    summary_list.append("---------------------------------")

    out_bytes_cj = subprocess.check_output(['cjc', '-v'])
    commit_id_cj = out_bytes_cj.decode('utf-8').strip().split('\n')
    summary_list.append('Cj Version: ' + '\n'.join([commit_id_cj[0]]))

    out_bytes_java = subprocess.check_output(['java', '-version'], stderr=subprocess.STDOUT)
    commit_id_java = out_bytes_java.decode('utf-8').strip().split('\n')
    summary_list.append('Java Version: ' + '\n'.join([commit_id_java[0]]))

    summary_list = '\n'.join(summary_list)

    time_raw = []
    with open('testlist', 'r') as f:
        dir_cases = f.readlines()
        for cur_case in dir_cases:
            cur_case = cur_case.strip()
            print(cur_case)
            cur_cases = cur_case.split('/')
            sub_bench = cur_cases[0]
            funcName = cur_cases[1] + '_' + cur_cases[2]
            level_str = '{}/CJCF-Bench(算法级)/Linaro_Benchmark/Execution_Time/{}'.format(arch, sub_bench)

            time_result = {}
            cplt_name = {
                'llvmgc': 'llvmgc_cj',
                'llvmgc_lto': 'llvmgc_lto_cj',
                'jet_vm': 'cjvm_cj',
                'jet_aot': 'cjvm_aot_cj',
                'jet_vm_pgo': 'cjvm_pgo_cj',
                'jet_aot_pgo': 'cjvm_aot_pgo_cj'
            }

            for (key_java, value_java) in result_java.items():
                if (cur_case == key_java):
                    time_result['java'] = {'value': value_java, 'baseline': value_java}

            for backend in cj_result_dict.keys():
                for i in cj_result_dict[backend].keys():
                    if i == cur_case:
                        time_result[cplt_name[backend]] = {'value': cj_result_dict[backend][i], 'baseline': time_result['java'].get('value', 0)}

            push_template = p.template(level_str=level_str, funcName=funcName, result=time_result,
                                        timestamp=timestamp, summary=summary_list)
            push_template['message'] = 'llvmgc_cj,cjvm_cj,java,llvmgc_lto_cj,cjvm_pgo_cj,cjvm_aot_cj,cjvm_aot_pgo_cj'
            time_raw.append(push_template)

            print(push_template)

    # upload to cpltp
    p.post_one_url(time_raw, version_json)


if __name__ == "__main__":
    timestamp = int(datetime.datetime.now().strftime('%Y%m%d%H%M'))
    arch = platform.machine()
    if arch == 'x86_64':
        arch = 'x86'
    i = sys.argv
    options = ['llvmgc', 'llvmgc_lto', 'jet_aot', 'jet_vm', 'jet_vm_pgo', 'jet_aot_pgo', 'java', 'push']
    if len(i) == 2 or len(i) == 3:
        backend = i[1]
        version_json = None
        if backend not in options:
            print('[ERROR]backend should in {}!'.format(options))
            sys.exit(1)
        if len(i) == 3:
            version_json = i[2]
    else:
        print('[ERROR] arg should be in {}.'.format(options))
        sys.exit(1)

    # RunCj()
    # ParseCj()
    if backend == 'java':
        RunJava()
    elif backend != 'push':  # run cj
        RunCj()
    elif backend == 'push':
        ParseCj()
        ParseJava()
        Push2CPL()
