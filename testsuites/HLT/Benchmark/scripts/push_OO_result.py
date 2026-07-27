#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import push_to_cptl as p
import csv
import datetime
import sys
import argparse

result_csv = 'Object-oriented/result.csv'

summary_others = """Object-oriented benchmark
case: EnterExit SynchProdCons NCEIterator
Time (sec) lower is better"""

summary_avalanche = """Object-oriented benchmark
case: avalanche
Throughput (units / msec) higher is better."""

baseline_lang = 'go'

avalanche = [
    'avalanche/Throughput/1t',
    'avalanche/Throughput/8t',
    'avalanche/Throughput/16t',
    'avalanche/Throughput/32t',
]

others = [
    'complex/object',
    'complex/struct',
    'game_of_life',
    'NCEIterator',
]

baseline = {}
targets = []


def get_baseline(filename=result_csv):
    with open(filename) as f:
        render = csv.reader(f)
        for x in render:
            if x[1] not in targets and x[1] != 'lang':
                targets.append(x[1])
            if x[1] == baseline_lang:
                baseline[x[0]] = x[2]
        print(baseline)
        print(targets)

def get_test_result(case, desc, summary, filename=result_csv):
    with open(filename) as f:
        render = csv.reader(f)
        result = {}
        for x in render:
            if x[0] == case:
                result[x[1]] = {'value': x[2], 'baseline': baseline[x[0]]}
        print(result)
    level_str = '/'.join([backend + '_' + arch, 'CJCF-Bench', 'Object-Orient-benchmark', desc])
    temp = p.template_new(level_str=level_str, funcName=case, result=result, timestamp=timestamp, summary=summary)
    temp['message'] = ','.join(targets)
    return temp

if __name__ == '__main__':
    timestamp = int(datetime.datetime.now().strftime('%Y%m%d%H%M'))
    parser = argparse.ArgumentParser()
    parser.add_argument("--backend", type=str, default='jet', help="llvmgc,jet")
    parser.add_argument("--arch", type=str, default='x86', help="x86,aarch64")
    args = parser.parse_args()
    backend = args.backend
    arch = args.arch

    get_baseline()

    raw = []
    for i in others:
        raw.append(get_test_result(i, "others", summary_others))
    p.post_one_url_new(raw)

    raw = []
    for i in avalanche:
        raw.append(get_test_result(i, "avalanche", summary_avalanche))
    p.post_one_url_new(raw)


