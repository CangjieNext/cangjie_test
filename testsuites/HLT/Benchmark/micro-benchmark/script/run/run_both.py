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
import argparse
import datetime
import subprocess
import push_to_cptl as p
import platform

sys.path.append("../../../scripts/")

dir_runner = os.path.dirname(os.path.realpath(__file__))
dir_result = os.path.join(dir_runner, "../result/")
dir_testlist = os.path.join(dir_runner, "../testlist/")

api_cj = []
api_cj_exist = []
result_cj_dict = {}
result_vm_dict = {}
result_go_dict = {}
result_lto_dict = {}
result_java_dict = {}
result_swift_dict = {}
java_base_module = {
    "collections_hashset",
    "collections_hashmap",
    "collections_arraydeque",
    "collections_linkedlist",
    "collections_treemap",
    "collections_treeset",
    "reflect"
}

def set_up():
    subprocess.call(r"bash set-up.sh", shell=True)

def set_up_lto():
    subprocess.call(r"bash set-up-lto.sh", shell=True)

def set_up_jet():
    subprocess.call(r"bash set-up-jet.sh", shell=True)


def clean_up():
    subprocess.call(r"bash clean-up.sh", shell=True)


def get_api(api_list, api_file):
    testlist = os.path.join(dir_testlist, api_file)
    if os.path.exists(testlist):
        with open(testlist, "r") as f:
            lines = f.readlines()
        for i in range(0, len(lines)):
            api = lines[i].strip("\n")
            api_list.append(api)
            result_cj_dict[api] = {}
            result_go_dict[api] = {}
            result_java_dict[api] = {}
            result_swift_dict[api] = {}
            result_vm_dict[api] = {}
            result_lto_dict[api] = {}
    else:
        print("Error: {} does not exist.".format(testlist))


def run_benchmark(language, apix):
    print("language, apix")
    print(language, apix)
    if language == "llvmgc":
        subprocess.call(r"{} {}".format("bash run-cj.sh", apix), shell=True)
    elif language == "vm":
        subprocess.call(r"{} {}".format("bash run-cj-jet.sh", apix), shell=True)
    elif language == "go":
        subprocess.call(r"{} {}".format("bash run-go.sh", apix), shell=True)
    elif language == "llvmgc_lto":
        subprocess.call(r"{} {}".format("bash run-cj-lto.sh", apix), shell=True)
    elif language == "java":
        subprocess.call(r"{} {}".format("bash run-java.sh", apix), shell=True)
    elif language == "swift":
        subprocess.call(r"{} {}".format("bash run-swift.sh", apix), shell=True)
    else:
        print("Error: run benchmark {} of {} failed.".format(apix, language))


def parse_result(language, apix):
    if language == "cj":
        cj_log = "result-cj" + "-" + apix + ".list"
        cj_result = os.path.join(dir_result, cj_log)
        if os.path.exists(cj_result):
            api_cj_exist.append(apix)
            with open(cj_result, "r") as f1:
                cases = f1.readlines()
            for i in range(0, len(cases)):
                try:
                    arr1 = cases[i].strip("\n").split(" ")
                    arr2 = arr1[0].split(":")
                    result_cj_dict[apix][arr2[0]] = float(arr1[1])
                except ValueError as e:
                    print(e)
        else:
            print("Error: {} does not exist.".format(cj_result))
    elif language == "java":
        java_log = "result-java-" + apix + ".list"
        java_result = os.path.join(dir_result, java_log)
        if os.path.exists(java_result):
            with open(java_result, "r") as f1:
                cases = f1.readlines()
            for i in range(0, len(cases)):
                try:
                    arr1 = cases[i].strip('\n').split(' ')
                    arr2 = arr1[0].split(':')
                    result_java_dict[apix][arr2[0]] = float(arr1[1])
                except ValueError as e:
                    print(e)
        else:
            print("[SKIP]: {} does not exist.".format(java_result))
    elif language == "swift":
        swift_log = "result-swift-" + apix + ".list"
        swift_result = os.path.join(dir_result, swift_log)
        if os.path.exists(swift_result):
            with open(swift_result, "r") as f1:
                cases = f1.readlines()
            for i in range(0, len(cases)):
                try:
                    arr1 = cases[i].strip('\n').split(' ')
                    arr2 = arr1[0].split(':')
                    result_swift_dict[apix][arr2[0]] = float(arr1[1])
                except ValueError as e:
                    print(e)
        else:
            print("[SKIP]: {} does not exist.".format(swift_result))
    elif language == "lto":
        cj_log = "result-lto" + "-" + apix + ".list"
        cj_result = os.path.join(dir_result, cj_log)
        if os.path.exists(cj_result):
            with open(cj_result, "r") as f1:
                cases = f1.readlines()
            for i in range(0, len(cases)):
                try:
                    arr1 = cases[i].strip("\n").split(" ")
                    arr2 = arr1[0].split(":")
                    result_lto_dict[apix][arr2[0]] = float(arr1[1])
                except ValueError as e:
                    print(e)
        else:
            print("Error: {} does not exist.".format(cj_result))
    elif language == "vm":
        vm_log = "result-jet" + "-" + apix + ".list"
        vm_result = os.path.join(dir_result, vm_log)
        if os.path.exists(vm_result):
            with open(vm_result, "r") as f1:
                cases = f1.readlines()
            for i in range(0, len(cases)):
                try:
                    arr1 = cases[i].strip("\n").split(" ")
                    arr2 = arr1[0].split(":")
                    result_vm_dict[apix][arr2[0]] = float(arr1[1])
                except ValueError as e:
                    print(e)
        else:
            print("Error: {} does not exist.".format(vm_result))
    elif language == "go":
        go_log = "result-go" + "-" + apix + ".list"
        go_result = os.path.join(dir_result, go_log)
        if os.path.exists(go_result):
            with open(go_result, "r") as f1:
                cases = f1.readlines()
            for i in range(0, len(cases)):
                try:
                    arr = cases[i].strip("\n").split(" ")
                    result_go_dict[apix][arr[0]] = float(arr[1])
                except ValueError as e:
                    print(e)
        else:
            print("Error: {} does not exist.".format(go_result))
    else:
        print("Error: parse result {} of {} failed.".format(apix, language))


def push2cpltp(apix, arch):  # push llvmgc jet_vm go together.
    time_raw = []
    for (key_cj, value_cj) in result_cj_dict[apix].items():
        result_go = result_go_dict[apix]
        result_java = result_java_dict[apix]
        result_swift = result_swift_dict[apix]
        result_vm = result_vm_dict[apix]
        result_lto = result_lto_dict[apix]
        value_go = 0 if key_cj not in result_go.keys() else result_go[key_cj]
        value_java = 0 if key_cj not in result_java.keys() else result_java[key_cj]
        value_swift = 0 if key_cj not in result_swift.keys() else result_swift[key_cj]
        value_vm = 0 if key_cj not in result_vm.keys() else result_vm[key_cj]
        value_lto = 0 if key_cj not in result_lto.keys() else result_lto[key_cj]
        time_result = {}
        if apix == "loop":
            time_result['llvmgc_cj'] = {'value': value_cj, 'baseline': value_swift}
            time_result['go'] = {'value': value_go, 'baseline': value_swift}
            time_result['java'] = {'value': value_java, 'baseline': value_swift}
            time_result['swift'] = {'value': value_swift, 'baseline': value_swift}
            time_result['cjvm_cj'] = {'value': value_vm, 'baseline': value_swift}
            time_result['llvmgc_lto_cj'] = {'value': value_lto, 'baseline': value_swift}
            level_str = "{}/Micro-Bench(原子级)/Execution_Time/".format(arch) + apix
        elif apix not in java_base_module:
            time_result['llvmgc_cj'] = {'value': value_cj, 'baseline': value_go}
            time_result['go'] = {'value': value_go, 'baseline': value_go}
            time_result['java'] = {'value': value_java, 'baseline': value_go}
            time_result['swift'] = {'value': value_swift, 'baseline': value_go}
            time_result['cjvm_cj'] = {'value': value_vm, 'baseline': value_go}
            time_result['llvmgc_lto_cj'] = {'value': value_lto, 'baseline': value_go}
            level_str = "{}/Micro-Bench(原子级)/Execution_Time/".format(arch) + apix
        else:
            time_result['llvmgc_cj'] = {'value': value_cj, 'baseline': value_java}
            time_result['go'] = {'value': value_go, 'baseline': value_java}
            time_result['java'] = {'value': value_java, 'baseline': value_java}
            time_result['swift'] = {'value': value_swift, 'baseline': value_java}
            time_result['cjvm_cj'] = {'value': value_vm, 'baseline': value_java}
            time_result['llvmgc_lto_cj'] = {'value': value_lto, 'baseline': value_java}
            level_str = "{}/Micro-Bench(原子级)/Execution_Time/".format(arch) + apix
        # 对用例和版本的描述
        commit_id_list = []
        commit_id_list.append("Execution_Time(ns/op): 运行耗时")
        commit_id_list.append("---------------------------------")
        commit_id_list.append("llvmgc, cjvm, java, swift, go的BaseLine均为go")
        commit_id_list.append("---------------------------------")
        out_bytes_cj = subprocess.check_output(['cjc', '-v'])
        commit_id_cj = out_bytes_cj.decode('utf-8').strip().split('\n')
        commit_id_list.append('Cj Version: ' + '\n'.join([commit_id_cj[0]]))
        out_bytes_go = subprocess.check_output(['go', 'version'])
        commit_id_go = out_bytes_go.decode('utf-8').strip().split('\n')
        commit_id_list.append('Go Version: ' + '\n'.join([commit_id_go[0]]))
        out_bytes_java = subprocess.check_output(['java', '-version'], stderr=subprocess.STDOUT)
        commit_id_java = out_bytes_java.decode('utf-8').strip().split('\n')
        commit_id_list.append('Java Version: ' + '\n'.join([commit_id_java[0]]))
        out_bytes_swift = subprocess.check_output(['swift', '--version'], stderr=subprocess.STDOUT)
        commit_id_swift = out_bytes_swift.decode('utf-8').strip().split('\n')
        commit_id_list.append('Swift Version: ' + '\n'.join([commit_id_swift[0]]))
        summary = '\n'.join(commit_id_list)
        time_raw.append(p.template_new(level_str, key_cj, time_result, timestamp, summary=summary))
    print(time_raw)
    try:
        p.post_one_url_new(time_raw, version_json)
        pass
    except BaseException as e:
        print(e)


def test_api():
    print("setting up...")
    set_up()
    print("set up")
    for apix in api_cj:
        print("Testing cj api: {}.".format(apix))
        run_benchmark("llvmgc", apix)
        print("Done.")
        

def test_api_lto():
    set_up_lto()
    for apix in api_cj:
        print("Testing lto api: {}.".format(apix))
        run_benchmark("llvmgc_lto", apix)
        print("Done.")


def test_api_go():
    for apix in api_cj:
        print("Testing go api: {}.".format(apix))
        run_benchmark("go", apix)
        print("Done.")


def test_api_java():
    for apix in api_cj:
        print("Testing java api: {}.".format(apix))
        run_benchmark("java", apix)
        print("Done.")

def test_api_swift():
    for apix in api_cj:
        print("Testing swift api: {}.".format(apix))
        run_benchmark("swift", apix)
        print("Done.")

def test_api_jet():
    set_up_jet()
    for apix in api_cj:
        print("Testing cjvm api: {}.".format(apix))
        run_benchmark("vm", apix)
        print("Done.")


def push_all():
    for apix in api_cj:
        print(apix)
        parse_result("cj", apix)
        parse_result("go", apix)
        parse_result("vm", apix)
        parse_result("lto", apix)
        parse_result("java", apix)
        parse_result("swift", apix)
    for apix in api_cj_exist:
        print(apix)
        push2cpltp(apix, arch)


if __name__ == "__main__":
    timestamp = int(datetime.datetime.now().strftime('%Y%m%d%H%M'))
    arch = platform.machine()
    if arch == 'x86_64':
        arch = 'x86'
    i = sys.argv
    options = ['llvmgc', 'jet_vm', 'go', 'push', 'clean', 'llvmgc_lto', "java", "swift"]
    backend = 'llvmgc'
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

    get_api(api_cj, "testlist-cj-api")
    if backend == 'llvmgc':
        test_api()  # run llvmgc and go
    
    if backend == 'llvmgc_lto':
        test_api_lto()  # run llvmgc and go with option --lto=full

    if backend == 'go':
        test_api_go()  # go without setup
    
    if backend == 'java':
        test_api_java()

    if backend == 'swift':
        test_api_swift()

    if backend == 'jet_vm':
        test_api_jet()  # run jet vm

    if backend == 'clean':
        clean_up()

    if backend == 'push':
        push_all()

