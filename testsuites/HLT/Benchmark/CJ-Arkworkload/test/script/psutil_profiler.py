#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.
import argparse
import logging

import psutil
import subprocess
import time
import pandas as pd


def parse_command_line_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument('--command', dest='command')
    parser.add_argument('--cwd', dest='cwd')
    parser.add_argument('--interval', dest='interval', default=0.1)
    parser.add_argument('--timeout', dest='timeout', default=(10 * 60 * 1e9))
    parser.add_argument('--output', dest='output_file_path')
    return parser.parse_args()


def main():
    arguments = parse_command_line_arguments()
    command = arguments.command
    logger.info('[command to be profiled by psutil]: ', command)
    interval = arguments.interval
    timeout = arguments.timeout
    process = subprocess.Popen(command, shell=True, cwd=arguments.cwd)
    parent_process = psutil.Process(process.pid)

    # 获得起始时间戳, 用于之后计算流逝时间.
    start = int(time.time() * 1e9)

    # CPU使用情况.
    cpu_percent = []
    # 内存使用情况.
    memory_info = {'rss': [], 'vms': [], 'shared': [], 'text': [], 'lib': [], 'data': [], 'dirty': [], 'uss': [],
                   'pss': [], 'swap': []}
    # 时间戳序列, 用作横坐标.
    time_stamps = []

    # 开始数据采集大循环.
    try:

        while parent_process.is_running() and parent_process.status() != psutil.STATUS_ZOMBIE:
            # 首先检查父进程是否已经超时, 因为如果已经超时则应该终止父进程, 同时也终止数据采集.
            elapsed = int(time.time() * 1e9) - start
            
            # if timeout is not None and elapsed > timeout:
            #     # 父进程已超时, 将父进程kill掉.
            #     process.kill()
            #     # 退出数据采集大循环.
            #     break

            # 获取当前时间戳.
            time_stamps.append(elapsed)

            # 将采集父进程数据的逻辑包在try-except块中, 以防父进程突然终止.
            try:
                # 采集当前父进程的CPU使用情况.
                if parent_process.children(recursive=True):
                    cpu_percent.append(parent_process.cpu_percent())
                else:
                    cpu_percent.append(parent_process.cpu_percent(interval=interval))

                # 采集当前父进程的内存使用情况.
                memory_full_info = parent_process.memory_full_info()
                memory_info['rss'].append(memory_full_info.rss)
                memory_info['vms'].append(memory_full_info.vms)
                memory_info['shared'].append(memory_full_info.shared)
                memory_info['text'].append(memory_full_info.text)
                memory_info['lib'].append(memory_full_info.lib)
                memory_info['data'].append(memory_full_info.data)
                memory_info['dirty'].append(memory_full_info.dirty)
                memory_info['uss'].append(memory_full_info.uss)
                memory_info['pss'].append(memory_full_info.pss)
                memory_info['swap'].append(memory_full_info.swap)
            except (psutil.NoSuchProcess, psutil.AccessDenied):
                # 在采集父进程的数据的过程中, 父进程恰好终止了, 于是结束数据采集大循环.
                break

            # 采集当前父进程所有的后代子进程的数据, 包括所有直接和间接创建的子进程.
            for child_process in parent_process.children(recursive=True):
                # 将采集当前遍历到的子进程的数据的逻辑包在try-except块中, 以防当前子进程突然终止.
                try:
                    # 采集当前遍历到的子进程的CPU使用情况.
                    cpu_percent[-1] += child_process.cpu_percent(interval=interval)

                    # 采集当前遍历到的子进程的内存使用情况.
                    memory_full_info = child_process.memory_full_info()
                    memory_info['rss'][-1] += memory_full_info.rss
                    # memory_info['rss'][-1] += memory_full_info.rss
                    memory_info['vms'][-1] += memory_full_info.vms
                    memory_info['shared'][-1] += memory_full_info.shared
                    memory_info['text'][-1] += memory_full_info.text
                    memory_info['lib'][-1] += memory_full_info.lib
                    memory_info['data'][-1] += memory_full_info.data
                    memory_info['dirty'][-1] += memory_full_info.dirty
                    memory_info['uss'][-1] += memory_full_info.uss
                    memory_info['pss'][-1] += memory_full_info.pss
                    memory_info['swap'][-1] += memory_full_info.swap
                except (psutil.NoSuchProcess, psutil.AccessDenied):
                    # 在采集当前遍历到的子进程的数据的过程中, 该进程恰好终止了.这种情况下, 直接跳过该进程的数据采集即可, 继续采集下一个子进程.
                    continue
    except psutil.NoSuchProcess:
        print('unlucky you!')
    # 结束父进程并获取其最后的输出内容.
    stdout, stderr = process.communicate()

    psutil_result_table_header = ['timestamp', 'cpu', 'rss']
    
    while len(cpu_percent) < len(time_stamps):
        cpu_percent.append(cpu_percent[-1])

    mem = ['rss', 'vms', 'shared', 'text', 'lib', 'data', 'dirty', 'uss', 'pss', 'swap']
    for m in mem:
        while len(memory_info[m]) < len(time_stamps):
            memory_info[m].append(memory_info[m][-1])

    r = {'timestamp': time_stamps, 'cpu': cpu_percent}
    for m in mem:
        r[m] = memory_info[m]
    df = pd.DataFrame(r)
    df.to_csv(arguments.output_file_path)


if __name__ == '__main__':
    logger = logging.getLogger('PsutilProfiler')
    main()

