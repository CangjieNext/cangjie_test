#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import sys
import getopt
import multiprocessing
import subprocess
import itertools
import time
import csv

g_test_language = ['cj', 'go']
g_csv_result = 'result.csv'
g_csv_error = ''
g_specified_module = ''
g_parallel_mode = False
g_display_time = False
g_all_module = []
g_all_result = []
g_reserve_all_result = []
case_list_prefix = 'testlist-go-'
g_script_dir = ''
g_result_dir = ''
g_testlist_dir = ''
g_fail_summary = []
g_exception_summary = []
g_cj_error_log = []


def help_func():
    print('python3 ' + os.path.basename(
        sys.argv[0]) + '[ -h ] [-s <result.csv>]  [-m <module-name> ] [ -d <debug.csv> ] [-l] [-p] [-t]')
    print('\t -h: help')
    print('\t -s: save result. default name:result.csv')
    print('\t -m: specify module name. E.g:array. default:run all module')
    print('\t -d: save debug info.default no debugging info.')
    print('\t -l: list all module name.')
    print('\t -p: parallel mode. default:serial mode')
    print('\t -t: display time.')
    return


def process_opts():
    global g_csv_result
    global g_specified_module
    global g_csv_error
    global g_parallel_mode
    global g_display_time
    is_help = False
    is_list_module = False
    try:
        opts, remainder = getopt.gnu_getopt(sys.argv[1:], 's:m:d:thpl')
    except getopt.GetoptError as err:
        help_func()
        sys.exit(1)
    for opt in opts:
        if opt[0] == '-s':
            g_csv_result = opt[1]
        elif opt[0] == '-m':
            g_specified_module = opt[1]
        elif opt[0] == '-d':
            g_csv_error = opt[1]
        elif opt[0] == '-p':
            g_parallel_mode = True
        elif opt[0] == '-l':
            is_list_module = True
        elif opt[0] == '-t':
            g_display_time = True
        elif opt[0] == '-h':
            is_help = True
        else:
            help_func()
            sys.exit(1)
    if is_help:
        help_func()
        sys.exit(0)
    if is_list_module:
        display_module_name()
        sys.exit(0)
    if len(remainder) != 0:
        help_func()
        sys.exit(1)
    if g_specified_module != '' and g_specified_module not in g_all_module:
        print("module is wrong!")
        sys.exit(1)
    g_csv_result = os.path.abspath(g_csv_result)
    return


def init():
    global g_result_dir
    global g_testlist_dir
    global g_script_dir
    g_script_dir = os.path.dirname(os.path.realpath(__file__))
    g_result_dir = os.path.join(g_script_dir, '../result')
    g_testlist_dir = os.path.join(g_script_dir, '../testlist')
    get_all_module()
    return


def remove_file(file_name):
    if os.path.exists(file_name):
        os.remove(file_name)
    return


def remove_temp_file():
    global g_result_dir
    output_postfix = '-output-info.txt'
    error_postfix = '-error-info.txt'
    if g_specified_module == '':
        for i in g_all_module:
            remove_file(os.path.join(g_result_dir, i + output_postfix))
            remove_file(os.path.join(g_result_dir, i + error_postfix))
    else:
        remove_file(os.path.join(g_result_dir, g_specified_module + output_postfix))
        remove_file(os.path.join(g_result_dir, g_specified_module + error_postfix))
    return


def remove_result_file():
    global g_result_dir
    result_postfix = '-result.log'
    if g_specified_module == '':
        for i in g_test_language:
            for j in g_all_module:
                remove_file(os.path.join(g_result_dir, i + '-' + j + result_postfix))
    else:
        for i in g_test_language:
            remove_file(os.path.join(g_result_dir, i + '-' + g_specified_module + result_postfix))
    return


def clean():
    remove_temp_file()
    remove_result_file()
    remove_file(g_csv_result)
    return


def get_all_module():
    for parent, dir_name, file_name in os.walk(g_testlist_dir):
        for i in file_name:
            if i == 'testlist-go-api':
                continue
            if i.startswith(case_list_prefix):
                g_all_module.append(i[len(case_list_prefix):])
    return


def display_module_name():
    print('all module:')
    for i in g_all_module:
        print(i)
    return


def run_cj_module(module_name):
    command = 'bash ' + os.path.join(g_script_dir, 'run_cj_case.sh') + ' ' + module_name
    os.system(command)
    return


def run_go_module(module_name):
    command = 'bash ' + os.path.join(g_script_dir, 'run_go_case.sh') + ' ' + module_name
    os.system(command)
    return


def serial_run_module(module_name: str):
    run_cj_module(module_name)
    run_go_module(module_name)
    return


def serial_run_all_module():
    for i in g_all_module:
        serial_run_module(i)
    return


def parallel_run_single_module(module_name: str):
    cj_process = multiprocessing.Process(target=run_cj_module, args=(module_name, ))
    go_process = multiprocessing.Process(target=run_go_module, args=(module_name, ))
    cj_process.start()
    go_process.start()
    cj_process.join()
    go_process.join()
    return 0


def start_process():
    print('Process-Module', multiprocessing.current_process().name)
    return


def get_reasonable_kernel_num():
    max_number = int(multiprocessing.cpu_count())
    if g_specified_module == '':
        necessary_number = len(g_all_module) * len(g_test_language)
    else:
        necessary_number = len(g_test_language)
    reasonable_num = min(max_number, necessary_number)
    assert reasonable_num > 0
    return reasonable_num


def parallel_serial_run_all_module():
    global g_all_result
    pool_size = get_reasonable_kernel_num()
    pool = multiprocessing.Pool(processes=pool_size, initializer=start_process)
    g_all_result = pool.map(serial_run_module, g_all_module)
    pool.close()
    pool.join()
    return


def run_specified_language_module(module_info: tuple):
    if module_info[0] == 'cj':
        run_cj_module(module_info[1])
    elif module_info[0] == 'go':
        run_go_module(module_info[1])
    else:
        assert False
    return


def parallel_run_all_module():
    global g_all_result
    pool_size = get_reasonable_kernel_num()
    combine = itertools.product(g_test_language, g_all_module)
    parameter = list(combine)
    pool = multiprocessing.Pool(processes=pool_size, initializer=start_process)
    g_all_result = pool.map(run_specified_language_module, parameter)
    pool.close()
    pool.join()
    return


def get_cj_item_result(cj_lines: list, item: str):
    result = '0'
    item = item.strip()
    for i in cj_lines:
        i = i.strip()
        if i.startswith('#'):
            continue
        index1 = i.find(item + ':')
        index2 = i.find('ns/op')
        if index1 == 0 and index2 != -1:
            result = i[len(item + ':'): index2].strip()
            result2 = i.split()[1]
            if result != result2:
                print('i=%s' % i)
                print('item=%s' % item)
                print('result=%s' % result)
                print('result2=%s' % result2)
            assert result == result2
            break
    return result


def get_go_item_result(go_lines: list, item: str):
    result = '0'
    item = item.strip()
    for i in go_lines:
        i = i.strip()
        if i.startswith(item) and i.endswith('ns/op'):
            temp = i.split()
            assert len(temp) == 4
            result = temp[2]
            break
    return result


def get_language_result_lines(module_name: str):
    all_lang_result_lines = []
    for i in g_test_language:
        file_name = os.path.join(g_result_dir, i + '-' + module_name + '-result.log')
        with open(file=file_name, encoding="utf-8") as f:
            lines = f.readlines()
            all_lang_result_lines.append(lines)
    return all_lang_result_lines


def parse_module_result(module_name: str):
    standard_case_fle = os.path.join(g_testlist_dir, case_list_prefix + module_name)
    with open(file=standard_case_fle, encoding="utf-8") as f:
        standard_case_list = f.readlines()
    assert len(g_test_language) == 2
    all_lang_result_lines = get_language_result_lines(module_name)
    cj_lines = all_lang_result_lines[0]
    go_lines = all_lang_result_lines[1]
    module_result = []
    error_result = []
    product = 1.0
    counter = 0
    for i in standard_case_list:
        i = i.strip()
        if i == '':
            continue
        if i.startswith('#'):
            continue
        cj_value = get_cj_item_result(cj_lines, i)
        go_value = get_go_item_result(go_lines, i)
        if go_value != '0':
            rate = float(cj_value) / float(go_value)
        else:
            rate = 0
        if rate != 0:
            product *= rate
            counter += 1
        record_value = [i, cj_value, go_value, str(rate)]
        module_result.append(record_value)
        if cj_value == '0' or go_value == '0' or float(cj_value) == 0 or float(go_value) == 0:
            error_result.append(record_value)
    if counter != 0:
        geometric_mean = product ** (1.0 / counter)
    else:
        geometric_mean = 0
    module_result.append(['geometric_mean', 'NA', 'NA', str(geometric_mean)])
    return module_result, error_result


def process_all_module_result():
    all_module_result = []
    for i in g_all_module:
        module_result, error_result = parse_module_result(i)
        all_module_result.append([i, module_result, error_result])
    return all_module_result


def process_specified_module_result(module_name: str):
    all_result = []
    module_result, error_result = parse_module_result(module_name)
    all_result.append([module_name, module_result, error_result])
    return all_result


def save_result_csv(all_module_result: list):
    global g_csv_result
    total = []
    with open(g_csv_result, "w") as csv_file:
        writer = csv.writer(csv_file)
        for i in all_module_result:
            writer.writerow([i[0], 'funcName', 'cj(ns/op)', 'go(ns/op)', 'cj/go'])
            for index, j in enumerate(i[1]):
                writer.writerow(['', j[0], j[1], j[2], j[3]])
                if index == len(i[1]) - 1:
                    total.append([i[0], j[3]])
        writer.writerow(['', ''])
        writer.writerow(['API', 'geometric_mean'])
        product = 1.0
        counter = 0
        for i in total:
            writer.writerow([i[0], i[1]])
            if float(i[1]) != 0:
                counter += 1
                product *= float(i[1])
        if counter != 0:
            geometric_mean = product ** (1.0 / counter)
        else:
            geometric_mean = 0
        writer.writerow(['geometric_mean', str(geometric_mean)])
        writer.writerow(['', ''])
        writer.writerow(['FAIL MODULE(Result is 0)', 'TOTAL'])
        for i in all_module_result:
            if len(i[2]) != 0:
                writer.writerow([i[0], str(len(i[2]))])
    return


def process_fail_summary(all_module_result: list):
    global g_fail_summary
    for i in all_module_result:
        if len(i[2]) != 0:
            g_fail_summary.append([i[0], str(len(i[2]))])
    return


def process_exception_summary():
    global g_cj_error_log
    global g_exception_summary
    exception_flag = 'EXCEPTION FILE:'
    for i in g_cj_error_log:
        assert len(i) == 2
        exception_result = []
        for j in i[1]:
            index = j.find(exception_flag)
            if index != -1:
                exception_result.append(j[len(exception_flag):].strip())
        if len(exception_result) != 0:
            g_exception_summary.append([i[0], exception_result])
    return


def process_result():
    global g_reserve_all_result
    global g_cj_error_log
    if g_specified_module == '':
        all_module_result = process_all_module_result()
    else:
        all_module_result = process_specified_module_result(g_specified_module)
    g_reserve_all_result = all_module_result
    save_result_csv(all_module_result)
    process_fail_summary(all_module_result)
    g_cj_error_log = get_cj_all_error_log()
    process_exception_summary()
    return


def display_result():
    global g_fail_summary
    global g_exception_summary
    if len(g_fail_summary) != 0:
        print('{:30}{:10}'.format('Fail-Module', 'Total'))
    for i in g_fail_summary:
        print('{:30}{:40}'.format(i[0], i[1]))
    if len(g_exception_summary) != 0:
        print('\n{:30}{:40}'.format('Exception-Module', 'File'))
    for i in g_exception_summary:
        assert(len(i) == 2)
        for j in i[1]:
            print('{:30}{:40}'.format(i[0], j))
    if len(g_fail_summary) == 0 and len(g_exception_summary) == 0:
        print("\nRun Successfully!")
    else:
        print("\nRun Failed!")
    return


def run_case():
    if g_specified_module == '':
        if g_parallel_mode:
            parallel_run_all_module()
        else:
            serial_run_all_module()
    else:
        if g_parallel_mode:
            parallel_run_single_module(g_specified_module)
        else:
            serial_run_module(g_specified_module)
    return


def get_cj_specified_module_error(module_name: str):
    error_info = []
    error_flag = 'ERROR-CJ:'
    file_name = os.path.join(g_result_dir, 'cj' + '-' + module_name + '-result.log')
    with open(file=file_name, encoding="utf-8") as f:
        lines = f.readlines()
        for i in lines:
            i = i.strip()
            if i.startswith(error_flag):
                error_info.append(i[len(error_flag):])
    return error_info


def get_cj_all_error_log():
    all_cj_error_info = []
    if g_specified_module == '':
        for i in g_all_module:
            error_info = get_cj_specified_module_error(i)
            all_cj_error_info.append([i, error_info])
    else:
        error_info = get_cj_specified_module_error(g_specified_module)
        all_cj_error_info.append([g_specified_module, error_info])
    return all_cj_error_info


def debug_cj_error():
    global g_reserve_all_result
    global g_cj_error_log
    if g_csv_error != '':
        file_name = os.path.join(g_script_dir, g_csv_error)
        with open(file_name, "w") as csv_file:
            writer = csv.writer(csv_file)
            for i in g_cj_error_log:
                if len(i[1]) != 0:
                    writer.writerow([i[0], 'file-list'])
                for j in i[1]:
                    writer.writerow(['', j])
            writer.writerow(['', ''])
            writer.writerow(['', ''])
            for i in g_reserve_all_result:
                if len(i[2]) != 0:
                    writer.writerow([i[0], 'funcName', 'cj(ns/op)', 'go(ns/op)', 'cj/go'])
                for index, j in enumerate(i[2]):
                    writer.writerow(['', j[0], j[1], j[2], j[3]])
    return


def set_up():
    command = 'bash ' + os.path.join(g_script_dir, 'set-up.sh')
    os.system(command)
    clean()
    return


def tear_down():
    command = 'bash ' + os.path.join(g_script_dir, 'clean-up.sh')
    os.system(command)
    return


if __name__ == '__main__':
    start_time = time.time()
    init()
    process_opts()
    set_up()
    run_case()
    process_result()
    debug_cj_error()
    display_result()
    tear_down()
    end_time = time.time()
    if g_display_time:
        print('total time (seconds):', int(end_time - start_time))
    sys.exit(0)
