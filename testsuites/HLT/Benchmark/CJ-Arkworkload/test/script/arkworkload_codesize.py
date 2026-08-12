#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import sys
import csv
import os
import shutil
import time
import subprocess
import platform
import datetime
import requests
import pandas as pd
import json
import glob

# ---------------------------------------------------编译部分----------------------------------------------

def getAlltestcases(benchmarkPath): 
    """
    getAlltestcases: get all cangjie testcases from dir
    """
    cjTestlist = []
    for path, dir_lst, file_lst in os.walk(benchmarkPath):
        for file_name in file_lst:
            if file_name.endswith(".cj"):
                cjTestlist.append(os.path.join(path, file_name))
    return cjTestlist

def compileCjTestcase(cjTestlist, PGOflag="CLOSED"):
    """
    compileCjTestcase: complie cangjie testcases to output dir
    """
    # Check cjCompileResDir
    if os.path.exists(cjCompileResDir):
        shutil.rmtree(cjCompileResDir)
    os.mkdir(cjCompileResDir)
    # START compile cjTestCases
    for cjTest in cjTestlist:
        shellCmd = "\"C:/Program Files/Git/usr/bin/bash.exe\" ./CJ-Arkworkload/test/script/cjohos_codesize.sh NoAPC "
        cjTest = cjTest.replace("\\", "/")
        compileCmd = shellCmd + cjTest + " " + cjCompileResDir + "/" + cjTest.split('/')[-1][:-3] + "cj"
        print("Compiling " + cjTest.split('/')[-1])
        print(compileCmd)

        p = subprocess.Popen(compileCmd, stdout=subprocess.PIPE,
                                         stderr=subprocess.STDOUT,
                                         shell=True)
        for readline in p.stdout.readlines():
            stdout = readline.decode('utf-8','replace').strip()
            if "error" in stdout or "ERROR" in stdout:
                print("Compiling " + cjTest + " Failed!")
                print(stdout)
                break
        p.communicate()
        p.kill()
    
    file_list = ["./CJ-Arkworkload/mix-case/cj/weekly/zlib/\*.cj", 
                 "./CJ-Arkworkload/cjds/cj/\*.cj", 
                 "./CJ-Arkworkload/mix-case/cj/weekly/basic/\*.cj", 
                 "./CJ-Arkworkload/mix-case/cj/weekly/OfflineAssembler/\*.cj", 
                 "./CJ-Arkworkload/babylon/cj/\*.cj", 
                 "./CJ-Arkworkload/mix-case/cj/weekly/box2d/\*.cj"]
    file_output = ["./CJ-Arkworkload/test/cjCompileRes_codesize/zlibcj", 
                   "./CJ-Arkworkload/test/cjCompileRes_codesize/cjdscj", 
                   "./CJ-Arkworkload/test/cjCompileRes_codesize/basiccj", 
                   "./CJ-Arkworkload/test/cjCompileRes_codesize/OfflineAssemblercj", 
                   "./CJ-Arkworkload/test/cjCompileRes_codesize/babyloncj", 
                   "./CJ-Arkworkload/test/cjCompileRes_codesize/box2dcj"]

    for i in range(len(file_list)):
        shellCmd = "\"C:/Program Files/Git/usr/bin/bash.exe\" ./CJ-Arkworkload/test/script/cjohos_codesize.sh NoAPC "
        compileCmd = shellCmd + file_list[i] + " " +  file_output[i]
        print(compileCmd)
        p = subprocess.Popen(compileCmd, stdout=subprocess.PIPE,
                                         stderr=subprocess.STDOUT,
                                         shell=True)
        for readline in p.stdout.readlines():
            stdout = readline.decode('utf-8','replace').strip()
            if "error" in stdout or "ERROR" in stdout:
                print("Compiling " + file_list[i] + " Failed!")
                print(stdout)
                break
        p.communicate()
        p.kill()

    # 单独编译mandreel
    shellCmd = "\"C:/Program Files/Git/usr/bin/bash.exe\" ./CJ-Arkworkload/test/script/cjohos_codesize.sh APC "
    file_mandreel = "\'./CJ-Arkworkload/mix-case/cj/weekly/mandreel/mandreel_part1/\*.cj ./CJ-Arkworkload/mix-case/cj/weekly/mandreel/\*.cj\'"
    output_mandreel = "./CJ-Arkworkload/test/cjCompileRes_codesize/mandreelcj"
    compileCmd = shellCmd + file_mandreel + " " +  output_mandreel
    print(compileCmd)
    p = subprocess.Popen(compileCmd, stdout=subprocess.PIPE,
                                        stderr=subprocess.STDOUT,
                                        shell=True)
    for readline in p.stdout.readlines():
        stdout = readline.decode('utf-8','replace').strip()
        if "error" in stdout or "ERROR" in stdout:
            print("Compiling " + file_mandreel + " Failed!")
            print(stdout)
            break
    p.communicate()
    p.kill()

    # Clean cjCompileResDir: No .cached and cjo file
    for outputFile in os.scandir(cjCompileResDir):
        if not outputFile.name.endswith("cj"):
            if outputFile.is_dir():
                shutil.rmtree(os.path.join(outputFile))
            elif outputFile.is_file():
                os.remove(os.path.join(outputFile))


# ---------------------------------------------------获取数据部分----------------------------------------------

productName = 'Cangjie'
workload_compile_name = 'CJ-ArkWorkload-Compile'
benchmark_suite_dict = {
    workload_compile_name: {'Cangjie Source Size(loc)'}
}

# workload部分代码量，建议实时更新
loc_need_update = {
    "stanford-crypto-aes": 11515
}

timestamp = int(datetime.datetime.now().strftime('%Y%m%d%H%M'))
version = datetime.datetime.now().strftime('%Y%m%d')

def get_so_file_sizes(directory):
    # 使用glob查找指定目录下的所有二进制文件
    so_files = glob.glob(os.path.join(directory, "*cj"))
    
    # 创建一个字典来存储文件名及其对应的大小
    file_sizes = {}
    
    # 遍历找到的所有.so文件
    for file_path in so_files:
        try:
            # 获取文件大小
            file_size = os.path.getsize(file_path)
            substrings = file_path.split('/')[-1].split('\\')
            # 将文件路径和大小添加到字典中
            file_sizes[substrings[-1][:-2]] = file_size
        except FileNotFoundError:
            print(f"文件 {file_path} 未找到")
        except Exception as e:
            print(f"处理文件 {file_path} 时发生错误: {e}")
    return file_sizes


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

# cur_data should be get from get_one_timestamp_result(timestamp,level_str)
def store_one_result_to_dict(cur_dict, cur_data, test_suite_name=workload_compile_name):
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


def get_cur_and_last_result(productName, level_str, test_suite_name=workload_compile_name):
    timestamps = get_all_timestamp(productName, level_str)

    version_time = ''
    version_flag = 0
    baseline_flag = 0
    for i in range(len(timestamps)):
        if version in str(timestamps[i]['timeStamp']):
            version_time = timestamps[i]['timeStamp']
            version_flag = 1
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

    print("loc_version_time: ", version_time)
    print("level_str: ", level_str)
    cur = get_one_timestamp_result(version_time, level_str)
    cur_dict = {}
    cur_dict = store_one_result_to_dict(cur_dict, cur, test_suite_name=test_suite_name)

    return cur_dict


def get_loc(code_loc_path):
    # 获取linux工程的代码量
    return get_cur_and_last_result(productName, code_loc_path, test_suite_name=workload_compile_name)


def collect_language_info():
    # Collect Cangjie & Swift language version info
    commit_id_list = []
    commit_id_list.append("----------------------------------------------------------------------------")
    commit_id_list.append("代码量从【x86/CJCF-Bench(算法级)/CJ-ArkWorkload-Compile/发布态/compilation_efficiency】表中获取")
    commit_id_list.append("表中的CodeSize数据编译选项：-O2 --no-sub-pkg --dy-std -s")
    commit_id_list.append("mandreel代码量较大，编译时增加了编译选项--apc")
    commit_id_list.append("----------------------------------------------------------------------------")
    return commit_id_list


def parser_result_cpltp(sizes, ldc_data, level_str, version_json):
    raw = []
    for file_path, size in sizes.items():
        results = {}
        case_name = file_path
        if "-cache" in case_name:
            continue
        elif ('#' + case_name) not in ldc_data:
            print("error! " + case_name +  " compile failed!")
            tmp_loc = loc_need_update[case_name]
        else:
            tmp_loc = ldc_data['#' + case_name]['Cangjie Source Size(loc)']
        results.setdefault('CodeSize(B)', {'value': size, 'baseline': 0})
        results.setdefault('SourceSize(loc)', {'value': tmp_loc, 'baseline': 0})
        results.setdefault('CodeSize(B)/SourceSize(loc)', {'value': size/tmp_loc if tmp_loc != 0 else 0, 'baseline': 0})
        cur_level_str = level_str 
        tmp_summary = []
        
        cur_level_str = cur_level_str + "/" + "CodeSize"
        tmp_summary.append("CodeSize: 编译产物大小")
        commit_id_list = collect_language_info()
        tmp_summary += commit_id_list
        tmp_summary = '\n'.join(tmp_summary)
        temp = template_new(level_str=cur_level_str, funcName=case_name, result=results,
                            timestamp=timestamp, summary=tmp_summary)
        temp.setdefault('message', 'CodeSize(B),SourceSize(loc),CodeSize(B)/SourceSize(loc)')
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


def getCodeSize():
    code_loc_path = '/'.join(['x86', 'CJCF-Bench(算法级)', 'CJ-ArkWorkload-Compile', '发布态', 'compilation_efficiency'])
    level_str = '/'.join(['ohos', 'CJCF-Bench(算法级)', 'CJ-ArkWorkload'])
    version_json = "../../../../Cangjie/version.json"
    
    # 获取代码量
    ldc_data = get_loc(code_loc_path)
    # 指定目录
    directory = "./CJ-Arkworkload/test/cjCompileRes_codesize"
    # 获取so大小
    sizes = get_so_file_sizes(directory)
    # 数据上传看板
    parser_result_cpltp(sizes, ldc_data, level_str, version_json)


if __name__ == "__main__":
    cjCompileResDir = './CJ-Arkworkload/test/cjCompileRes_codesize'
    # Get Testlist from CJ-Arkworkload
    cjTestlist = getAlltestcases('./CJ-Arkworkload')
    # Run Cangjie Testcases
    compileCjTestcase(cjTestlist)
    # 获取codesize大小和代码量，上传数据到看板
    getCodeSize()
