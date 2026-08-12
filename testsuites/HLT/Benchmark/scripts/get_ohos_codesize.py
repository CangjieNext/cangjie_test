#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import glob
import argparse
import pandas as pd
import json
import requests
import datetime
import time

ldc_data = {"libcangjie-runtime-so": 0, "libcangjie-dynamicLoader-opensslFFI-so": 0, "libcangjie-demangle-so": 0}

def get_so_file_sizes(directory):
    # 使用glob查找指定目录下的所有.so文件
    so_files = glob.glob(os.path.join(directory, "libcangjie-*.so"))
    
    # 创建一个字典来存储文件名及其对应的大小
    file_sizes = {}
    
    # 遍历找到的所有.so文件
    for file_path in so_files:
        try:
            # 获取文件大小
            file_size = os.path.getsize(file_path)
            substrings = file_path.split('/')
            # 将文件路径和大小添加到字典中
            file_sizes[substrings[-1]] = file_size
        except FileNotFoundError:
            print(f"文件 {file_path} 未找到")
        except Exception as e:
            print(f"处理文件 {file_path} 时发生错误: {e}")
    
    return file_sizes

def get_loc(json_data):
    # 获取linux工程的代码量
    for data in json_data:
        tmp_name = "libcangjie-" + data["Unnamed: 0"].replace(".", "-") + "-so"
        ldc_data[tmp_name] = data["Cangjie Source Size(loc)"]


def parser_result_cpltp(sizes):
    raw = []

    for file_path, size in sizes.items():
        results = {}
        case_name = file_path
        tmp_loc = ldc_data[file_path.replace(".", "-")]
        results.setdefault('CodeSize(B)', {'value': size, 'baseline': 0})
        results.setdefault('SourceSize(loc)', {'value': tmp_loc, 'baseline': 0})
        results.setdefault('CodeSize(B)/SourceSize(loc)', {'value': size/tmp_loc if tmp_loc != 0 else 0, 'baseline': 0})
        cur_level_str = level_str 
        tmp_summary = []
        
        cur_level_str = cur_level_str + "/" + "CodeSize"
        tmp_summary.append("CodeSize: 编译产物大小")
        
        tmp_summary += commit_id_list
        tmp_summary = '\n'.join(tmp_summary)
        temp = template_new(level_str=cur_level_str, funcName=case_name, result=results,
                            timestamp=timestamp, summary=tmp_summary)
        print(temp)
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
        url='http://api/cpltp/api/tasklog/testcase/api/v1/task/performance/result/daily/{}/testcases'.format(
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

def collect_language_info():
    # Collect Cangjie & Swift language version info
    commit_id_list = []
    commit_id_list.append("----------------------------------------------------------------------------------------------------------------")
    commit_id_list.append("表中的CodeSize数据从【cangjie-*-linux_x64-ohos_aarch64.tar.gz】版本包中获取")
    commit_id_list.append("代码量从【x86/STD/发布态/compilation_efficiency】表中获取")
    commit_id_list.append("libcangjie-runtime.so, libcangjie-dynamicLoader-opensslFFI.so, libcangjie-demangle.so非纯仓颉代码编译，不统计代码量")
    commit_id_list.append("----------------------------------------------------------------------------------------------------------------")
    return commit_id_list


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--loc", type=str, help="")
    parser.add_argument("--version", type=str, help="", default="version_B010.json")
    args = parser.parse_args()

    code_loc = args.loc
    version_json = args.version

    level_str = '/'.join(['ohos', 'CJPW-Bench(领域级)', 'STD'])
    commit_id_list = collect_language_info()
    timestamp = int(datetime.datetime.now().strftime('%Y%m%d%H%M'))

    # 读取CSV文件
    data = pd.read_csv(code_loc)
    # 将DataFrame转换为JSON格式
    json_data = data.to_json(orient='records', force_ascii=False)
    get_loc(json.loads(json_data))

    # 指定目录
    directory = "cangjie/runtime/lib/linux_ohos_aarch64_cjnative"
    # 获取so大小
    sizes = get_so_file_sizes(directory)
    # 数据上传看板
    parser_result_cpltp(sizes)
    
