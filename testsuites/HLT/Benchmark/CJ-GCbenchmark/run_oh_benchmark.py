# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import argparse
from genericpath import exists
import os
import shutil
import sys
import pathlib
import inspect
import read_cfg as rc
import tools as tl
import prepare_file as pf
import read_write_csv as rwc


workspace = pathlib.Path(os.path.dirname(__file__)).absolute()
header_list = ["case_name", "language", "cpu(%)", "rss(byte)", "vms(byte)", "shared(byte)", "text(byte)", "lib(byte)",
               "data(byte)", "dirty(byte)", "uss(byte)", "pss(byte)", "swap(byte)", "time(ns)", "cost_time(s)",
               "result", "cpu_load(%)", "rss_max(byte)", "rss_integral(byte)"]

header_list_Benchmarks_game_hdc = ["case_name", "language", "cpu(%)", "mem(byte)", "time(ns)", "cost_time(s)", "result"]

header_list_linaro_hdc = ["case_name", "language", "result", "cycle_time(ns)"]


def case_prepare_fun(case_name_lang, case_name, type, type_list=[]):
    # type
    if type == "file":
        run_name = case_name_lang.split('.')[0]
        run_type = case_name_lang.split('.')[-1]
    elif type == "dir":
        run_name = case_name_lang

    # env
    case_env_in = env
    case_env = os.environ.copy()
    if len(case_env_in) != 0:
        for i in case_env_in.items():
            case_env[i[0]] = i[1].replace("${SCRIPTS_DIR}", str(workspace))

    # testrange
    case_testrange = testlist.get('testrange').get(case_name_lang.split('.')[0]) if testlist.get('testrange').get(
        case_name_lang.split('.')[0]) else ''

    # testdata
    case_data = testlist.get('testdata').get(case_name_lang.split('.')[0]) if testlist.get('testdata') and testlist.get(
        'testdata').get(
        case_name_lang.split('.')[0]) else None

    if whether_run == "true":
        compile_name = "compile_linux"
    else:
        compile_name = "compile"

    # compile_cmd and run_cmd
    if type == "file":
        case_compile_cmd = list(
            map(lambda x: x.replace("${SCRIPTS_DIR}", str(workspace)).replace("%f", case_name_lang)
                .replace("%n", run_name).replace("%r", run_name).replace("%jarpath", run_name)
                .replace("%onlydirs", case_name),config_dict.get(compile_name).get(run_type)))
        case_run_cmd = list(
            map(lambda x: x.replace("${SCRIPTS_DIR}", str(workspace)).replace("%f", case_name_lang).replace(
                "%n", run_name), config_dict.get("run").get(run_type)))
    elif type == "dir":
        case_compile_cmd = []
        case_run_cmd = []
        for t in type_list:
            case_compile_cmd.extend(list(
                map(lambda x: x.replace("${SCRIPTS_DIR}", str(workspace)).replace("%n", run_name)
                    .replace("%r", "*").replace("%jarpath", str(run_name + "/" + run_name))
                    .replace("%onlydirs", case_name),config_dict.get(compile_name).get(t))))
            print(case_compile_cmd)
            case_run_cmd.extend(list(
                map(lambda x: x.replace("${SCRIPTS_DIR}", str(workspace)).replace("%n", run_name),
                    config_dict.get("run").get(t))))
        

    for ce in case_env.items():
        case_compile_cmd = list(map(lambda x: x.replace("%{}".format(ce[0]), ce[1]), case_compile_cmd))
        case_run_cmd = list(map(lambda x: x.replace("%{}".format(ce[0]), ce[1]), case_run_cmd))

    if case_testrange != '':
        case_run_cmd = list(map(lambda x: x.replace('%testrange', case_testrange), case_run_cmd))
    else:
        case_run_cmd = list(map(lambda x: x.replace(' -- %testrange', '').replace(' %testrange', ''), case_run_cmd))

    # repeat
    case_repeat = repeat

    # interval
    case_interval = interval

    # timeout
    case_timeout = timeout

    return case_data, case_env, case_compile_cmd, case_run_cmd, case_repeat, case_interval, case_timeout


def run_case_compile(case_compile, case_env):
    compile_status = True
    csv_list = []
    # 当执行java的时候注释掉，不然无法将d8命令写进sh文件
    redirect_cmd = " 2>>error.log"
    for compile_cmd in case_compile:
        p_compile, actual_cmd = tl.call(compile_cmd + redirect_cmd, shell=True, env=case_env)
        p_compile.communicate()
        compile_returncode = p_compile.returncode
        if compile_returncode != 0:
            compile_status = False
            print("{} *** Compile message error!".format(actual_cmd))
            break
    if not compile_status:
        print("compile failed")
    else:
        print(".", end=" ")
    return compile_status, csv_list


def run_case(case_name_lang, case_run, case_env, case_repeat, case_interval, case_timeout, case_data):
    csv_list = []
    case_real_interval = case_interval
    f_name = inspect.getframeinfo(inspect.currentframe().f_back)[2]
    for r in range(case_repeat):
        for case_run_cmd in case_run:
            redirect_cmd = ' 2>>error.log 1>>log.log'
            if f_name == "performance_Benchmarks_game_test":
                p, actual_cmd = tl.call(["/bin/bash", "-c", case_run_cmd + redirect_cmd], filename=case_data,
                                        shell=False, env=case_env)
                csv_data, returncode = tl.get_memory(p, case_interval=case_real_interval, case_timeout=case_timeout)
                csv_data = [[0] if i == [] else i for i in csv_data]
                case_real_interval = max(csv_data[-1]) / (1e9 * 600) if r == 0 and max(
                    csv_data[-1]) / 1e9 > 60 else case_interval
                if returncode == -9 or returncode == 0:
                    print("timeout", end=" ") if returncode == -9 else print(".", end=" ")
                    csv_data.append(float(round(max(csv_data[-1]) / 1e9, 3)))  # cost_time
                    csv_data.append('TIMEOUT') if returncode == -9 else csv_data.append('SUCCESS')
                    csv_data.append(float(sum(list(map(lambda x: x * case_interval, csv_data[0])))))  # cpu_load
                    csv_data.append(float(max(csv_data[1])))  # rss_max
                    csv_data.append(float(sum(list(map(lambda x: x * case_interval, csv_data[1])))))  # rss_integral
                    csv_data.insert(0, case_name_lang.split('.')[-1])
                    csv_data.insert(0, case_name_lang.split('.')[0])
                    if returncode == -9:
                        print("{} Run message timeout for: out of {}s".format(actual_cmd, str(round(case_timeout / 1e9, 1))))
                    elif returncode == 0:
                        print("{} Run success".format(actual_cmd))
                else:
                    print("error", end=" ")
                    csv_data = [[0] for _ in range(12)]
                    csv_data.insert(0, case_name_lang.split('.')[-1])
                    csv_data.insert(0, case_name_lang.split('.')[0])
                    csv_data.append(0)  # cost_time
                    csv_data.append("FAILED")
                    csv_data.append(0)  # cpu_load
                    csv_data.append(0)  # rss_max
                    csv_data.append(0)  # rss_integral
                    print("{} *** Run message error!".format(actual_cmd))
                csv_list.append(csv_data)

    print("OK")
    print("csv_list",csv_list)
    return csv_list


def write_csv(header_list_format, csv_list):
    csv_file_path = pathlib.Path.joinpath(workspace, "case", csv_file)
    rwc.write_csv_file(csv_file_path, header_list_format, csv_list)
    if os.path.exists(pathlib.Path.joinpath(workspace, "result", csv_file)):
        os.remove(pathlib.Path.joinpath(workspace, "result", csv_file))
    shutil.move(str(csv_file_path), str(pathlib.Path.joinpath(workspace, "result")))


def performance_Benchmarks_game_test():
    # case
    csv_list = list()
    
    for case_name in signal_file_case:
        case_path = pathlib.Path.joinpath(workspace, "case", case_name)
        case_file_list = tl.file_list_handle(case_path, sub_dir=True, suffix_list=suffix_list)
        print(case_path)
        print(case_file_list)
        for case_file in case_file_list:
            case_name_lang = pathlib.PurePath(case_file).name
            os.chdir(path=pathlib.PurePath(case_file).parent)
            print(tl.current_time(), end=" ")
            print(case_name_lang, end=" ")
            
            # prepare the case
            case_data, case_env, case_compile, case_run, case_repeat, case_interval, case_timeout = case_prepare_fun(case_name_lang, case_name, "file")

            # compile the case
            compile_status = True
            if case_compile is not None:
                compile_status, csv_list_data = run_case_compile(case_compile, case_env)
                if csv_list_data:
                    for i in csv_list_data:
                        csv_list.append(i)

            # run the case
            if whether_run == "true" and compile_status:
                csv_list_data = run_case(case_name_lang, case_run, case_env, case_repeat, case_interval, case_timeout,
                                         case_data)
                if csv_list_data:
                    for i in csv_list_data:
                        csv_list.append(i)
    
    for case_name in multiple_file_case:
        case_path = pathlib.Path.joinpath(workspace, "case", case_name)
        print(case_path)
        case_dir_list = tl.dir_list_handle(pathlib.Path.joinpath(case_path,"code"))
        for case_dir in case_dir_list:
            case_name_lang = pathlib.PurePath(case_dir).name
            os.chdir(path=pathlib.PurePath(case_dir))
            print(tl.current_time(), end=" ")
            print(case_name_lang, end=" ")
            
            # prepare the case
            type_list = tl.get_type_list(case_dir)
            case_data, case_env, case_compile, case_run, case_repeat, case_interval, case_timeout = case_prepare_fun(case_name_lang, case_name, "dir", type_list)

            # compile the case
            compile_status = True
            if case_compile is not None:
                compile_status, csv_list_data = run_case_compile(case_compile, case_env)
                if csv_list_data:
                    for i in csv_list_data:
                        csv_list.append(i)

            # run the case
            if whether_run == "true" and compile_status:
                csv_list_data = run_case(case_name_lang, case_run, case_env, case_repeat, case_interval, case_timeout,
                                         case_data)
                if csv_list_data:
                    for i in csv_list_data:
                        csv_list.append(i)
    write_csv(header_list_format=header_list, csv_list=csv_list)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--csv_file", default='results.csv', type=str, help="results.csv")
    parser.add_argument("-l", "--language", action="append", help="specify the language")
    parser.add_argument("--config", default="config.cfg", type=str, help='specify the config file')
    parser.add_argument("--args_file", default='testlist.cfg', type=str, help='specify the args file')
    parser.add_argument("--whether_run", default='true', type=str, help='whether to run the test case')

    args = parser.parse_args()
    csv_file = args.csv_file
    config_file = args.config
    language = args.language
    args_file = args.args_file
    whether_run = args.whether_run
    if pathlib.Path.joinpath(workspace, config_file).exists() and pathlib.Path.joinpath(workspace, args_file).exists():
        config_dict = rc.config(pathlib.Path.joinpath(workspace, config_file), whether_run)
        testlist = rc.testlist(pathlib.Path.joinpath(workspace, args_file))
    else:
        print("{} or {} does not exist".format(str(pathlib.Path.joinpath(workspace, config_file)),
                                               str(pathlib.Path.joinpath(workspace, args_file))))
        sys.exit(0)
    
    signal_file_case = config_dict.get("signal_file_case")
    multiple_file_case = config_dict.get("multiple_file_case")
    runlist = signal_file_case + multiple_file_case
    repeat = config_dict.get("repeat")
    interval = config_dict.get("interval")
    timeout = config_dict.get("timeout")
    output = config_dict.get("output")
    env = config_dict.get("env_linux" if whether_run == "true" else "env")
    case_path = config_dict.get("case_path").replace("${SCRIPTS_DIR}", str(workspace))
    suffix_list = config_dict.get("language")
    if language is not None:
        suffix_list = list(map(lambda x: "." + x, language))

    if not pf.prepare_dir(csv_file, case_path, runlist):
        sys.exit(0)
    performance_Benchmarks_game_test()
    # data_list = rwc.parser_csv_file(pathlib.Path.joinpath(workspace, "result", csv_file))
