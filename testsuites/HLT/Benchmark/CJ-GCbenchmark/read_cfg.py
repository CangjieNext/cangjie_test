# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import configparser
import pathlib


# Overrides optionxform
class MyConf(configparser.RawConfigParser):
    def __init__(self, defaults=None):
        configparser.RawConfigParser.__init__(self, defaults=None)

    def optionxform(self, optionstr):
        return optionstr


def config(config_file, whether_run):
    env_name = "env"
    compile_name = "compile"
    if whether_run == "true":
        env_name = "env_linux"
        compile_name = "compile_linux"

    cf = MyConf()
    cf.read(config_file)
    config_dict = dict()
    # config_dict["onlydirs"] = cf.get("filters", "onlydirs").strip("\n").split()
    config_dict["signal_file_case"] = cf.get("filters", "signal_file_case").strip("\n").split()
    config_dict["multiple_file_case"] = cf.get("filters", "multiple_file_case").strip("\n").split()
    config_dict["language"] = list(map(lambda x: "." + x, cf.get("language", "language").split()))
    config_dict["repeat"] = cf.getint("repeat", "repeat")
    config_dict["interval"] = cf.getfloat("interval", "interval")
    config_dict["timeout"] = cf.getfloat("timeout", "timeout") * 1e9
    output = cf.get("output", "output").strip("\n").split()
    if output[0] == "all":
        output = ["cpu", "rss", "vms", "shared", "text", "lib", "data", "dirty", "uss", "pss", "swap"]
    config_dict["output"] = output
    env = dict()
    if cf.options(env_name):
        for key in cf.options(env_name):
            env[key] = cf.get(env_name, key)
        config_dict[env_name] = env
    config_dict["case_path"] = cf.get("case_path", "case_path")
    compile_cmd = dict()
    if cf.options(compile_name):
        for key in cf.options(compile_name):
            compile_cmd[key] = cf.get(compile_name, key).strip("\n").split("\n")
        config_dict[compile_name] = compile_cmd
    run_cmd = dict()
    if cf.options("run"):
        for key in cf.options("run"):
            run_cmd[key] = cf.get("run", key).strip("\n").split("\n")
        config_dict["run"] = run_cmd
    return config_dict


def testlist(testlist_file):
    testlist_cf = MyConf()
    testlist_cf.read(testlist_file)
    testlist_dict = dict()
    if testlist_cf.sections():
        for se in testlist_cf.sections():
            if testlist_cf.options(se):
                test_list = dict()
                for op in testlist_cf.options(se):
                    test_list[op] = testlist_cf.get(se, op)
                testlist_dict[se] = test_list
    return testlist_dict
