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
import logging
import json

logger = logging.getLogger(__name__)

def getAlltestcases(benchmarkPath): 
    """
    getAlltestcases: get all cangjie, swift and arkts testcases from dir
    """
    cjTestlist = []
    swiftTestlist = []
    for path, dir_lst, file_lst in os.walk(benchmarkPath):
        for file_name in file_lst:
            if file_name.endswith(".cj") and remove_folder(os.path.join(path, file_name)):
                cjTestlist.append(os.path.join(path, file_name))
            elif file_name.endswith(".swift") and remove_folder(file_name):
                swiftTestlist.append(os.path.join(path, file_name))
    return cjTestlist, swiftTestlist

def remove_folder(file_name):
    if "zlib" in file_name:
        return False
    elif "cjds" in file_name:
        return False
    elif "basic" in file_name:
        return False
    elif "OfflineAssembler" in file_name:
        return False
    elif "babylon" in file_name:
        return False
    elif "box2d" in file_name:
        return False
    elif "mandreel" in file_name:
        return False
    return True


def compileCjTestcase(cjTestlist, cjTestlistMulti, outputNameList, option, mode):
    """
    compileCjTestcase: complie cangjie testcases to output dir
    """

    compiler = ""
    cloc_config_name = ""
    profile_path = ""
    product_path = ""
    if ".cj" in cjTestlist[0]:
        compiler = "cjc -Woff unused "
        cloc_config_name = "cangjie.config"
        profile_path = cj_profile_path
        product_path = cj_product_path
    else: 
        compiler = "swiftc "
        cloc_config_name = "swift.config"
        profile_path = swf_profile_path
        product_path = swf_product_path
    benchmark_profile = {
        "additional_options": ''.join(option),
        'config_name': mode,
    }

    testcases = list()

    # get profile.json
    for cjTest in cjTestlist:
        cj_name = cjTest.split("/")[-1].strip()
        file_name = cj_name.split(".")[0].strip()
        compile_product_path = os.path.join(product_path,file_name)
        compile_product_name = os.path.join(compile_product_path,file_name)


        compileCmd = compiler + option + cjTest + " -o " + compile_product_name
        psutil_result_file_name = cj_name + ".psutil.prof"
        psutil_result_file_path = os.path.join(profile_path,psutil_result_file_name)
        mkDir(compile_product_path)
        cmd = 'python3 {}/psutil_profiler.py --command=\"{}\" --cwd={} --output={}'.format(
            scriptDir, compileCmd, compile_product_path, psutil_result_file_path
        )

        cloc_result_file_name = cj_name + ".cloc.prof"
        cloc_result_file_path = os.path.join(profile_path,cloc_result_file_name)
        cloc_command = 'cloc --read-lang-def={} --json --out=\"{}\"'.format(
            os.path.join(scriptDir, cloc_config_name), cloc_result_file_path)
        cloc_command += ' {}'.format(''.join(cjTest))

        testcase = {
            'name': cj_name,
            'command': compileCmd,
            'sources': cjTest,
            'compile_product_name': compile_product_name,
            'cloc_command': cloc_command,
            'psutil_command': cmd
        }
        testcases.append(testcase)

    testcases = compileCjTestcaseMultiFile(cjTestlistMulti, outputNameList, option, testcases)

    benchmark_profile['testcases'] = testcases    
    benchmark_profile_file_name = 'profile.json'
    benchmark_profile_file_path = os.path.join(profile_path, benchmark_profile_file_name)
    
    with open(benchmark_profile_file_path, 'w') as benchmark_profile_file:
        json.dump(benchmark_profile, benchmark_profile_file, indent=4)
    
    execute(profile_path)


def compileCjTestcaseMultiFile(cjTestlist, outputNameList, option, testcases):
    """
    compileCjTestcase: complie cangjie testcases to output dir
    """

    compiler = ""
    cloc_config_name = ""
    profile_path = ""
    product_path = ""
    end_name = ""
    if ".cj" in cjTestlist[0]:
        compiler = "cjc -Woff unused "
        cloc_config_name = "cangjie.config"
        profile_path = cj_profile_path
        product_path = cj_product_path
        end_name = ".cj"
    else: 
        compiler = "swiftc "
        cloc_config_name = "swift.config"
        profile_path = swf_profile_path
        product_path = swf_product_path
        end_name = ".swift"

    # get profile.json
    for i in range(len(cjTestlist)):
        cjTest = cjTestlist[i]
        cj_name = outputNameList[i] + end_name
        file_name = outputNameList[i]
        compile_product_path = os.path.join(product_path,file_name)
        compile_product_name = os.path.join(compile_product_path,file_name)

        compileCmd = compiler + option + cjTest + " -o " + compile_product_name
        psutil_result_file_name = cj_name + ".psutil.prof"
        psutil_result_file_path = os.path.join(profile_path,psutil_result_file_name)
        mkDir(compile_product_path)
        cmd = 'python3 {}/psutil_profiler.py --command=\"{}\" --cwd={} --output={}'.format(
            scriptDir, compileCmd, compile_product_path, psutil_result_file_path
        )

        cloc_result_file_name = cj_name + ".cloc.prof"
        cloc_result_file_path = os.path.join(profile_path,cloc_result_file_name)
        cloc_command = 'cloc --read-lang-def={} --json --out=\"{}\"'.format(
            os.path.join(scriptDir, cloc_config_name), cloc_result_file_path)
        cloc_command += ' {}'.format(''.join(cjTest))

        testcase = {
            'name': cj_name,
            'command': compileCmd,
            'sources': cjTest,
            'compile_product_name': compile_product_name,
            'cloc_command': cloc_command,
            'psutil_command': cmd
        }
        testcases.append(testcase)

    return testcases


def execute(profile_path, jsonName="profile.json"):
    benchmark_profile_file_path = os.path.join(profile_path, jsonName)
    with open(benchmark_profile_file_path, 'r') as benchmark_profile_file:
        benchmark = json.load(benchmark_profile_file)
        testcases = benchmark['testcases']
        number_of_testcases = len(testcases)
        executed_testcases_count = 0
        for testcase in testcases:
            executed_testcases_count += 1
            testcase_name = testcase['name']
            logger.info(
                'executing testcase [{}], {}/{}'.format(testcase_name, executed_testcases_count, number_of_testcases))
            logger.info('command: {}'.format(testcase['command']))

            psutil_command = testcase['psutil_command']
            subprocess.run(psutil_command, shell=True)
            
            compile_product_name = testcase['compile_product_name']

            if not os.path.exists(compile_product_name):
                logger.error('option [{}],testcase [{}] failed.'.format(benchmark['additional_options'],testcase['name']))
                logger.error('command: {}'.format(testcase['command']))
                psutil_result = psutil_command.split("=")[-1]
                try:
                    os.remove(psutil_result)
                    print(psutil_result, " 文件删除成功！")
                except FileNotFoundError:
                    print(psutil_result, " 文件不存在！")
                except PermissionError:
                    print(psutil_result, " 没有权限删除文件！")
                except Exception as e:
                    print(psutil_result, " 删除时发生了错误：", e)
                continue
                """
                sys.exit(-1)
                with open(compile_product_name, 'w') as output_file:
                    output_file.write('failed')
                """
            
            cloc_command = testcase['cloc_command']
            subprocess.run(cloc_command, shell=True)


def mkDir(path):
    if not os.path.exists(path):
        resultDir = os.makedirs(path)
        logger.info('make dir {} success'.format(path))
    else:
        logger.info('{} exists'.format(path))

if __name__ == "__main__":
    # workDir
    scriptDir = os.path.dirname(os.path.abspath(__file__))
    workDIR = os.path.abspath(os.path.join(scriptDir,"../.."))

    # cjmode = [" -O2 -j1 "," -O2 -j16 "," -O0 -j1 "," -O0 -j16 "]
    # swfmode = [" -O -wmo "," -O -j16 "," -j1 "," -j16 "]

    with open(os.path.join(scriptDir,"option.json")) as f :
        date = json.load(f)
    mode_name_list = []
    cj_option_list = []
    swf_option_list = []

    for d in date:
        mode_name_list.append(d["mode"])
        cj_option_list.append(d["cjOption"])
        swf_option_list.append(d["swiftOption"])


    # Get Testlist from CJ-Arkworkload,absolute path
    cjTestlist, swiftTestlist = getAlltestcases(workDIR)

    
    # workDIR
    dailyResDir = os.path.join(workDIR,"result")
    cjCompileResDir = os.path.join(dailyResDir,"cjCompileRes")
    swiftCompileResDir = os.path.join(dailyResDir,"swiftCompileRes")

    baseDir = "/home/jenkins/workspace/workspace/CJ-ArkWorkload-Compile/testsuites/Benchmark/CJ-Arkworkload/"
    multiFileListCJ = [baseDir + "mix-case/cj/weekly/zlib/*.cj",
                       baseDir + "cjds/cj/*.cj",
                       baseDir + "mix-case/cj/weekly/basic/*.cj",
                       baseDir + "mix-case/cj/weekly/OfflineAssembler/*.cj",
                       baseDir + "babylon/cj/*.cj",
                       baseDir + "mix-case/cj/weekly/box2d/*.cj",
                       baseDir + "mix-case/cj/weekly/mandreel/mandreel_part1/*.cj " + baseDir + "mix-case/cj/weekly/mandreel/*.cj"]
    multiFileListSWIFT = [baseDir + "mix-case/swift/weekly/zlib/*.swift",
                          baseDir + "cjds/swift/*.swift ",
                          baseDir + "mix-case/swift/weekly/basic/*.swift",
                          baseDir + "mix-case/swift/weekly/OfflineAssembler/*.swift",
                          baseDir + "babylon/swift/*.swift " + baseDir + "babylon/swift/test_blob/*.swift",
                          baseDir + "mix-case/swift/weekly/box2d/*.swift",
                          baseDir + "mix-case/swift/weekly/mandreel/mandreel-part1/*.swift " + baseDir + "mix-case/swift/weekly/mandreel/*.swift"]
    multiFileOutput = ["zlib", 
                       "cjds", 
                       "basic", 
                       "OfflineAssembler", 
                       "babylon", 
                       "box2d",
                       "mandreel"]
    
    # multiFileListCJ = [baseDir + "cjds/cj/*.cj", baseDir + "babylon/cj/*.cj"]
    # multiFileListSWIFT = [baseDir + "cjds/swift/*.swift ", baseDir + "babylon/swift/*.swift " + baseDir + "babylon/swift/test_blob/*.swift"]
    # multiFileOutput = ["cjds", "babylon"]

    
    # cjTestlist = ["/home/jenkins/workspace/workspace/CJ-ArkWorkload-Compile/testsuites/Benchmark/CJ-Arkworkload/mix-case/cj/weekly/3d-raytrace.cj"]
    # swiftTestlist = ["/home/jenkins/workspace/workspace/CJ-ArkWorkload-Compile/testsuites/Benchmark/CJ-Arkworkload/mix-case/swift/weekly/3d-raytrace.swift"]


    for option in cj_option_list:
        cj_product_path = os.path.join(cjCompileResDir,option.replace(" ","").strip()+"_product")
        cj_profile_path = os.path.join(cjCompileResDir,option.replace(" ","").strip()+"_profile")
        mkDir(cj_product_path)
        mkDir(cj_profile_path)
        # Compile Cangjie Testcases
        compileCjTestcase(cjTestlist, multiFileListCJ, multiFileOutput, option, mode_name_list[cj_option_list.index(option)])

    
    for option in swf_option_list:
        swf_product_path = os.path.join(swiftCompileResDir,option.replace(" ","").strip()+"_product")
        swf_profile_path = os.path.join(swiftCompileResDir,option.replace(" ","").strip()+"_profile")
        mkDir(swf_product_path)
        mkDir(swf_profile_path)
        # Compile Cangjie Testcases
        compileCjTestcase(swiftTestlist, multiFileListSWIFT, multiFileOutput, option, mode_name_list[swf_option_list.index(option)])
    
