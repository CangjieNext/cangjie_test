#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import json
import os
import platform
import subprocess
import argparse
import sys
from typing import List
import push_to_cptl
import datetime
import time
import psutil

# jenkins工作目录.
WORKSPACE = os.getenv('WORKSPACE')
# 仓颉编译器根目录.
CANGJIE = os.path.join(WORKSPACE, 'cangjie')
# 仓颉工具链根目录.
TOOLS = os.path.join(WORKSPACE, 'tools')
CJPM = os.path.join(TOOLS, 'cpm')
CJCOV = os.path.join(TOOLS, 'cjcov')
LUA2CJ = os.path.join(WORKSPACE, 'lua2cj')
WEBM = os.path.join(WORKSPACE, 'webm-cangjie')
# 仓颉AI根目录.
AI = os.path.join(WORKSPACE, 'ai')
# ninja.build文件所在的目录.
NINJA = os.path.join(CANGJIE, 'build', 'build')
LOG = os.path.join(WORKSPACE, 'log')
CANGJIE_CONFIG = os.path.join(WORKSPACE, 'cangjie.config')

IS_ON_WINDOWS = True if platform.system() == "Windows" else False
if IS_ON_WINDOWS:
    CJC = 'cjc.exe '
    ENCODING = 'utf-8'
else:
    CJC = 'cjc '
    ENCODING = 'utf-8'

ARCH = platform.machine()
if ARCH == 'x86_64':
    ARCH = 'x86'

COMPILATION_TIME = 'Compilation Time(s)'
CANGJIE_SOURCE_SIZE = 'Cangjie Source Size(loc)'
C_CPP_SOURCE_SIZE = 'C/C++ Source Size(loc)'
COMPILATION_EFFICIENCY = 'Compilation Efficiency(s/kloc)'
PEAK_CPU_USAGE = 'Peak CPU Usage(%)'
AVERAGE_CPU_USAGE = 'Average CPU Usage(%)'
PEAK_MEMORY_USAGE = 'Peak Memory Usage(MB)'
AVERAGE_MEMORY_USAGE = 'Average Memory Usage(MB)'
CODE_SIZE = 'Code Size(KB)'

DEFAULT_HEADER = f'{COMPILATION_EFFICIENCY},{COMPILATION_TIME},{CANGJIE_SOURCE_SIZE},{C_CPP_SOURCE_SIZE},{PEAK_CPU_USAGE},{AVERAGE_CPU_USAGE},{PEAK_MEMORY_USAGE},{AVERAGE_MEMORY_USAGE}'
DEFAULT_HEADER_WITH_CODE_SIZE = f'{CODE_SIZE},{COMPILATION_EFFICIENCY},{COMPILATION_TIME},{CANGJIE_SOURCE_SIZE},{C_CPP_SOURCE_SIZE},{PEAK_CPU_USAGE},{AVERAGE_CPU_USAGE},{PEAK_MEMORY_USAGE},{AVERAGE_MEMORY_USAGE}'
headers = {
    'x86/CJPW-Bench(领域级)/AI/cjnative': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/Lua2CJ': DEFAULT_HEADER_WITH_CODE_SIZE,
    'x86/CJPW-Bench(领域级)/WebM': DEFAULT_HEADER_WITH_CODE_SIZE,
    'x86/CJPW-Bench(领域级)/STD/cjnative/compress': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjnative/crypto': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjnative/encoding': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjnative/fuzz': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjnative/net': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjnative/numeric': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjnative/serialization': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjnative/std': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjvm/compress': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjvm/crypto': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjvm/encoding': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjvm/fuzz': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjvm/java8': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjvm/net': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjvm/numeric': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjvm/serialization': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/STD/cjvm/std': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/Tools/cjnative': DEFAULT_HEADER,
    'x86/CJPW-Bench(领域级)/Tools/cjvm': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/AI/cjnative': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjnative/compress': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjnative/crypto': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjnative/encoding': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjnative/fuzz': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjnative/java8': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjnative/net': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjnative/numeric': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjnative/serialization': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjnative/std': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjvm/compress': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjvm/crypto': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjvm/encoding': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjvm/fuzz': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjvm/java8': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjvm/net': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjvm/numeric': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjvm/serialization': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/STD/cjvm/std': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/Tools/cjnative': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/Tools/cjvm': DEFAULT_HEADER,
    'aarch64/CJPW-Bench(领域级)/WebM': DEFAULT_HEADER_WITH_CODE_SIZE,
    'aarch64/CJPW-Bench(领域级)/Lua2CJ': DEFAULT_HEADER_WITH_CODE_SIZE,
}


class MeasurementResult(object):
    def generate(self, header: str):
        record_content = {}
        for item in header.split(','):
            if item == COMPILATION_TIME:
                record_content[COMPILATION_TIME] = {'value': self.compilation_time, 'baseline': 0}
            elif item == CANGJIE_SOURCE_SIZE:
                record_content[CANGJIE_SOURCE_SIZE] = {'value': self.cangjie_source_size, 'baseline': 0}
            elif item == C_CPP_SOURCE_SIZE:
                record_content[C_CPP_SOURCE_SIZE] = {'value': self.c_cpp_source_size(), 'baseline': 0}
            elif item == COMPILATION_EFFICIENCY:
                record_content[COMPILATION_EFFICIENCY] = {'value': self.compilation_efficiency(), 'baseline': 0}
            elif item == PEAK_CPU_USAGE:
                record_content[PEAK_CPU_USAGE] = {'value': self.peak_cpu_usage(), 'baseline': 0}
            elif item == AVERAGE_CPU_USAGE:
                record_content[AVERAGE_CPU_USAGE] = {'value': self.average_cpu_usage(), 'baseline': 0}
            elif item == PEAK_MEMORY_USAGE:
                record_content[PEAK_MEMORY_USAGE] = {'value': self.peak_memory_usage(), 'baseline': 0}
            elif item == AVERAGE_MEMORY_USAGE:
                record_content[AVERAGE_MEMORY_USAGE] = {'value': self.average_memory_usage(), 'baseline': 0}
            elif item == CODE_SIZE:
                record_content[CODE_SIZE] = {'value': self.code_size(), 'baseline': 0}

        return record_content

    def compilation_efficiency(self):
        return float(self.compilation_time) / (float(self.cangjie_source_size) / 1_000)

    def __init__(self, product_path: str, compilation_time, cpu: List[int], rss: List[int], vms: List[int],
                 source_file_names: List[str]):
        self.product_path = product_path
        self.compilation_time = compilation_time
        self.cpu = cpu
        self.rss = rss
        self.vmx = vms

        self.cangjie_source_size = 0
        self.c_source_size = 0
        self.cpp_source_size = 0
        self.c_cpp_header_source_size = 0
        cloc_output = subprocess.check_output(['cloc', f'--read-lang-def={CANGJIE_CONFIG}'] + source_file_names,
                                              text=True)
        for line in cloc_output.split('\n'):
            if line.startswith('Cangjie '):
                self.cangjie_source_size = int(line.split()[-1])
            elif line.startswith('C/C++ Header '):
                self.c_cpp_header_source_size = int(line.split()[-1])
            elif line.startswith('C '):
                self.c_source_size = int(line.split()[-1])
            elif line.startswith('C++ '):
                self.cpp_source_size = int(line.split()[-1])

    def c_cpp_source_size(self):
        return self.c_source_size + self.cpp_source_size + self.c_cpp_header_source_size

    def code_size(self):
        if os.path.exists(self.product_path):
            return os.path.getsize(self.product_path) / 1024
        else:
            print("product not found, please build it properly.")
            sys.exit(0)

    def peak_cpu_usage(self):
        return max(self.cpu)

    def peak_rss(self):
        return max(self.rss)

    def average_cpu_usage(self):
        return sum(self.cpu) / len(self.cpu)

    def average_rss(self):
        return sum(self.rss) / len(self.rss)

    # 单位为MB.
    def peak_memory_usage(self):
        return self.peak_rss() / 1024 / 1024

    def average_memory_usage(self):
        return self.average_rss() / 1024 / 1024


def make_record_entry(directory_path: str, record_name: str, measurement_result: MeasurementResult):
    print(f'make record entry {directory_path}')
    header = headers[directory_path]
    record_content = measurement_result.generate(header)
    summary = []
    summary.append(commit_id)
    summary.append(
        '当前编译效率的计算方法是编译总耗时(Compilation Time)除以仓颉源码行数(Cangjie Source Size), 而并不考虑C/C++源码行数.')

    template = push_to_cptl.template_new(level_str=directory_path, funcName=record_name, result=record_content,
                                         timestamp=time_stamp, summary='\n'.join(summary))

    template['message'] = headers[directory_path]
    table.append(template)
    print('appended.')


def build_cjpm_with(backend: str):
    os.chdir(CJPM)
    command = ''
    if backend == 'cjnative':
        command = f'bash {CJPM}/build.sh'
    elif backend == 'cjvm':
        command = f'bash {CJPM}/build_jet.sh'

    measurement_result = measure(product_name='cjpm', product_path=f'{CJPM}/output/cjpm',
                                 command=command, source_file_names=[CJPM])
    make_record_entry(f'{ARCH}/CJPW-Bench(领域级)/Tools/{backend}', 'cjpm', measurement_result)


def build_cjcov_with(backend: str):
    os.chdir(CJCOV)
    command = ''
    if backend == 'cjnative':
        command = f'bash {CJCOV}/build.sh'
    elif backend == 'cjvm':
        print('cjcov built for cjvm has not been supported yet.')
        sys.exit(0)

    result = measure(product_name='cjcov', product_path=f'{CJCOV}/output/bin/cjcov',
                     command=command, source_file_names=[CJCOV])
    make_record_entry(f'{ARCH}/CJPW-Bench(领域级)/Tools/{backend}', 'cjcov', result)


def build_lua2cj_with(backend: str):
    os.chdir(os.path.join(LUA2CJ, 'dev', 'ACLRuleBasicCmd'))
    command = ''
    if backend == 'cjnative':
        command = 'cjpm build -V'
    elif backend == 'cjvm':
        print('lua2cj built for cjvm has not been supported yet.')
        sys.exit(0)

    result = measure(product_name='lua2cj',
                     product_path=f'{LUA2CJ}/dev/ACLRuleBasicCmd/build/release/ACLRuleBasicCmd/libACLRuleBasicCmd_LuaACL.so',
                     command=command, source_file_names=[f'{LUA2CJ}/dev/ACLRuleBasicCmd'])
    make_record_entry(f'{ARCH}/CJPW-Bench(领域级)/Lua2CJ', 'lua2cj', result)


def build_webm_with(backend: str):
    os.chdir(WEBM)
    command = ''
    if backend == 'cjnative':
        command = f'sudo bash "{WEBM}/build.sh" -a aarch64-hm'
    elif backend == 'cjvm':
        print('webm built for cjvm has not been supported yet.')
        sys.exit(0)

    result = measure(product_name='webm',
                     product_path=f'{WEBM}/output/rpmbuild/BUILD/webm-cangjie/build/webm/webm.elf',
                     command=command,
                     source_file_names=[WEBM])
    make_record_entry(f'{ARCH}/CJPW-Bench(领域级)/WebM', 'webm', result)


def is_source_file_name(file_name: str):
    return file_name.endswith('.cj') \
        or file_name.endswith('.c') \
        or file_name.endswith('.cpp') \
        or file_name.endswith('.h') \
        or file_name.endswith('.hpp')


def get_current_time_stamp():
    return int(datetime.datetime.now().strftime('%Y%m%d%H%M'))


def extract_source_file_names_from(command: str):
    words = command.split()
    source_file_names = list(filter(lambda word: is_source_file_name(word), words))
    while '-p' in words:
        source_file_names.append(words[words.index('-p') + 1])
        words = words[words.index('-p') + 1:]
    return source_file_names


def get_commands():
    # 切换到ninja.build文件所在目录下.
    os.chdir(NINJA)
    # 获取构建仓颉标准库时将运行的命令, 并从中提取出所有真正用于编译构建各个包的命令.
    process = subprocess.Popen("ninja -v -n", shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
    stdout, stderr = process.communicate()
    commands = str(stdout.decode(ENCODING)).splitlines()
    commands_wanted = []
    for command in commands:
        if CJC in command:
            sub_command = command[command.index(CJC):]
            if '-o ' not in command[:command.index(CJC)] \
                    and 'cjc-frontend' not in command:  # exclude '-o cjc' and 'cjc-frontend'.
                commands_wanted.append(sub_command)
    return commands_wanted


def extract_package_signature_from(command: str):
    words = command.split()
    # 获取模块名.
    module_name = 'UNKNOWN'
    if '--module-name' in words:
        module_name = words[words.index('--module-name') + 1]

    # 获取包名.
    package_name = 'UNKNOWN'
    if '--output' in words:
        package_name = words[words.index('--output') + 1].split(os.sep)[-1]
        package_name = package_name[:package_name.rindex('.')]

    if module_name == '' and package_name == '':
        raise Exception('Invalid compilation: {}'.format(command))

    return module_name, package_name


def profile(process, case_interval=0.1, case_timeout=None):
    """
    process: 待采集CPU与内存使用情况的进程.
    case_interval: 信息采集的时间间隔, 单位为秒, 默认时间间隔为0.1秒, 建议时间间隔不小于0.1秒.
    case_timeout: 待采集数据的进程运行多长时间后将被视作超时, 单位为纳秒, 默认不进行超时检查.
    """

    # process是由subprocess.Popen()返回的进程句柄, 由句柄获得进程ID后再由psutil创建进程管理块实例.
    # 这个进程潜在地会创建若干子进程, 所以将其称为父进程.
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
    while parent_process.is_running() and parent_process.status() != psutil.STATUS_ZOMBIE:
        # 首先检查父进程是否已经超时, 因为如果已经超时则应该终止父进程, 同时也终止数据采集.
        elapsed = int(time.time() * 1e9) - start
        if case_timeout is not None and elapsed > case_timeout:
            # 父进程已超时, 将父进程kill掉.
            process.kill()
            # 退出数据采集大循环.
            break

        # 获取当前时间戳.
        time_stamps.append(elapsed)

        # 将采集父进程数据的逻辑包在try-except块中, 以防父进程突然终止.
        try:
            # 采集当前父进程的CPU使用情况.
            if parent_process.children(recursive=True):
                cpu_percent.append(parent_process.cpu_percent())
            else:
                cpu_percent.append(parent_process.cpu_percent(interval=case_interval))

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
                cpu_percent[-1] += child_process.cpu_percent(interval=case_interval)

                # 采集当前遍历到的子进程的内存使用情况.
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
                # 在采集当前遍历到的子进程的数据的过程中, 该进程恰好终止了.这种情况下, 直接跳过该进程的数据采集即可, 继续采集下一个子进程.
                continue

    # 整合采集到的所有数据.
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

    # 结束父进程并获取其最后的输出内容.
    stdout, stderr = process.communicate()

    # 返回采集到的数据以及父进程的退出码.
    return result, process.returncode, stdout, stderr


def measure(product_name: str, product_path: str, command: str, source_file_names: List[str]):
    print('current command under measurement:\n', command)
    # 创建编译进程.
    compilation_process = subprocess.Popen(command, shell=True, stderr=subprocess.PIPE,
                                           stdout=subprocess.PIPE)
    # 采样间隔0.1秒, 超时时间设为5分钟.
    result, return_code, stdout, stderr = profile(process=compilation_process, case_interval=0.1,
                                                  case_timeout=(5 * 60 * 1e9))

    compilation_time = round(result[-1][-1] / 1e9, 3)
    cpu = result[0]
    rss = result[1]
    vms = result[2]

    if return_code != 0:
        print(f'{product_name}: Compilation failed!\n{stderr}')
        # sys.exit(0)
    else:
        print(f'{product_name}: Compilation took {compilation_time} second(s)')

    return MeasurementResult(compilation_time=compilation_time, cpu=cpu, rss=rss, vms=vms,
                             source_file_names=source_file_names, product_path=product_path)


# 编译构建一个单独的仓颉标准库包. 具体编译的是哪一个包蕴含在command中, 需要通过extract_package_signature_from函数提取出来.
def compile_one_package(command: str, backend: str):
    module_name, package_name = extract_package_signature_from(command)
    source_file_names = extract_source_file_names_from(command)

    result = measure(product_name=f'{module_name}.{package_name}', product_path='',
                     command=command, source_file_names=source_file_names)
    make_record_entry(f'{ARCH}/CJPW-Bench(领域级)/STD/{backend}/{module_name}', package_name, result)


def parse_command_line_arguments():
    parser = argparse.ArgumentParser()
    # 选择进行的操作, build指构建产品, push指将性能数据上传至CPLTP.
    parser.add_argument('-a', '--action', type=str, choices=['build_and_push', 'build', 'push'],
                        help='choose an action.', default='build_and_push')
    # 选择本次构建的产品, STD是仓颉标准库, Tools是仓颉工具链, AI是仓颉AI.
    parser.add_argument('-p', '--product', type=str, choices=['std', 'cjpm', 'cjcov', 'ai', 'lua2cj', 'webm'],
                        help='choose a product.', default='std')
    # 选择本次构建的产品的后端采用cjnative还是cjvm.
    parser.add_argument('-b', '--backend', type=str, choices=['cjnative', 'cjvm'], help='choose a backend.',
                        default='cjnative')
    # 指定jenkins版本文件.
    parser.add_argument('-v', '--version-json', type=str, help='specify the version JSON file.')
    return parser.parse_args()


def build_std_with(backend: str):
    for command in get_commands():
        compile_one_package(command, backend)


def build_ai_with(backend: str):
    os.chdir(AI)
    subprocess.run([f'{CJPM}/bin/cjpm', 'clean'])
    command = f'{CJPM}/bin/cjpm build -i --condition="gir,release"'
    result = measure(product_name='AI', product_path='none', command=command,
                     source_file_names=[AI])
    make_record_entry(f'{ARCH}/CJPW-Bench(领域级)/AI/{backend}', 'ai', result)


def build(product: str, backend: str):
    if product == 'std':
        build_std_with(backend=backend)
    elif product == 'cjpm':
        build_cjpm_with(backend=backend)
    elif product == 'cjcov':
        build_cjcov_with(backend=backend)
    elif product == 'ai':
        build_ai_with(backend=backend)
    elif product == 'lua2cj':
        build_lua2cj_with(backend=backend)
    elif product == 'webm':
        build_webm_with(backend=backend)
    else:
        print('Invalid product name has been supplied.')
        sys.exit(0)

    with open(os.path.join(LOG, f'{product}-{backend}.log'), 'w') as log_file:
        print(table)
        json.dump(table, log_file)


def push(product: str, backend: str):
    with open(os.path.join(LOG, f'{product}-{backend}.log'), 'r') as log_file:
        result = json.load(log_file)
        print(result)
        push_to_cptl.post_one_url_new(result, arguments.version_json)


if __name__ == '__main__':
    # 获取本次运行的时间戳.
    time_stamp = get_current_time_stamp()
    # 解析命令行参数.
    arguments = parse_command_line_arguments()
    # 将cjc的版本输出信息作为commit id.
    commit_id = subprocess.check_output(['cjc', '-v']).decode('utf-8')
    # 保存本次运行结果的表
    table = []
    if arguments.action == 'build':
        build(product=arguments.product, backend=arguments.backend)
    elif arguments.action == 'push':
        push(product=arguments.product, backend=arguments.backend)
    elif arguments.action == 'build_and_push':
        build(product=arguments.product, backend=arguments.backend)
        push(product=arguments.product, backend=arguments.backend)
