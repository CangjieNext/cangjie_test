#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import sys

import push_to_cptl as p
import csv
import datetime
import platform
import subprocess

result_csv = '../concurrency-benchmark/con_results.csv'
summary = """Concurrency benchmark is used to test the concurrency performance of a language.
"""
case_info = {
    'WaitNotifyExtended': '(op/ms), Higher is better',
    'EnterExit': '(ms), lower is better',
    'PerThreadMemUsage': '(kb), lower is better',
    'ProducerConsumer': '(ms), lower is better',
    'StartEndCost': '(ms), lower is better',
    'VariousSizeTasks': '(ms), lower is better',
    'Echo': '(ms), lower is better',
}


def parser_csv(filename=result_csv):
    raw = []
    total_results = {}
    commit_id_list = []

    commit_id_list.append("-------------------------------------------------------------")
    commit_id_list.append("llvmgc的BaseLine为go, cjvm的BaseLine为loom, 其余BaseLine为自身")
    commit_id_list.append("-------------------------------------------------------------")
    out_bytes_cj = subprocess.check_output(['cjc', '-v'])
    commit_id_cj = out_bytes_cj.decode('utf-8').strip().split('\n')
    commit_id_list.append('Cj Version: ' + '\n'.join([commit_id_cj[0]]))

    out_bytes_go = subprocess.check_output(['go', 'version'])
    commit_id_go = out_bytes_go.decode('utf-8').strip().split('\n')
    commit_id_list.append('Go Version: ' + '\n'.join([commit_id_go[0]]))

    out_bytes_java = subprocess.check_output(['java', '-version'], stderr=subprocess.STDOUT)
    commit_id_java = out_bytes_java.decode('utf-8').strip().split('\n')
    commit_id_list.append('Java Version: ' + '\n'.join([commit_id_java[0]]))

    with open(filename) as f:
        render = csv.reader(f)
        for x in render:
            if x[0] == 'name':
                continue
            if len(x) == 0:
                continue
            if x[-1] == '':
                continue
            result = {}
            case_name = x[0]
            result.setdefault(x[1], {'value': round(float(x[2]), 2)})
            if total_results.get(case_name):
                for k in result.keys():
                    total_results.get(case_name).setdefault(k, result.get(k))
            else:
                total_results.setdefault(case_name, result)

        for case_name in total_results.keys():
            for l in total_results[case_name].keys():
                # llvmgc的BaseLine为go, cjvm的BaseLine为loom, 其余BaseLine为自身
                if (l == "cj/llvmgc") or (l == "cj/llvmgc/lto") or (l == "go"):
                    total_results[case_name][l].setdefault('baseline',total_results[case_name].get('go', 0).get('value', 0))
                else:
                    total_results[case_name][l].setdefault('baseline',total_results[case_name].get('loom', 0).get('value', 0))
            
            if total_results[case_name].get('cj/llvmgc'):
                total_results[case_name].setdefault('llvmgc_cj', total_results[case_name].pop('cj/llvmgc'))
            else:
                total_results[case_name].setdefault('llvmgc_cj', {'value': 0, 'baseline': 0})
            if total_results[case_name].get('cj/llvmgc/lto'):
                total_results[case_name].setdefault('llvmgc_lto_cj', total_results[case_name].pop('cj/llvmgc/lto'))
            else:
                total_results[case_name].setdefault('llvmgc_lto_cj', {'value': 0, 'baseline': 0})
            if total_results[case_name].get('cj/jet'):
                total_results[case_name].setdefault('cjvm_cj', total_results[case_name].pop('cj/jet'))
            else:
                total_results[case_name].setdefault('cjvm_cj', {'value': 0, 'baseline': 0})
            if total_results[case_name].get('cj/jet/pgo'):
                total_results[case_name].setdefault('cjvm_pgo_cj', total_results[case_name].pop('cj/jet/pgo'))
            else:
                total_results[case_name].setdefault('cjvm_pgo_cj', {'value': 0, 'baseline': 0})
            
            cur_level_str = level_str
            tmp_summary = []
            if "PerThreadMemUsage" in case_name:
                cur_level_str = cur_level_str + "/" + "Memory_Peak"
                tmp_summary.append("Memory_Peak(kb): 内存峰值")
            elif "WaitNotifyExtended" in case_name:
                cur_level_str = cur_level_str + "/" + "Throughput"
                tmp_summary.append("Throughput(op/ms): 吞吐量")
            else:
                cur_level_str = cur_level_str + "/" + "Execution_Time"
                tmp_summary.append("Execution_Time(ms): 运行耗时")
            tmp_summary += commit_id_list
            tmp_summary = '\n'.join(tmp_summary)
            temp = p.template_new(level_str=cur_level_str, funcName=case_name, result=total_results[case_name],
                                timestamp=timestamp, summary=tmp_summary)
            temp.setdefault('message', 'llvmgc_cj,go,cjvm_cj,loom,llvmgc_lto_cj,cjvm_pgo_cj')
            raw.append(temp)

    print(raw)
    p.post_one_url_new(raw, version_json)


if __name__ == '__main__':
    timestamp = int(datetime.datetime.now().strftime('%Y%m%d%H%M'))
    arch = platform.machine()
    if arch == 'x86_64':
        arch = 'x86'
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', 'Concurrency_Benchmark'])
    i = sys.argv
    version_json = None
    if len(i) == 2:
        version_json = i[1]
    parser_csv()
