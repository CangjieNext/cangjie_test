#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import logging
import datetime
import pandas as pd
import numpy as np
import os
import argparse
import subprocess
import json
#from utility import *

logger = logging.getLogger(__name__)
scriptDir = os.path.dirname(os.path.abspath(__file__))

cangjie_compilation_efficiency_table_header = ['Compilation Efficiency(s/kloc)', 'Cangjie Source Size(loc)',
                                       'Compilation Time(s)', 'Average CPU Usage(%)', 'Peak CPU Usage(%)',
                                       'Average Memory Usage(MB)', 'Peak Memory Usage(MB)', 'Code Size(KB)']

swift_compilation_efficiency_table_header = ['Compilation Efficiency(s/kloc)', 'Swift Source Size(loc)',
                                       'Compilation Time(s)', 'Average CPU Usage(%)', 'Peak CPU Usage(%)',
                                       'Average Memory Usage(MB)', 'Peak Memory Usage(MB)', 'Code Size(KB)']



compilation_efficiency_table_header = ['Cangjie Compilation Efficiency(s/kloc)', 'Swift Compilation Efficiency(s/kloc)',
                                        'Cangjie Source Size(loc)', 'Swift Source Size(loc)',
                                        'Cangjie Compilation Time(s)','Swift Compilation Time(s)',
                                        'Cangjie Average CPU Usage(%)','Swift Average CPU Usage(%)',
                                        'Cangjie Peak CPU Usage(%)','Swift Peak CPU Usage(%)',
                                        'Cangjie Average Memory Usage(MB)','Swift Average Memory Usage(MB)',
                                        'Cangjie Peak Memory Usage(MB)','Swift Peak Memory Usage(MB)',
                                        'Cangjie Code Size(KB)','Swift Code Size(KB)']


comparison_table_header = ['Cangjie Compilation Efficiency(s/kloc)', 'Swift Compilation Efficiency(s/kloc)',
                               'Cangjie Peak Memory(MB)', 'Swift Peak Memory(MB)',
                               'Cangjie Memory Efficiency(MB/kloc)', 'Swift Memory Efficiency(MB/kloc)',
                               'Cangjie Compilation Time(s)', 'Swift Compilation Time(s)',
                               'Cangjie Source Size(loc)', 'Swift Source Size(loc)',
                               'Cangjie Peak CPU(%)', 'Swift Peak CPU(%)',
                               'Cangjie Code Size(KB)', 'Swift Code Size(KB)']

def get_config_from(profile_json_file_path: str):
    with open(profile_json_file_path, 'r') as profile_json_file:
        profile = json.load(profile_json_file)
        config = profile['config_name']
        return config


def generate_tables_for(benchmark_result_dir_path: str, comparison_table: dict):
    mode = "Cangjie" if "cj" in benchmark_result_dir_path else "Swift"
    # these tables would be generated per benchmark result.
    compilation_efficiency_records = dict()
    profile_json_file_path = os.path.join(benchmark_result_dir_path, 'profile.json')
    config = get_config_from(profile_json_file_path)
    with open(profile_json_file_path) as profile_json_file:
        profile = json.load(profile_json_file)
        testcases = profile['testcases']
        option = profile['additional_options']
        for testcase in testcases:
            testcase_name = testcase['name']
            logger.info('testcase name [{}]'.format(testcase_name))
            compile_product_name: str = testcase['compile_product_name']
            if not os.path.exists(compile_product_name):
                logging.error(f'{compile_product_name} file not been generated properly.')
                logger.error('no output file found, maybe this testcase failed.')
                code_size_in_kb = 0
                # exit(-1)
            else:
                code_size_in_kb = os.path.getsize(compile_product_name) / 1024
            cloc_prof_file_name = '{}.cloc.prof'.format(testcase_name)
            cloc_prof_file_path = os.path.join(benchmark_result_dir_path, cloc_prof_file_name)
            if not os.path.exists(cloc_prof_file_path):
                logging.error(f'{cloc_prof_file_path} file not been generated properly.')
                source_size = 0
                continue

            psutil_prof_file_name = '{}.psutil.prof'.format(testcase_name)
            psutil_prof_file_path = os.path.join(benchmark_result_dir_path, psutil_prof_file_name)
            if not os.path.exists(psutil_prof_file_path):
                logging.error('option is {} ,{} file not been generated properly.').format(option,psutil_prof_file_path)
                compilation_time = 0
                peak_memory_usage = 0
                average_memory_usage = 0
                peak_cpu_usage = 0
                average_cpu_usage = 0
                continue
            
            
            with open(cloc_prof_file_path, 'r') as cloc_prof_file:
                result = json.load(cloc_prof_file)
                source_size = result[mode]['code']

            result = pd.read_csv(psutil_prof_file_path)
            compilation_time = result['timestamp'].iloc[-1]
            peak_memory_usage = result['rss'].max()
            average_memory_usage = result['rss'].mean()
            peak_cpu_usage = result['cpu'].max()
            average_cpu_usage = result['cpu'].mean()

            compilation_efficiency_records[testcase_name.split(".")[0]] = {
                f'{mode} Source Size(loc)': source_size,
                f'{mode} Compilation Time(s)': compilation_time / 1e9,
                f'{mode} Average CPU Usage(%)': average_cpu_usage,
                f'{mode} Peak CPU Usage(%)': peak_cpu_usage,
                f'{mode} Average Memory Usage(MB)': average_memory_usage / 1024 / 1024,
                f'{mode} Peak Memory Usage(MB)': peak_memory_usage / 1024 / 1024,
                f'{mode} Code Size(KB)': code_size_in_kb,
            }

    """
    compilation_efficiency_table_header = cangjie_compilation_efficiency_table_header if mode == "Cangjie" else swift_compilation_efficiency_table_header

    compilation_efficiency_table = pd.DataFrame.from_dict(compilation_efficiency_records, orient='index',
                                                          columns=compilation_efficiency_table_header)
    """

    compilation_efficiency_table = pd.DataFrame.from_dict(compilation_efficiency_records, orient='index',
                                                          columns=compilation_efficiency_table_header)

    compilation_efficiency_table[f'{mode} Compilation Efficiency(s/kloc)'] = compilation_efficiency_table[
                                                                         f'{mode} Compilation Time(s)'] / \
                                                                     compilation_efficiency_table[
                                                                         f'{mode} Source Size(loc)'] * 1000

    csv_path = os.path.join(benchmark_result_dir_path, f"{mode}_compilation_efficiency_table.csv")
    compilation_efficiency_table.to_csv(csv_path)
    return csv_path
    

# 返回csv
def generate_tables(compileResDir):
    comparison_table_records = dict()
    profile_result_dir_path = ""
    csv_list = []
    for benchmark_result_dir_name in os.listdir(compileResDir):
        if "profile" in benchmark_result_dir_name:
            profile_result_dir_path = os.path.join(compileResDir, benchmark_result_dir_name)
        if not os.path.exists(os.path.join(profile_result_dir_path, 'profile.json')):
            continue
        csv_path = generate_tables_for(profile_result_dir_path, comparison_table_records)
        csv_list.append(csv_path)
    return csv_list


# 这里就得一个个去读取数据json文件，然后做数据处理
def generate_summary_tables(scriptDir,cjCompileResDir,swiftCompileResDir, cj_csv_list, swift_csv_list):
    cj_option_list = []
    swf_option_list = []

    with open(os.path.join(scriptDir,"option.json")) as f :
        date = json.load(f)

    for d in date:
        cj_option_list.append(d["cjOption"])
        swf_option_list.append(d["swiftOption"])

    comparison_table_records =dict()

    cj_profile_result_dir_path = []
    swift_profile_result_dir_path = []
    
    for index in range(len(cj_option_list)):
        cj_profile_path = os.path.join(cjCompileResDir,cj_option_list[index].replace(" ","").strip()+"_profile")
        if os.path.exists(cj_profile_path) and os.path.exists(os.path.join(cj_profile_path,"Cangjie_compilation_efficiency_table.csv")):
            cj_profile_result_dir_path.append(cj_profile_path)
        else:
            cj_profile_result_dir_path.append("")
            logger.info(f'cj csv not exists: [{os.path.join(cj_profile_path,"Cangjie_compilation_efficiency_table.csv")}]')
        
        swift_profile_path = os.path.join(swiftCompileResDir,swf_option_list[index].replace(" ","").strip()+"_profile")
        if os.path.exists(swift_profile_path) and os.path.exists(os.path.join(swift_profile_path,"Swift_compilation_efficiency_table.csv")):
            swift_profile_result_dir_path.append(swift_profile_path)
        else:
            swift_profile_result_dir_path.append("")
            logger.info(f'swift csv not exists: [{os.path.join(swift_profile_path,"Swift_compilation_efficiency_table.csv")}]')
    
    merge_csv(cj_csv_list,swift_csv_list)

    # 这里逐个读取csv文件，然后累加
    for index in range(len(cj_option_list)):
        cj_json = os.path.join(cj_profile_result_dir_path[index],"profile.json")
        cj_csv = os.path.join(cj_profile_result_dir_path[index],"Cangjie_compilation_efficiency_table.csv")

        swift_json = os.path.join(swift_profile_result_dir_path[index],"profile.json")
        swift_csv = os.path.join(cj_profile_result_dir_path[index],"Cangjie_compilation_efficiency_table.csv")
        #swift_csv = os.path.join(swift_profile_result_dir_path[index],"Swift_compilation_efficiency_table.csv")

        if cj_profile_result_dir_path[index] == "" or swift_profile_result_dir_path[index] == "":
            logger.infot(f"cj or swift profile is empty:[{cj_profile_result_dir_path[index]},{swift_profile_result_dir_path[index]}]")
            continue

        cj_config = get_config_from(cj_json)
        swift_config = get_config_from(swift_json)

        if cj_config != swift_config:
            logger.info("stop！")
        
        cj_compilation_efficiency_table = pd.read_csv(cj_csv)

        cangjie_compilation_time = cj_compilation_efficiency_table['Cangjie Compilation Time(s)'].sum()
        cangjie_source_size = cj_compilation_efficiency_table['Cangjie Source Size(loc)'].sum()
        cangjie_compilation_efficiency = cangjie_compilation_time / cangjie_source_size * 1000

        cangjie_peak_memory = cj_compilation_efficiency_table['Cangjie Peak Memory Usage(MB)'].max()
        cangjie_memory_efficiency = (cj_compilation_efficiency_table['Cangjie Peak Memory Usage(MB)'].sum()) / cangjie_source_size * 1000

        cangjie_peak_cpu = cj_compilation_efficiency_table['Cangjie Peak CPU Usage(%)'].max()
        cangjie_code_size = cj_compilation_efficiency_table['Cangjie Code Size(KB)'].sum()

        
        swift_compilation_efficiency_table = pd.read_csv(swift_csv)
        swift_compilation_time = swift_compilation_efficiency_table['Swift Compilation Time(s)'].sum()
        swift_source_size = swift_compilation_efficiency_table['Swift Source Size(loc)'].sum()
        swift_compilation_efficiency = swift_compilation_time / swift_source_size * 1000

        swift_peak_memory = swift_compilation_efficiency_table['Swift Peak Memory Usage(MB)'].max()
        swift_memory_efficiency = (swift_compilation_efficiency_table['Swift Peak Memory Usage(MB)'].sum()) / swift_source_size * 1000
        
        swift_peak_cpu = swift_compilation_efficiency_table['Swift Peak CPU Usage(%)'].max()
        swift_code_size = cj_compilation_efficiency_table['Swift Code Size(KB)'].sum()

        comparison_table_records[cj_config] = {
            'Cangjie Compilation Efficiency(s/kloc)': cangjie_compilation_efficiency,
            'Swift Compilation Efficiency(s/kloc)': swift_compilation_efficiency,
            'Cangjie Peak Memory(MB)': cangjie_peak_memory,
            'Swift Peak Memory(MB)': swift_peak_memory,
            'Cangjie Memory Efficiency(MB/kloc)': cangjie_memory_efficiency,
            'Swift Memory Efficiency(MB/kloc)': swift_memory_efficiency,
            'Cangjie Compilation Time(s)': cangjie_compilation_time,
            'Swift Compilation Time(s)': swift_compilation_time,
            'Cangjie Source Size(loc)': cangjie_source_size,
            'Swift Source Size(loc)': swift_source_size,
            'Cangjie Peak CPU(%)': cangjie_peak_cpu,
            'Swift Peak CPU(%)': swift_peak_cpu,
            'Cangjie Code Size(KB)': cangjie_code_size,
            'Swift Code Size(KB)': swift_code_size
        }

    comparison_table = pd.DataFrame.from_dict(comparison_table_records, orient='index', columns=comparison_table_header)
    # 生成总表
    comparison_table_file_path = os.path.join(os.path.join(cjCompileResDir,".."), 'comparison.csv')
    comparison_table.to_csv(comparison_table_file_path)


def parse_command_line_arguments():
    parser = argparse.ArgumentParser()
    # this is the timestamp identified by CPLTP platform.
    parser.add_argument('--timestamp', dest='timestamp', type=str)
    # this directory is supposed to contain one to many benchmark run results, directory name of each being a timestamp.
    parser.add_argument('--benchmark-batch-result-dir-path', dest='cjCompileResDir', type=str)
    parser.add_argument('--benchmark_result_dir_path', dest='benchmark_result_dir_path', type=str)
    parser.add_argument('--table-root-path', dest='table_root_path', type=str)
    return parser.parse_args()


# filePath:
# /home/jenkins/workspace/PROJECT/CJ-Arkworkload/result/1014/swiftCompileRes/-j16_profile/Swift_compilation_efficiency_table.csv
# /home/jenkins/workspace/PROJECT/CJ-Arkworkload/result/1014/cjCompileRes/-O0-j16_profile/Cangjie_compilation_efficiency_table.csv
# get additional_options and config
# 'cangjie_additional_options is: {}\n swift_additional_options is: {}'.format(cangjie_additional_options, swift_additional_options)
def get_addtion_options_config(scriptDir,csvPath):
    if "swiftCompileRes" not in csvPath and "cjCompileRes" not in csvPath:
        additional_options = "my summary"
        return additional_options

    cj_option_list = []
    swf_option_list = []
    with open(os.path.join(scriptDir,"option.json")) as f :
            date = json.load(f)

    for d in date:
        cj_option_list.append(d["cjOption"].replace(" ","").strip())
        swf_option_list.append(d["swiftOption"].replace(" ","").strip())

    cur_option = csvPath.split("/")[-2].split("_profile")[0]

    swift_additional_options = ""
    cangjie_additional_options = ""

    if "swiftCompileRes" in csvPath:
        swift_additional_options = cur_option.replace("-" , " -")
        cangjie_additional_options = cj_option_list[swf_option_list.index(cur_option)].replace("-" , " -")
    else:
        cangjie_additional_options = cur_option.replace("-" , " -")
        swift_additional_options = swf_option_list[cj_option_list.index(cur_option)].replace("-" , " -")
    
    if " -apc" in cangjie_additional_options:
        cangjie_additional_options = cangjie_additional_options.replace(" -apc","-apc")
    
    if "- -" in swift_additional_options:
        swift_additional_options = swift_additional_options.replace("- -","--")

    additional_options = 'cangjie_additional_options is: {} --no-sub-pkg\nswift_additional_options is: {}'.format(cangjie_additional_options, swift_additional_options)
    
    profile_json_path = os.path.join(csvPath[:csvPath.rfind('/')],"profile.json")
    config = get_config_from(profile_json_path)

    return additional_options,config


def upload_csv(csv_list,scriptDir):
    #table_root_path = arguments.table_root_path
    timestamp = int(datetime.datetime.now().strftime('%Y%m%d%H%M'))
    table_root_path = "x86/CJCF-Bench(算法级)/CJ-ArkWorkload-Compile"

    # 这里上传总表
    if len(csv_list) == 1 and  ".." in csv_list[0] :
        subprocess.run(['python3', '{}/table_uploader.py'.format(scriptDir),
                    '--table-file-path={}'.format(csv_list[0]),
                    '--table-path={}/comparison'.format(table_root_path),
                    '--timestamp={}'.format(timestamp),
                    '--summary={}'.format("my summary"),
                    '--version-json-file-path={}'.format(os.path.join(scriptDir,"version.json"))])
        return

    for csvPath in csv_list:
        additional_options,config = get_addtion_options_config(scriptDir,csvPath)
        subprocess.run(['python3', '{}/table_uploader.py'.format(scriptDir),
                        '--table-file-path={}'.format(csvPath),
                        '--table-path={}/{}/compilation_efficiency'.format(table_root_path, config),
                        '--timestamp={}'.format(timestamp),
                        '--summary={}'.format(additional_options),
                        '--version-json-file-path={}'.format(os.path.join("/home/jenkins/workspace/workspace/CJ-ArkWorkload-Compile/Cangjie/","version_B010.json"))])


def merge_csv(cj_csv_list,swift_csv_list):
    for cj_csv in cj_csv_list:
        cj_option = cj_csv.split("/")[-2].split("_profile")[0]
        addtion_string = get_addtion_options_config(scriptDir,cj_csv)[0]
        swift_option = addtion_string.split(":")[-1].strip().replace(" ","")
        swift_csv = cj_csv.replace("cjCompileRes","swiftCompileRes").replace("Cangjie_","Swift_").replace(cj_option,swift_option)
        # 将swift中的列赋值到cj中
        df_cj = pd.read_csv(cj_csv)
        df_swift = pd.read_csv(swift_csv)
        for i in range(len(compilation_efficiency_table_header)//2):
            df_swift = df_swift.drop(compilation_efficiency_table_header[i*2], axis=1)
            df_cj = df_cj.drop(compilation_efficiency_table_header[i*2+1], axis=1)
        df_cj = df_cj.merge(df_swift, on='Unnamed: 0')
        # df_cj["Swift Compilation Efficiency(s/kloc)"] = df_swift["Swift Compilation Efficiency(s/kloc)"]
        # df_cj["Swift Source Size(loc)"] = df_swift["Swift Source Size(loc)"]
        # df_cj["Swift Compilation Time(s)"] = df_swift["Swift Compilation Time(s)"]
        # df_cj["Swift Average CPU Usage(%)"] = df_swift["Swift Average CPU Usage(%)"]
        # df_cj["Swift Peak CPU Usage(%)"] = df_swift["Swift Peak CPU Usage(%)"]
        # df_cj["Swift Average Memory Usage(MB)"] = df_swift["Swift Average Memory Usage(MB)"]
        # df_cj["Swift Peak Memory Usage(MB)"] = df_swift["Swift Peak Memory Usage(MB)"]
        # df_cj["Swift Code Size(KB)"] = df_swift["Swift Code Size(KB)"]
        df_cj.to_csv(cj_csv,index=False)

def main():
    #scriptDir = os.path.dirname(os.path.abspath(__file__))
    workDIR = os.path.abspath(os.path.join(scriptDir,"../.."))
    dailyResDir = os.path.join(workDIR,"result")
    cjCompileResDir = os.path.join(dailyResDir,"cjCompileRes")
    swiftCompileResDir = os.path.join(dailyResDir,"swiftCompileRes")

    # cjCompileResDir = arguments.cjCompileResDir
    # timestamp = arguments.timestamp

    # 生成每一张表
    cj_csv_list = generate_tables(cjCompileResDir)
    swift_csv_list = generate_tables(swiftCompileResDir)
    generate_summary_tables(scriptDir,cjCompileResDir,swiftCompileResDir, cj_csv_list, swift_csv_list)
    
    # 合并对应的表
    # merge_csv(cj_csv_list,swift_csv_list)

    
    # upload all the tables.
    upload_csv(cj_csv_list,scriptDir)
    

    #上传总表
    comparison_table_file_path = [os.path.join(cjCompileResDir,"..",'comparison.csv')]
    upload_csv(comparison_table_file_path,scriptDir)
    


if __name__ == '__main__':
    """
    arguments = parse_command_line_arguments()
    main()
    """
    main()
