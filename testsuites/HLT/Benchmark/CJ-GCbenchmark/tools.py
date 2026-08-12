# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import time
import subprocess
import psutil
from pathlib import Path

def current_time():
    time_checkoutpoint = time.time()
    timeArry = time.localtime(time_checkoutpoint)
    checkoutpoint = time.strftime("%Y-%m-%d %H:%M:%S", timeArry)
    return checkoutpoint


def call(cmd, shell=False, filename=None, env=None):
    if filename is None:
        cmd_p = subprocess.Popen(cmd, env=env, encoding="utf-8", shell=shell)
        if shell:
            actual_cmd = cmd
        else:
            actual_cmd = " ".join(cmd)
    else:
        with open(filename) as f:
            cmd_p = subprocess.Popen(cmd, stdin=f, env=env, encoding="utf-8", shell=shell)
        if shell:
            actual_cmd = cmd + " < {}".format(filename)
        else:
            actual_cmd = " ".join(cmd) + " < {}".format(filename)
    return cmd_p, actual_cmd


def file_list_handle(path, sub_dir=False, suffix_list=[]):
    """
	path：输入路径，支持文件路径和文件夹路径
    sub_dir：当为True时含子目录，为False时不含子目录
    suffix_list：文件类型列表，按要求的列出全部符合条件的文件，为空时列出全部文件，如：[".xlsx",".xls"]
	"""
    file_list = []
    if not suffix_list:
        if sub_dir:
            [suffix_list.append(Path(f).suffix) for f in Path(path).glob(f"**/*.*") if Path(f).is_file()]
        else:
            [suffix_list.append(Path(f).suffix) for f in Path(path).glob(f"*.*") if Path(f).is_file()]
        suffix_list = list(set(suffix_list))

    if Path(path).exists():
        # 目标为文件夹
        if Path(path).is_dir():
            if sub_dir:
                for i in suffix_list:
                    [file_list.append(str(f)) for f in Path(path).glob(f"**/*{i}")]
            else:
                [file_list.append(str(f)) for f in Path(path).iterdir() if Path(f).is_file and f.suffix in suffix_list]
        elif Path(path).is_file():
            file_list = [path]

        # 去除临时文件
        file_list_temp = []
        for y in file_list:
            if "~$" in Path(y).stem:
                continue
            file_list_temp.append(y)
        file_list = file_list_temp
        return file_list
    else:
        print(path)
        print("1输入有误！")
        return []

def dir_list_handle(path):
    """
	path：输入路径，支持文件夹路径
	"""
    dir_list = []

    if Path(path).exists():
        # 目标为文件夹
        if Path(path).is_dir():
            [dir_list.append(str(f)) for f in Path(path).iterdir() if Path(f).is_dir()]
        else:
            print("2输入有误！")
            return []
        return dir_list
    else:
        print("3输入有误！")
        return []

def get_type_list(path):
    """
	path：输入路径
	"""
    type_list = []
    if Path(path).exists() and Path(path).is_dir():
        [type_list.append(str(f).split('.')[-1]) for f in Path(path).iterdir() if Path(f).is_file()]
        type_list = list(set(type_list))
        return type_list
    else:
        print("4输入有误！")
        return []

def get_memory(process, case_interval=0.1, case_timeout=None):
    """
    process：待采集CPU与内存使用情况的进程。
    case_interval：信息采集的时间间隔，单位为秒，默认时间间隔为0.1秒，建议时间间隔不小于0.1秒。
    case_timeout：待采集数据的进程运行多长时间后将被视作超时，单位为纳秒，默认不进行超时检查。
    """

    # process是由subprocess.Popen()返回的进程句柄，由句柄获得进程ID后再由psutil创建进程管理块实例。
    # 这个进程潜在地会创建若干子进程，所以将其称为父进程。
    
    # 获得起始时间戳，用于之后计算流逝时间。
    start = int(time.time() * 1e9)

    parent_process = psutil.Process(process.pid)

    # CPU使用情况。
    cpu_percent = []
    # 内存使用情况。
    memory_info = { 'rss': [], 'vms': [], 'shared': [], 'text': [], 'lib': [], 'data': [], 'dirty': [], 'uss': [], 'pss': [], 'swap': [] }
    # 时间戳序列，用作横坐标。
    time_stamps = []
    
    # 开始数据采集大循环。
    while parent_process.is_running() and parent_process.status() != psutil.STATUS_ZOMBIE:
        # 首先检查父进程是否已经超时，因为如果已经超时则应该终止父进程，同时也终止数据采集。
        elapsed = int(time.time() * 1e9) - start
        if case_timeout is not None and elapsed > case_timeout:
            # 父进程已超时，将父进程kill掉。
            process.kill()
            # 退出数据采集大循环。
            break

        # 获取耗时。
        time_stamps.append(elapsed)

        # 将采集父进程数据的逻辑包在try-except块中，以防父进程突然终止。
        try:
            # 采集当前父进程的CPU使用情况。
            if parent_process.children(recursive=True):
                cpu_percent.append(parent_process.cpu_percent())
            else:
                cpu_percent.append(parent_process.cpu_percent(interval=case_interval))
            
            # 采集当前父进程的内存使用情况。
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
            # 在采集父进程的数据的过程中，父进程恰好终止了，于是结束数据采集大循环。
            break
        
        # 采集当前父进程所有的后代子进程的数据，包括所有直接和间接创建的子进程。
        for child_process in parent_process.children(recursive=True):
            # 将采集当前遍历到的子进程的数据的逻辑包在try-except块中，以防当前子进程突然终止。
            try:
                # 采集当前遍历到的子进程的CPU使用情况。
                cpu_percent[-1] += child_process.cpu_percent(interval=case_interval)

                # 采集当前遍历到的子进程的内存使用情况。
                memory_full_info = child_process.memory_full_info()
                memory_info['rss'][-1] += memory_full_info.rss
                memory_info['rss'][-1] += memory_full_info.rss
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
                # 在采集当前遍历到的子进程的数据的过程中，该进程恰好终止了。这种情况下，直接跳过该进程的数据采集即可，继续采集下一个子进程。
                continue

    # 整合采集到的所有数据。
    result = []
    result.append(cpu_percent)
    result.append(memory_info["rss"])
    result.append(memory_info["vms"])
    result.append(memory_info["shared"])
    result.append(memory_info["text"])
    result.append(memory_info["lib"])
    result.append(memory_info["data"])
    result.append(memory_info["dirty"])
    result.append(memory_info["uss"])
    result.append(memory_info["pss"])
    result.append(memory_info["swap"])
    result.append(time_stamps)
    
    # 结束父进程并获取其最后的输出内容。
    outs, errs = process.communicate()
    
    # 返回采集到的数据以及父进程的退出码。
    return result, process.returncode
