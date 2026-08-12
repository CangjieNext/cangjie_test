#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


import os
import random

dir = "../data/json"
nums = [8, 64, 512, 4096, 16384]
deps = [1, 2, 4, 8, 32]


def format_json(maxBroad, maxDepth):
    cur_d = 0
    return generate_json(cur_d, maxBroad, maxDepth)


def generate_json(cur_d, maxBroad, maxDepth):
    iden = ''
    for i in range(cur_d):
        iden += '  '

    if cur_d == maxDepth:
        genvalue = " \"" + "v_" + str(random.randint(1, 1000)) + "\""
        return genvalue

    json = ('{\n')
    cur_b = -1
    if cur_d == 0:
        cur_b = maxBroad
    else:
        cur_b = 1

    for b in range(cur_b):
        genkey = "k" + "_n" + str(b) + "d" + str(cur_d)
        json += (iden + '  ' + '\"' + genkey + "\":" + generate_json(cur_d + 1, maxBroad, maxDepth) )
        if b == cur_b - 1:
            json +="\n"
        else:
            json += ",\n"

    json += (iden + '}')
    return json


def write_into_file(data, fileName):
    path = dir + "/" + fileName + ".json"
    f = open(path, 'w')
    try:
        f.write(data)
    finally:
        if f:
            f.close()


def generate_json_file():
    for num in nums:
        for dep in deps:
            jsonData = format_json(num, dep)
            write_into_file(jsonData, "n"+str(num)+"d"+str(dep))


if __name__ == '__main__':
    generate_json_file()

