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
import configparser

tmp_dir = "/data/local/tmp"
hos_dir = "/data/local/tmp/shy"
oatDir = "/data/local/tmp/oat/arm64"
# java_opt = "--instruction-set=arm64 --instruction-set-features=default --instruction-set-variant=generic --compiler-filter=speed --compilation-reason=cmdline --max-image-block-size=524288 --resolve-startup-const-strings=true --generate-mini-debug-info --runtime-arg -Xtarget-sdk-version:31 --runtime-arg -Xhidden-api-policy:enabled -j4 --runtime-arg -Xms64m --runtime-arg -Xmx512m  --compact-dex-level=none"
java_opt = "--instruction-set=arm64 --instruction-set-features=default --instruction-set-variant=generic --compiler-filter=speed --compilation-reason=cmdline --max-image-block-size=524288 --resolve-startup-const-strings=true --generate-mini-debug-info --runtime-arg -Xtarget-sdk-version:31 --runtime-arg -Xhidden-api-policy:enabled -j4 --runtime-arg -Xms512m --runtime-arg -Xmx512m --compact-dex-level=none"
cjHeapSize = "cjHeapSize=512MB"
cjGCThreshold = "cjGCThreshold=20MB"
cjGCInterval = "cjGCInterval=10ms"
cjAlloctionWaitTime = "cjAlloctionWaitTime=1ms"
cjStackSize= "cjStackSize=64kb"
cjEnableGC = "cjEnableGC=0"
MRT_REPORT = "MRT_REPORT=/data/local/tmp/log.txt"
adb_command = "C:\\adb_hdb_tools\\adb.exe"
cj_dir = "./cj_result"

# case_name = ["binarytrees"]

case_param = {
    "binarytrees": "20",
    "gameoflife": "1",
    "nbody": "50000000",
    "pidigits": "10000",
    "fannkuchredux": "12",
    "fasta": "50000000",
    "mandelbrot": "50000",
    "spectralnorm": "55000"
}

def get_cangjie_files(path):
    cj_files = []
    for root, dirs, files in os.walk(path):
        for file in files:
            if file.endswith('.cj.out'):
                cj_files.append(file.split('.')[0])
    return cj_files

def get_Testesult(p, testcase, testcase_title_lst, testcase_result_lst, lang):
    # Record TestResult to csv
    p_stdouts = p.stdout.readlines()
    for p_stdout in p_stdouts:
        testcase_resAll = p_stdout.decode('utf-8').strip()
        print(testcase_resAll)
        if "Exception" in testcase_resAll:
            print("Running " + os.path.join(testcase) + " Failed!")
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
    pushCmd = "{} push cj_result.tar ".format(adb_command) + os.path.join(hos_dir)
    pushCmd += " & {} push java_result.tar ".format(adb_command) + os.path.join(hos_dir)
    pushCmd += " & {} push run_sh/cj_smap_harmonyos.sh ".format(adb_command) + os.path.join(hos_dir)
    pushCmd += " & {} push run_sh/java_smap_harmonyos.sh ".format(adb_command) + os.path.join(hos_dir)
    pushCmd += " & {} shell tar -xf ".format(adb_command) + os.path.join(hos_dir) + "/cj_result.tar -C " + os.path.join(hos_dir)
    pushCmd += " & {} shell tar -xf ".format(adb_command) + os.path.join(hos_dir) + "/java_result.tar -C " + os.path.join(hos_dir)
    pushCmd += " & {} shell chmod -R 777 ".format(adb_command) + os.path.join(hos_dir) + "/*"
    pushCmd += " & {} shell mkdir /data/local/tmp/oat"
    pushCmd += " & {} shell mkdir /data/local/tmp/oat/arm64"
    push_p = subprocess.Popen(pushCmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    output, error = push_p.communicate()
    # 打印执行结果
    print(output.decode('gbk'))

    case_name = get_cangjie_files(cj_dir)

    testcase_result_frame = []
    testcase_title_lst = []
    testcase_result_lst = []

    # 执行cj
    for key in case_name:
        key_param = "0"
        if key in case_param:
            key_param = case_param[key]

        # runCmd = "{} shell LD_LIBRARY_PATH={} {}  {} {}/cj_smap_harmonyos.sh {}/cj_result/{}.cj.out {} {}/smaps_data {} cj" .format(
        #         adb_command, tmp_dir, cjHeapSize, MRT_REPORT ,hos_dir, hos_dir, key, key_param, hos_dir, key)

        # 获取内存 + 执行时间
        runCmd = "{} shell LD_LIBRARY_PATH={} {} {}/cj_smap_harmonyos.sh {}/cj_result/{}.cj.out {} {}/smaps_data {} cj" .format(
                adb_command, tmp_dir, cjHeapSize, hos_dir, hos_dir, key, key_param, hos_dir, key)

        # 仅获取执行时间
        # runCmd = "{} shell LD_LIBRARY_PATH={} {} {}/cj_result/{}.cj.out {}" .format(
        #          adb_command, tmp_dir, cjHeapSize, hos_dir, key, key_param)

        print(runCmd)
        run_p = subprocess.Popen(runCmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)
        # output, error = run_p.communicate()
        # print(output.decode('gbk'))
        testcase_title_lst, testcase_result_lst = get_Testesult(run_p, key, testcase_title_lst, testcase_result_lst, lang = "Cangjie")

    testcase_result_frame.append(testcase_title_lst)
    testcase_result_frame.append(testcase_result_lst)
    testcase_result_frame = list(zip(testcase_result_frame[0], testcase_result_frame[1]))

    with open('CjResult.csv', 'w+', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(testcase_result_frame)


    testcase_result_frame = []
    testcase_title_lst = []
    testcase_result_lst = []
    
    # 执行java
    for key in case_name:
        key_param = "0"
        if key in case_param:
            key_param = case_param[key]

        # 示例代码：/system/bin/dex2oat --dex-file=/data/local/tmp/classes.dex --oat-file=/data/local/tmp/oat/arm64/classes.odex --instruction-set=arm64 --instruction-set-features=default --instruction-set-variant=generic --compiler-filter=speed --compilation-reason=cmdline --max-image-block-size=524288 --resolve-startup-const-strings=true --generate-mini-debug-info --runtime-arg -Xtarget-sdk-version:31 --runtime-arg -Xhidden-api-policy:enabled -j4 --runtime-arg -Xms64m --runtime-arg -Xmx512m  --compact-dex-level=none
        runCmd = "{} shell cp {}/java_result/{}/classes.dex {} & {} shell /system/bin/dex2oat --dex-file={}/classes.dex --oat-file={}/classes.odex {}".format(
                 adb_command, hos_dir, key, tmp_dir, adb_command, tmp_dir, oatDir, java_opt)
        print(runCmd)
        run_p = subprocess.Popen(runCmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)
        output, error = run_p.communicate()
        print(output.decode('gbk'))

        # # 获取内存 + 执行时间
        runCmd = "{} shell {}/java_smap_harmonyos.sh CLASSPATH=/data/local/tmp/java_lib/gson/classes.dex:/data/local/tmp/java_lib/okhttp/classes.dex:/data/local/tmp/java_lib/okio/classes.dex:{}/classes.dex app_process {} {} {} {}/smaps_data/{} java".format(
                 adb_command, hos_dir, tmp_dir, tmp_dir, key, key_param, hos_dir, key)

        # 仅获取执行时间：CLASSPATH=/data/local/tmp/classes.dex app_process /data/local/tmp MemoryCase1
        # 带okhttp版本：CLASSPATH=/data/local/tmp/classes.dex:/data/local/tmp/java_lib/gson/classes.dex:/data/local/tmp/java_lib/okhttp/classes.dex:/data/local/tmp/java_lib/okio/classes.dex app_process /data/local/tmp BenchmarkGetHttp
        # runCmd = "{} shell CLASSPATH=/data/local/tmp/java_lib/okhttp/classes.dex:/data/local/tmp/java_lib/okio/classes.dex:{}/classes.dex app_process {} {} {}".format(
        #          adb_command, tmp_dir, tmp_dir, key, key_param)
        print(runCmd)
        run_p = subprocess.Popen(runCmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)
        # output, error = run_p.communicate()
        # print(output.decode('gbk'))

        testcase_title_lst, testcase_result_lst = get_Testesult(run_p, key, testcase_title_lst, testcase_result_lst, lang = "Java")

    testcase_result_frame.append(testcase_title_lst)
    testcase_result_frame.append(testcase_result_lst)
    testcase_result_frame = list(zip(testcase_result_frame[0], testcase_result_frame[1]))

    with open('JavaResult.csv', 'w+', newline='') as f:
        writer = csv.writer(f)
        writer.writerows(testcase_result_frame)
        

    
    tarCmd = "{} shell tar -cf {}/smaps_data.tar {}/smaps_data".format(adb_command, hos_dir, hos_dir)
    tar_p = subprocess.Popen(tarCmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)
    output, error = tar_p.communicate()
    
    tarCmd = "{} pull {}/smaps_data.tar".format(adb_command, hos_dir)
    tar_p = subprocess.Popen(tarCmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=True)
    output, error = tar_p.communicate()

