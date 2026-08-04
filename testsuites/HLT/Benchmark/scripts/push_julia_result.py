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
import copy
import push_to_cptl as p
import json

cj_csv = './julia-benchmark/Microbenchmarks/benchmarks/cj.csv'
go_csv = './julia-benchmark/Microbenchmarks/benchmarks/go.csv'
julia_csv = './julia-benchmark/Microbenchmarks/benchmarks/julia.csv'
iter_time = 5
baseline_lang = 'go'
baseline = {}
all_result_data = {}


def read_csv(c):
    total = {}  # func name and result.
    lang = ''
    with open(c, 'r') as f:
        results = f.read().split()
    for result in results:
        r = result.split(',')
        lang = r[0]
        if lang == baseline_lang:
            if r[1] not in baseline:
                baseline[r[1]] = float(r[2])
            else:
                baseline[r[1]] += float(r[2])
        if r[1] not in total:
            total[r[1]] = float(r[2])
        else:
            total[r[1]] += float(r[2])
    for x in total.keys():
        total[x] = total[x] / iter_time

    if lang == baseline_lang:
        for x in baseline.keys():
            baseline[x] = baseline[x] / iter_time

    for x in total:
        cur = {'{}/μs'.format(lang): {'value': total[x] * 1000, 'baseline': baseline[x] * 1000}}
        all_result_data[lang + ',' + x] = cur


def template(taskName, funcName, result, category, timestamp, backend):
    t = {"envTypeName": backend, "taskName": taskName,
         "category": category, "funcName": funcName,
         "result": result, "timestamp": timestamp,
         "description": ""}
    return t


def push_result():
    raw = []
    summary = post_summary()
    for y in baseline:
        result = {}
        for x in all_result_data:
            temp = x.split(',')
            if temp[1] == y:
                print(all_result_data[x])
                result.update(all_result_data[x])
        print(result)
        raw.append(p.template('julia-benchmark', y, result, 'time', timestamp, backend, summary))

    print(raw)

    p.post_one_url(raw)


def post_summary():
    total = 0
    better = 0
    close = 0
    tolerance = 0.02
    mean_cj = 1
    mean_base = 1
    for x in all_result_data:
        lang, case = x.split(',')
        if lang == 'cangjie':
            cj_res = all_result_data[x]['cangjie/μs']['value']
            base_res = all_result_data[x]['cangjie/μs']['baseline']
            total += 1
            gap_date = abs(
                (float(base_res) - float(cj_res)) / float(base_res))
            if gap_date <= tolerance:
                close += 1
            elif gap_date > tolerance and float(cj_res) < float(base_res):
                better += 1
            mean_cj *= (1 / float(cj_res))
            mean_base *= (1 / float(base_res))
    mean_cj = pow(mean_cj, 1 / total)
    mean_base = pow(mean_base, 1 / total)
    summary = """Julia Benchmark 测试套执行了{}个用例，其中[cj]相比[{}]，有{}个用例较优，有{}个用例持平，有{}个用例较差。
性能几何平均值比为{}(越大越好)。
Julia Benchmark have {} cases, compare to [{}], [cj] has {} better cases, {} close cases, {} worse case.
Rate of performance geometric mean is {}(bigger is better).""".format(total, baseline_lang, better, close,
                                                                      total - better - close, mean_cj / mean_base,
                                                                      total, baseline_lang, better, close,
                                                                      total - better - close, mean_cj / mean_base)
    print(summary)
    return summary


if __name__ == '__main__':
    timestamp = int(datetime.datetime.now().strftime('%Y%m%d%H%M'))

    i = sys.argv

    bs = ['llvmgc', 'jet', 'llvmgc_aarch64','jet_aarch64']
    if len(i) == 1:
        backend = 'llvmgc'
    elif len(i) == 2:
        backend = i[1]
        if backend not in bs:
            print('[ERROR]backend should in {}!'.format(bs))
            sys.exit(1)

    read_csv(go_csv)  # go is baseline, read go first.
    read_csv(julia_csv)
    read_csv(cj_csv)

    push_result()
