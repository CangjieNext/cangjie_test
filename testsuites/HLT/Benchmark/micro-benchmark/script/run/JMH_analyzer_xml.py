#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

#!/usr/bin/python3

import sys
import json

if __name__ == '__main__':
    jmh_result_file_name = sys.argv[1]
    with open(jmh_result_file_name, 'r') as jmh_result_file:
        jmh_record_list = json.load(jmh_result_file)
    
    for jmh_record in jmh_record_list:
        benchmark_name = jmh_record['benchmark']
        benchmark_name = benchmark_name[benchmark_name.rfind('.') + 1:]
        if 'params' in jmh_record:
            benchmark_name += '_A{}'.format(jmh_record['params']['attrNum'])
            benchmark_name += 'D{}'.format(jmh_record['params']['depth'])
            benchmark_name += 'N{}'.format(jmh_record['params']['nodeNum'])

        score = jmh_record['primaryMetric']['score']
        score_unit = jmh_record['primaryMetric']['scoreUnit']
        
        print('{}: {} {}'.format(benchmark_name, score, score_unit))
