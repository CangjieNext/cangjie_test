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

def getAlltestcases(benchmarkPath): 
    """
    getAlltestcases: get all cangjie, swift and arkts testcases from dir
    """
    cjTestlist = []
    swiftTestlist = []
    arktsTestlist = []
    for path, dir_lst, file_lst in os.walk(benchmarkPath):
        for file_name in file_lst:
            if file_name.endswith(".cj"):
                cjTestlist.append(os.path.join(path, file_name))
            elif file_name.endswith(".swift"):
                swiftTestlist.append(os.path.join(path, file_name))
            elif file_name.endswith(".ts"):
                arktsTestlist.append(os.path.join(path, file_name))
    return cjTestlist, swiftTestlist, arktsTestlist

def lockCPUfreq(compileMode):
    """
    lockCPUfreq: close small-cores and big-core
    """
    if (compileMode == "ohos") or (compileMode == "hos"):
        lockCmd = ".\CJ-Arkworkload\\test\script\lock_cpu_{}.bat".format(compileMode)
        p_lock = subprocess.Popen(lockCmd, shell=True)
        p_lock.wait()
        p_lock.kill()
    elif compileMode == "native":
        pass
    else:
        print("No such Compile Mode, choose native or ohos or hos!")
        sys.exit(1)

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
        if compileMode == "native":
            compileCmd = "cjc -Woff unused -O2 " + cjTest + " " + "-o " + cjCompileResDir + "/" + cjTest.split('/')[-1][:-3] + "cj"
            print("Compiling " + cjTest.split('\\')[-1])
        elif compileMode == "ohos":
            shellCmd = "bash ./CJ-Arkworkload/test/script/cjohos.sh "
            compileCmd = shellCmd + cjTest + " " + cjCompileResDir + "/" + cjTest.split('\\')[-1][:-3] + "cj"
            print("Compiling " + cjTest.split('\\')[-1])
        elif compileMode == "hos":
            if PGOflag == "PGOFIRST":
                shellCmd = "bash ./CJ-Arkworkload/test/script/cjhos.sh {} ".format(PGOflag)
                compileCmd = shellCmd + cjTest + " " + cjCompileResDir + "/" + cjTest.split('/')[-1][:-3] + "cj"
            elif PGOflag == "PGOSECOND":
                shellCmd = "bash ./CJ-Arkworkload/test/script/cjhos.sh {} ".format(PGOflag)
                compileCmd = shellCmd + cjProfdataResDir + "/" + cjTest.split('/')[-1][:-3] + "cj.profdata " + cjTest + " " + cjCompileResDir + "/" + cjTest.split('/')[-1][:-3] + "cj"
            elif PGOflag == "CLOSED":
                shellCmd = "bash ./CJ-Arkworkload/test/script/cjhos.sh CLOSED "
                compileCmd = shellCmd + cjTest + " " + cjCompileResDir + "/" + cjTest.split('/')[-1][:-3] + "cj"
            # print(compileCmd)
            # compileCmd = shellCmd + cjTest + " " + cjCompileResDir + "/" + cjTest.split('/')[-1][:-3] + "cj"
            print("Compiling " + cjTest.split('\\')[-1])
        else:
            print("No such Compile Mode, choose native or ohos or hos!")
            sys.exit(1)
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
    # Clean cjCompileResDir: No .cached and cjo file
    for outputFile in os.scandir(cjCompileResDir):
        if not outputFile.name.endswith("cj"):
            if outputFile.is_dir():
                shutil.rmtree(os.path.join(outputFile))
            elif outputFile.is_file():
                os.remove(os.path.join(outputFile))

def runCjPGOTestcasefirsttime():
    if not os.path.exists(cjCompileResDir):
        sys.exit(1)
    # Keep cjCompileResDir clean
    if os.path.exists(cjProfdataResDir):
        shutil.rmtree(cjProfdataResDir)
    os.mkdir(cjProfdataResDir)

    # run cjtestcase first time and pull profraw file
    for cjTestcase in os.scandir(cjCompileResDir):
        # File send & chmod & run
        pushCmd = "adb push " + os.path.join(cjTestcase) + " /data/local/tmp"
        chmodCmd = "adb shell chmod a+x /data/local/tmp/" + cjTestcase.name

        profRawCmd = 'LLVM_PROFILE_FILE="{0}.profraw" ./{0}'.format(cjTestcase.name)
        profilingCmd = 'adb shell "cd /data/local/tmp && LD_LIBRARY_PATH=/data/local/tmp  cjHeapSize=512MB ' + profRawCmd + '"'
        pullCmd = "adb pull /data/local/tmp/{0}.profraw ".format(cjTestcase.name) + cjProfdataResDir
        AllCmd = pushCmd + " & " + chmodCmd + " & " + profilingCmd + " & " + pullCmd
        # print(AllCmd)
        p = subprocess.Popen(AllCmd, stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT,
                                    shell=True)
        p.wait()
        p.kill()

def runCjPGOTestcasesecondtime():
    return runCjTestcase()

def runCjPGOTestcaseProf():
    # Keep cjProfrawResDir & cjProfdataResDir clean
    if os.path.exists(cjProfdataResDir):
        shutil.rmtree(cjProfdataResDir)
    os.mkdir(cjProfdataResDir)

    # transfer profraw to profdata file
    for cjProfraw in os.scandir(cjProfrawResDir):
        # File send & chmod & run
        shellCmd = "bash ./CJ-Arkworkload/test/script/cjhos.sh TransProfdata "
        AllCmd = shellCmd + os.path.join(cjProfraw) + ' ' + cjProfdataResDir + '/' +cjProfraw.name[:-8] + '.profdata'
        # print(AllCmd)
        p = subprocess.Popen(AllCmd, stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT,
                                    shell=True)
        p.wait()
        p.kill()

def compileSwiftTestcase(swiftTestlist):
    """
    compileSwiftTestcase: complie swift testcases to output dir
    """
    # Keep cjCompileResDir clean
    if os.path.exists(swiftCompileResDir):
        shutil.rmtree(swiftCompileResDir)
    os.mkdir(swiftCompileResDir)
    # START compile cjTestCases
    for swiftTest in swiftTestlist:
        if compileMode == "native":
            compileCmd = "swiftc -O -whole-module-optimization " + swiftTest + " " + "-o " + swiftCompileResDir + "/" + swiftTest.split('/')[-1][:-6] + "swift"
        elif compileMode == "hos":
            shellCmd = "bash ./CJ-Arkworkload/test/script/cswiftc.sh "
            compileCmd = shellCmd + swiftTest + " " + swiftCompileResDir + "/" + swiftTest.split('/')[-1][:-6] + "swift"
        else:
            print("No such Compile Mode, choose native or crossTohos!")
            sys.exit(1)
        print("Compiling " + swiftTest + " Testcase!")
        p = subprocess.Popen(compileCmd, shell=True)
        p.wait()
        p.kill()

def runCjTestcase():
    if not os.path.exists(cjCompileResDir):
        sys.exit(1)
    # Lock CPU freq
    lockCPUfreq(compileMode)
    # Start running testcases
    testcase_result_frame = []
    for count in range(3):
        testcase_title_lst = []
        testcase_result_lst = []
        for cjTestcase in os.scandir(cjCompileResDir):
            if compileMode == "native":
                p = subprocess.Popen('./' + os.path.join(cjTestcase), stdout=subprocess.PIPE,
                                                                    stderr=subprocess.STDOUT,
                                                                    shell=True)
            elif compileMode == "ohos":
                # File send & chmod & run
                pushCmd = "hdc_std shell mount -o rw,remount -t auto / & hdc_std file send " + os.path.join(cjTestcase) + " /system/lib64"
                chmodCmd = "hdc_std shell chmod a+x /system/lib64/" + cjTestcase.name
                runCmd = "hdc_std shell  /system/lib64/" + cjTestcase.name
                AllCmd = pushCmd + ' & ' + chmodCmd + ' & ' + runCmd
                # Start running testcase and send back result
                p = subprocess.Popen(AllCmd, stdout=subprocess.PIPE,
                                             stderr=subprocess.STDOUT,
                                             shell=True)
            elif compileMode == "hos":
                # File send & chmod & run
                pushCmd = "adb push " + os.path.join(cjTestcase) + " /data/local/tmp"
                chmodCmd = "adb shell chmod a+x /data/local/tmp/" + cjTestcase.name
                runCmd = 'adb shell "cd /data/local/tmp && LD_LIBRARY_PATH=/data/local/tmp cjHeapSize=512MB /data/local/tmp/' + cjTestcase.name + '"'
                AllCmd = pushCmd + ' & ' + chmodCmd + ' & ' + runCmd
                # Start running testcase and send back result
                p = subprocess.Popen(AllCmd, stdout=subprocess.PIPE,
                                             stderr=subprocess.STDOUT,
                                             shell=True)
            testcase_title_lst, testcase_result_lst = get_Testesult(p, cjTestcase, testcase_title_lst, testcase_result_lst, lang = "Cangjie")
        # testcase_result_frame: [title, result0, result1, result2]-Transfer
        if count == 0:
            testcase_result_frame.append(testcase_title_lst)
        testcase_result_frame.append(testcase_result_lst)
    # testcase_result_frame: [title, result0, result1, result2]
    testcase_result_frame = list(zip(testcase_result_frame[0], testcase_result_frame[1], testcase_result_frame[2], testcase_result_frame[3]))
    # Write to csv file
    with open(cjCompileResDir + '/CjResult.csv', 'w+', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(testcase_result_frame)

def runSwiftTestcase():
    if not os.path.exists(swiftCompileResDir):
        sys.exit(1)
    # Lock CPU freq
    lockCPUfreq(compileMode)
    # Start running testcases
    testcase_result_frame = []
    for count in range(3):
        testcase_title_lst = []
        testcase_result_lst = []
        for swiftTestcase in os.scandir(swiftCompileResDir):
            if compileMode == "native":
                p = subprocess.Popen('./' + os.path.join(swiftTestcase), stdout=subprocess.PIPE,
                                                                        stderr=subprocess.STDOUT,
                                                                        shell=True)
            elif compileMode == "hos":
                # File send & chmod & run
                pushCmd = "adb push " + os.path.join(swiftTestcase) + " /data/local/tmp"
                chmodCmd = "adb shell chmod a+x /data/local/tmp/" + swiftTestcase.name
                runCmd = "adb shell LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/" + swiftTestcase.name
                AllCmd = pushCmd + ' & ' + chmodCmd + ' & ' + runCmd
                # Start running testcase and send back result
                p = subprocess.Popen(AllCmd, stdout=subprocess.PIPE,
                                             stderr=subprocess.STDOUT,
                                             shell=True)
            testcase_title_lst, testcase_result_lst = get_Testesult(p, swiftTestcase, testcase_title_lst, testcase_result_lst, lang = "Swift")
            # testcase_result_frame: [title, result0, result1, result2]-Transfer
        if count == 0:
            testcase_result_frame.append(testcase_title_lst)
        testcase_result_frame.append(testcase_result_lst)
    # testcase_result_frame: [title, result0, result1, result2]
    testcase_result_frame = list(zip(testcase_result_frame[0], testcase_result_frame[1], testcase_result_frame[2], testcase_result_frame[3]))
    # Write to csv file
    with open(swiftCompileResDir + '/SwiftResult.csv', 'w+', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(testcase_result_frame)

def runArkTsTestcase(arktsTestlist):
    """
    We do not compile the *.ts to *.abc locally
    but get the compile-results(abc, an, ai, ap) from gitee
    https://gitee.com/li-xingfu-1/ark_benchmark_daily/tree/master/workload-1/aot_build
    """
    if not os.path.exists(arkTsCompileResDir):
        sys.exit(1)
    # Lock CPU freq
    lockCPUfreq(compileMode)
    # Start running testcases
    testcase_result_frame = []
    for count in range(3):
        testcase_title_lst = []
        testcase_result_lst = []
        for ArkTsTestcase in os.scandir(arkTsCompileResDir):
            # Filter *.abc file from arkTsCompileResDir
            if not os.path.join(ArkTsTestcase).endswith(".abc"):
                continue
            if compileMode == "native":
                # Todo in the future
                pass
            elif compileMode == "hos":
                # File send & chmod & run
                chmodvmCmd = "adb shell chmod a+x /data/local/tmp/ark_js_vm"
                pushabcCmd = "adb push " + os.path.join(ArkTsTestcase)[:-4] + ".abc" + " /data/local/tmp"
                pushaiCmd = "adb push " + os.path.join(ArkTsTestcase)[:-4] + ".ai" +" /data/local/tmp"
                pushanCmd = "adb push " + os.path.join(ArkTsTestcase)[:-4] + ".an" +" /data/local/tmp"
                pushapCmd = "adb push " + os.path.join(ArkTsTestcase)[:-4] + ".ap" +" /data/local/tmp"
                runCmd = 'adb shell "cd /data/local/tmp && LD_LIBRARY_PATH=/data/local/tmp /data/local/tmp/ark_js_vm --aot-file={0} --entry-point={0} {0}.abc"'.format(ArkTsTestcase.name[:-4])
                AllCmd = chmodvmCmd + ' & ' + pushabcCmd + ' & ' + pushaiCmd + ' & ' + pushanCmd + ' & ' + pushapCmd + ' & ' + runCmd
                # Start running testcase and send back result
                p = subprocess.Popen(AllCmd, stdout=subprocess.PIPE,
                                             stderr=subprocess.STDOUT,
                                             shell=True)
            testcase_title_lst, testcase_result_lst = get_Testesult(p, ArkTsTestcase, testcase_title_lst, testcase_result_lst, lang = "ArkTs")
            # testcase_result_frame: [title, result0, result1, result2]-Transfer
        if count == 0:
            testcase_result_frame.append(testcase_title_lst)
        testcase_result_frame.append(testcase_result_lst)
    # testcase_result_frame: [title, result0, result1, result2]
    testcase_result_frame = list(zip(testcase_result_frame[0], testcase_result_frame[1], testcase_result_frame[2], testcase_result_frame[3]))
    # Write to csv file
    with open(arkTsCompileResDir + '/ArkTsResult.csv', 'w+', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(testcase_result_frame)

def get_Testesult(p, testcase, testcase_title_lst, testcase_result_lst, lang):
    # Record TestResult to csv
    p_stdouts = p.stdout.readlines()
    for p_stdout in p_stdouts:
        testcase_resAll = p_stdout.decode('utf-8').strip()
        if "Exception" in testcase_resAll:
            testcase_title = testcase.name
            testcase_result = str(-65535)
            testcase_title_lst.append(testcase_title)
            testcase_result_lst.append(testcase_result)
            print("Running " + os.path.join(testcase) + " Failed! " + testcase_title + " " + testcase_result)
            continue
        elif '\tms' in p_stdout.decode('utf-8').strip():
            testcase_title = testcase_resAll.split('\t')[0].strip()[:-1].strip()
            testcase_result = testcase_resAll.split('\t')[1].strip()
            testcase_title_lst.append(testcase_title)
            testcase_result_lst.append(testcase_result)
            print(testcase_title + ' ' +testcase_result)
        elif ' ms = ' in p_stdout.decode('utf-8').strip():
            # print(p_stdout)
            testcase_title = testcase_resAll.split('ms = ')[0].strip()[:-1].strip()
            testcase_result = testcase_resAll.split('ms = ')[1].strip()
            testcase_title_lst.append(testcase_title)
            testcase_result_lst.append(testcase_result)
            print(testcase_title + ' ' +testcase_result)

    p.wait()
    p.kill()
    time.sleep(0.5)
    return testcase_title_lst, testcase_result_lst

if __name__ == "__main__":
    # Choose compileMode: native & ohos & hos
    compileMode = sys.argv[1]
    cjCompileResDir = './CJ-Arkworkload/test/cjCompileRes'
    swiftCompileResDir = './CJ-Arkworkload/test/swiftCompileRes'
    arkTsCompileResDir = './CJ-Arkworkload/test/arkTsCompileRes'
    cjProfrawResDir = './CJ-Arkworkload/test/cjProfrawRes'
    cjProfdataResDir = './CJ-Arkworkload/test/cjProfdataRes'
    # Get Testlist from CJ-Arkworkload
    cjTestlist, swiftTestlist, arktsTestlist = getAlltestcases('./CJ-Arkworkload')
    # Run Cangjie Testcases
    # compileCjTestcase(cjTestlist)
    runCjTestcase()
    # Run Swift Testcases
    # compileSwiftTestcase(swiftTestlist)
    # runSwiftTestcase()

    # Run ArkTs Testcases
    # runArkTsTestcase(arktsTestlist)

    # Run Cangjie PGO Testcases
    # compileCjTestcase(cjTestlist, "PGOFIRST")
    # runCjPGOTestcasefirsttime()
    # runCjPGOTestcaseProf()
    # compileCjTestcase(cjTestlist, "PGOSECOND")
    # runCjPGOTestcasesecondtime()