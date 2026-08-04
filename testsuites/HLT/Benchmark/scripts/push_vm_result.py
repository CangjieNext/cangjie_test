#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import datetime
import sys

import push_to_cptl as p

cj_result = []
java_result = []
cj_names = set()
java_names = set()
cj_java_dict = {
    'SystemBooleanArrayCopy': 'SystemBoolArrayCopy',
    'SystemFloatArrayCopy': 'SystemFloat32ArrayCopy',
    'SystemLongArrayCopy': 'SystemInt64ArrayCopy',
    'SystemShortArrayCopy': 'SystemInt16ArrayCopy',
    'SystemByteArrayCopy': 'SystemInt8ArrayCopy',
    'SystemDoubleArrayCopy': 'SystemFloat64ArrayCopy',
    'SystemIntArrayCopy': 'SystemInt32ArrayCopy',
}


def parse_one_cj_case(i):
    temp = []
    j = i.split('\n')
    # print(j)
    for x in range(len(j)):
        if j[x].endswith('.cj'):
            cj_names.add(j[x][:-3])
            temp.append(j[x][:-3])  # name
            if j[x + 1].endswith('ns'):
                temp.append(float(j[x + 1][:-2]) / repos)  # ns/op
            else:  # failed.
                temp.append(0)
        if 'Maximum resident set size' in j[x]:
            temp.append(int(j[x].split(':')[-1].strip()))  # RSS max mem
            break
    cj_result.append(temp)


def parse_vm_cj_log(log='./vm_cj.log'):
    if not os.path.exists(log):
        raise Exception("{} not found".format(log))
    with open(log, 'r') as f:
        line = f.readline()
        temp = ''
        while line:
            temp += line
            line = f.readline()
            if line.endswith('.cj\n'):
                # print(temp)
                parse_one_cj_case(temp)
                temp = ''


def parse_one_java_case(i):
    temp = []
    first_dot = i.find('.')
    name = i[5:first_dot]
    # print(name, len(name))
    if name in cj_java_dict.keys():
        name = cj_java_dict[name]
    if name not in cj_names:
        # print(name,cj_names)
        return
    temp.append(name)
    infos = [x.strip() for x in i[63:].split('|')]
    temp.append(infos[0])
    temp.append(infos[1])
    java_result.append(temp)


def parse_vm_java_log(log='./vm_java.log'):
    if not os.path.exists(log):
        raise Exception("{} not found".format(log))
    with open(log, 'r') as f:
        line = f.readline()
        while line:
            if '.java' in line:
                parse_one_java_case(line)
            line = f.readline()


def push_result():
    time_raw = []
    mem_raw = []
    for i in range(len(cj_result)):
        found_java = False
        for j in range(len(java_result)):
            if cj_result[i][0] == java_result[j][0]:
                if java_result[j][1] == 'None':
                    java_result[j][1] = 0
                time_result = {}
                time_result['cj(ns/op)'] = {'value': cj_result[i][1], 'baseline': java_result[j][1]}
                time_result['java(ns/op)'] = {'value': java_result[j][1], 'baseline': java_result[j][1]}
                mem_result = {}
                mem_result['cj(KB)'] = {'value': cj_result[i][2], 'baseline': java_result[j][2]}
                mem_result['java(KB)'] = {'value': java_result[j][2], 'baseline': java_result[j][2]}
                found_java = True
                time_raw.append(p.template('vm-benchmark', cj_result[i][0], time_result, 'time', timestamp, backend))
                mem_raw.append(p.template('vm-benchmark', cj_result[i][0], mem_result, 'memory', timestamp, backend))
                break
        if not found_java:
            time_result = {}
            time_result['cj(ns/op)'] = {'value': cj_result[i][1], 'baseline': 0}  # use empty as baseline.
            mem_result = {}
            mem_result['cj(KB)'] = {'value': cj_result[i][2], 'baseline': 0}  # use empty as baseline.
            time_raw.append(p.template('vm-benchmark', cj_result[i][0], time_result, 'time', timestamp, backend))
            mem_raw.append(p.template('vm-benchmark', cj_result[i][0], mem_result, 'memory', timestamp, backend))

    p.post_one_url(time_raw)
    p.post_one_url(mem_raw)
    return [time_raw, mem_raw]


if __name__ == '__main__':
    timestamp = int(datetime.datetime.now().strftime('%Y%m%d%H%M'))
    i = sys.argv
    if 'repos' in os.environ:
        repos = float(os.environ['repos'])
    else:
        repos = float(100000)
    parse_vm_cj_log()

    bs = ['llvmgc', 'jet','llvmgc_aarch64','jet_aarch64']
    if len(i) == 1:
        backend = 'llvmgc'
    elif len(i) == 2:
        backend = i[1]
        if backend not in bs:
            print('[ERROR]backend should in {}!'.format(bs))
            sys.exit(1)

    name_map = [0 for _ in range(len(cj_result))]
    parse_vm_java_log()
    push_result()
