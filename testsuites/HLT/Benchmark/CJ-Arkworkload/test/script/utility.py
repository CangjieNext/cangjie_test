#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import logging
import os
import datetime

ohos_dir_path = 'D:\\wbt\\ohos_projects'
workspace_dir_path = os.getenv('WORKSPACE_DIR_PATH', 'D:\\wbt\\workspace')
scripts_dir_path = os.path.join(workspace_dir_path, 'scripts')
testsuites_dir_path = os.path.join(ohos_dir_path, 'testsuites')
benchmarks_dir_path = os.path.join(ohos_dir_path, 'benchmarks')
arkui_benchmarks_dir_path = os.path.join(benchmarks_dir_path, 'arkui_benchmarks')
public_api_benchmarks_dir_path = os.path.join(benchmarks_dir_path, 'public_api_benchmarks')
public_api_testsuites_dir_path = os.path.join(testsuites_dir_path, 'public_api_testsuites')
samples_dir_path = os.path.join(workspace_dir_path, 'samples')
arkts_interop_benchmarks_dir_path = os.path.join(ohos_dir_path, 'benchmarks', 'arkts_interop_benchmarks')
arkts_interop_testsuites_dir_path = os.path.join(ohos_dir_path, 'testsuites', 'arkts_interop_testsuites')
benchmark_cffi_dir_path = os.path.join(ohos_dir_path, 'benchmark_cffi')
benchmark_java_dir_path = os.path.join(ohos_dir_path, 'benchmark_java')
arkui_testsuites_dir_path = os.path.join(ohos_dir_path, 'testsuites', 'arkui_testsuites', 'cangjie_empty')

# Mate60
# sn = '23E0224227014766'
# results_dir_path = os.path.join(workspace_dir_path, 'results.mate60')
# X50
# sn = '68Q0123327000116'
# results_dir_path = os.path.join(workspace_dir_path, 'results.x50')
# Mate60Pro
sn = '2MM0224131068410'
results_dir_path = os.path.join(workspace_dir_path, 'results.mate60pro')

reports_dir_path = os.path.join(workspace_dir_path, 'reports')
public_api_benchmark_results_dir_path = os.path.join(results_dir_path, 'public_api_benchmark_results')
public_api_testsuite_results_dir_path = os.path.join(results_dir_path, 'public_api_testsuite_results')
arkts_interop_benchmark_results_dir_path = os.path.join(results_dir_path, 'arkts_interop_benchmark_results')
arkts_interop_testsuite_results_dir_path = os.path.join(results_dir_path, 'arkts_interop_testsuite_results')
mixed_testsuite_dir_path = os.path.join(ohos_dir_path, 'testsuites', 'arkui_testsuites', 'cangjie_hybrid')
mixed_testsuite_results_dir_path = os.path.join(results_dir_path, 'mixed_results')
arkui_testsuite_results_dir_path = os.path.join(results_dir_path, 'arkui_testsuite_results')
dependencies_dir_path = os.path.join(ohos_dir_path, 'dependencies')
timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M')
os.environ['version_json_file_path'] = 'D:\\workspace\\daily\\version.json'

# sn = os.environ['SERIAL_NUMBER']
DEVECO_HOME = 'D:\\ohos_cangjie_ci\\deveco-studio-5.0.3.423.win\\deveco-studio'
NODE = os.path.join(DEVECO_HOME, 'tools', 'node', 'node.exe')
hvigorw = os.path.join(DEVECO_HOME, 'tools', 'hvigor', 'bin', 'hvigorw.js')


logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('app.log'),
        logging.StreamHandler()
    ]
)
