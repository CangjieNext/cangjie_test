#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import json
import math
import requests
import smtplib
import argparse
import os.path
from datetime import datetime, timedelta
from push_to_cptl import token
from email.header import Header
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.image import MIMEImage
import matplotlib.pyplot as plt
from functools import reduce
from bs4 import BeautifulSoup

cur_path = os.path.dirname(os.path.abspath(__file__))

# run `nohup http-server 
home_dir = ''
http_date_dir = 'http://10.175.96.30:8080/'

from_addr = ""
all_to_addrs = [
]
one_to_addrs = []
productName = 'Cangjie'

# 劣化阈值，当劣化超过该阈值时，邮件中会画出劣化用例的折线图
threshold = 0.1

# 劣化的用例列表
total_case = ''
total_num = 0

# 新增劣化用例
new_add_case = ''
new_add_num = 0

benchmarks_game_name = 'Benchmark_Game'
oo_benchmark_name = 'Object_Orient_Benchmark'
concurrency_benchmark_name = 'Concurrency_Benchmark'
linaro_benchmark_name = 'Linaro_Benchmark'
micro_benchmark_name = 'Micro-Bench(原子级)'
workload_benchmark_name = 'CJ-ArkWorkload'
compile_std_name = 'STD'
taibai_name = 'TAIBAI'
metadsl_name = 'MetaDSL'
webm_name = 'WebM'
workload_compile_name = 'CJ-ArkWorkload-Compile'
workload_ohos_cosesize_name = 'CJ-ArkWorkload'
std_ohos_cosesize_name = 'STD'

benchmark_suite_dict = {
    benchmarks_game_name: {'llvmgc_cj', 'cjvm_cj'},
    oo_benchmark_name: {'llvmgc_cj', 'cjvm_cj'},
    concurrency_benchmark_name: {'llvmgc_cj', 'cjvm_cj'}, 
    linaro_benchmark_name: {'llvmgc_cj', 'cjvm_cj'},
    workload_benchmark_name: {'Cangjie', 'OHOS'},
    micro_benchmark_name: {'llvmgc_cj', 'cjvm_cj'},
    compile_std_name: {'Cangjie Compilation Efficiency(s/kloc)', 'Cangjie Peak Memory(MB)', 'Code Size(KB)'},
    taibai_name: {'elfSize(MB)', 'Compile efficiency(s/kloc)', 'memory_max(MB)'},
    metadsl_name: {'Code Size(KB)', 'Compilation Efficiency(s/kloc)', 'Peak Memory Usage(MB)'},
    webm_name: {'Code Size(KB)', 'Compilation Efficiency(s/kloc)', 'Peak Memory Usage(MB)'},
    workload_compile_name: {'Cangjie Compilation Time(s)'},
    workload_ohos_cosesize_name : {'CodeSize(B)', 'CodeSize(B)/SourceSize(loc)'},
    std_ohos_cosesize_name : {'Code Size(KB)', 'Compilation Efficiency(s/kloc)', 'Peak Memory Usage(MB)'}
}

micro_benchmark_info = [
    'array',
    'atomic',
    'cffi',
    'client_http',
    'client_http2',
    'client_https',
    'collections_arraylist',
    'collections_cmap',
    'collections_hashmap',
    'collections_hashset',
    'concurrency',
    'convert',
    'createobject',
    'expression',
    'filestream',
    'gzip',
    'http',
    'http2',
    'https',
    'io',
    'json',
    'lambda',
    'libast_api',
    'libast_scene',
    'log',
    'loop',
    'oldjson',
    'objectpool',
    'override',
    'regex',
    'serialize',
    'server_http',
    'server_http2',
    'server_https',
    'string',
    'stringbuilder',
    'url'
]

color_dict = {
    'llvmgc_cj': 'red',
    'cjvm_cj': 'green',
    'Cangjie': 'red',
    'OHOS': 'green',
    'go': 'blue',
    'swift': 'yellow',
    'java': 'black',
    'loom': 'black',
    'Cangjie Compilation Efficiency(s/kloc)': 'red',
    'Cangjie Peak Memory(MB)': 'green',
    'elfSize(MB)': 'red', 
    'Compile efficiency(s/kloc)': 'green', 
    'memory_max(MB)': 'blue',
    'Cangjie Compilation Time(s)': 'red'
}

image_dir = {}
image_num = 0

def calculate_rate(a, b):
    c = []
    for i in range(len(a)):
        if b[i] == 0:
            c.append(0)
        else:
            c.append(round(a[i] / b[i], 5))
    return c


def send_email(html_txt, user_info, to_addrs):
    smtp_server = ""
    server = smtplib.SMTP(smtp_server, 25)
    server.set_debuglevel(1)
    server.login(user_info[0], user_info[1])
    message = MIMEMultipart()
    message['To'] = ";".join(to_addrs)
    message['From'] = Header("Cangjie Benchmark Daily 性能劣化汇总", 'utf-8')
    subject = 'Cangjie Benchmark Daily 性能劣化汇总'
    message['Subject'] = Header(subject, 'utf-8').encode()
    part_html = MIMEText(html_txt, "html", "utf-8")
    message.attach(part_html)

    for i in image_dir:
        with open(image_dir[i], 'rb') as f:
            tmp_img = MIMEImage(f.read())
            tmp_img.add_header('Content-ID', '<{}>'.format(i))
            message.attach(tmp_img)

    server.sendmail(from_addr, to_addrs, message.as_string())
    server.quit()


def get_one_timestamp_result(timestamp, level_str):
    header = {'Content-Type': 'application/json',
              'Authorization': token()}
    body = {'productName': productName,
            'levelStr': level_str,
            'timestamp': [timestamp]}
    r = requests.post(
        url='',
        headers=header,
        data=json.dumps(body)
    )
    x = json.loads(r.content)
    return x


def get_all_timestamp(productName, level_str):
    header = {'Content-Type': 'application/json',
              'Authorization': token()}
    params = {'productName': productName,
              'level_str': level_str,
              'page': 100,
              'pageSize': 100, }

    time_result = requests.get(
        url='',
        headers=header,
        params=params
    )
    x = json.loads(time_result.content)
    timestamps = x['data']['list']
    return timestamps


def get_all_result(productName, level_str):
    # 获取看板时间戳
    timestamps = get_all_timestamp(productName, level_str)
    case_result = []
    # 取近15天的数据
    data_len = min(15, (len(timestamps)))
    new_timestamp = []
    for i in range(data_len):
        timestamp = timestamps[i]['timeStamp']
        new_timestamp.append(timestamp)
        one_result = get_one_timestamp_result(timestamp, level_str)
        case_result.append(one_result)
    return case_result, new_timestamp


def get_benchmark_suite_result(level_str, suite_name):
    # 通过时间戳获取近15天的数据
    result, timestamps = get_all_result(productName, level_str)
    temp = {}
    for i in result:
        for j in i['data']['data']:
            cur_funcname = j['funcName']
            for one_lang in j['result']:
                cur_data = j['result'][one_lang]['value']
                if one_lang in benchmark_suite_dict[suite_name]:
                    if cur_funcname not in temp.keys():
                        temp[cur_funcname] = {}
                    if one_lang not in temp[cur_funcname].keys():
                        temp[cur_funcname][one_lang] = [cur_data]
                    else:
                        temp[cur_funcname][one_lang].append(cur_data)
    return temp, timestamps


def save_pic_and_add_link_to_html(case_name, ts, level_str):
    case_name = case_name.replace('#', '_').replace('/', '_').replace(' ', '_')
    base_dir = home_dir + 'performance_degradation_results/{}/{}/'.format(ts, level_str)
    if not os.path.exists(base_dir):
        os.makedirs(base_dir)
    pic_name = '{}/{}.png'.format(base_dir, case_name)
    if os.path.exists(pic_name):
        os.remove(pic_name)
    plt.savefig(pic_name)
    # make sure your http-server start in cur dir.
    result = '''Result Picture : <a href = {} > {} </a><br>'''.format(
        http_date_dir + pic_name.replace(home_dir + 'performance_degradation_results', ''), '{}.png'.format(case_name))
    plt.close()
    return result


# will not draw pic. only for display.
def show_pic_on_html(case_name, ts, level_str):
    case_name = case_name.replace('#', '_').replace('/', '_').replace(' ', '_')
    base_dir = home_dir + 'performance_degradation_results/{}/{}/'.format(ts, level_str)
    pic_name = '{}/{}.png'.format(base_dir, case_name)
    url = http_date_dir + pic_name.replace(home_dir + 'performance_degradation_results', '')
    global image_num
    image_num += 1
    image_dir['image{}'.format(image_num)] = pic_name
    # return '''<img src = {} ><br>'''.format(url)
    return '''<img src = "cid:{}" ><br>'''.format('image{}'.format(image_num))


def update_timestamp(x):
    return str(x)[:8]


# dict {data_1: [a,b,c,d,e],data_2:[a,b,c,d,e]}
def draw_one_graph(timestamp, datas: dict, case_name='test', y_label='time', level_str=''):
    plt.rcParams['figure.figsize'] = (10, 5)
    x_dates = [update_timestamp(ts) for ts in timestamp]
    ticks = x_dates[::-1]
    fig, ax = plt.subplots()
    for name in datas.keys():
        color = 'blue'
        if name in color_dict.keys():
            color = color_dict[name]
        cur_data = datas[name][::-1]
        if len(ticks) > len(cur_data):
            #  this means
            #  time  1 2 3
            #  case_a x x x
            #  case_b x x
            #  case_b`s some value is lost.
            temp = [0 for i in range(len(ticks) - len(cur_data))]
            cur_data = temp + cur_data
            # Fill in 0 at the beginning of the data, which is the earlier part of the time.

        if name == "llvmgc_cj":
            name_label = "cjnative_cj"
        else:
            name_label = name
        if len(ticks) < len(cur_data):
            cur_data = cur_data[:len(ticks)]
        plt.plot(ticks, cur_data, label=name_label, linewidth=2, color=color, marker='o', markeredgecolor='black')
        for i, val in enumerate(cur_data):
            ax.annotate(str(val), (ticks[i], val), textcoords="offset points", xytext=(0, 10), ha='center')
    plt.title(case_name[1:])
    ax.set_xticks(ticks)
    ax.set_xticklabels(ticks, rotation=45)
    plt.xlabel('date')
    plt.ylabel(y_label)
    plt.ylim(0)
    plt.tick_params(top='off', right='off')
    fig.autofmt_xdate(rotation=45)
    plt.legend()

    return save_pic_and_add_link_to_html(case_name, x_dates[0], level_str)


def geometric_mean(numbers):
    numbers_without_zeros = [num for num in numbers if num > 0]
    if len(numbers_without_zeros) == 0:
        return 0
    log_sum = sum(math.log(num) for num in numbers_without_zeros)
    return round(math.exp(log_sum / len(numbers_without_zeros)), 2)


# cur_data should be get from get_one_timestamp_result(timestamp,level_str)
def store_one_result_to_dict(cur_dict, cur_data, test_suite_name=benchmarks_game_name):
    for j in cur_data['data']['data']:
        cur_funcname = j['funcName']
        for one_lang in j['result']:
            cur_data = j['result'][one_lang]['value']
            if one_lang in benchmark_suite_dict[test_suite_name]:
                if cur_funcname not in cur_dict.keys():
                    cur_dict[cur_funcname] = {}
                if one_lang not in cur_dict[cur_funcname].keys():
                    cur_dict[cur_funcname][one_lang] = cur_data
    return cur_dict


def get_cur_and_last_result(productName, level_str, test_suite_name=benchmarks_game_name):
    timestamps = get_all_timestamp(productName, level_str)  # len should >= 2
    if (len(timestamps) == 0):
        return None, None, (None, None)
    cur = get_one_timestamp_result(timestamps[0]['timeStamp'], level_str)
    if len(timestamps) > 1:
        last = get_one_timestamp_result(timestamps[1]['timeStamp'], level_str)
    else:
        last = cur
    cur_dict = {}
    cur_dict = store_one_result_to_dict(cur_dict, cur, test_suite_name=test_suite_name)

    last_dict = {}
    last_dict = store_one_result_to_dict(last_dict, last, test_suite_name=test_suite_name)
    return cur_dict, last_dict, (cur['data']['data'][0]['timeStamp'], last['data']['data'][0]['timeStamp'])



def draw_table(data, title, ts, level_str, text, size=(13, 2), input_fontsize=12, text_y=0.9):
    fig, ax = plt.subplots(figsize=size)
    ax.axis('off')
    ax.axis('tight')
    table = ax.table(cellText=data, cellLoc='center', loc='center')
    table.auto_set_font_size(False)
    table.set_fontsize(input_fontsize)
    table.scale(1, 1.5)
    ax.set_title(title, fontsize=16)
    ax.text(0.5, text_y, text, horizontalalignment='center', fontsize=14, transform=ax.transAxes)
    return save_pic_and_add_link_to_html(title, ts, level_str)


def calculated_rate(numerator, denominator):
    if float(denominator) <= 0.0:
        return 0        
    return (float(numerator) - float(denominator)) / float(denominator)

def check_for_benchmarks(res, level_str, timestamps):
    global send_reason_new
    global send_reason_old
    global total_case
    global new_add_case
    global total_num
    global new_add_num
    for iCase in res.keys():
        flag = 0
        new_add = 0
        case_value = res[iCase]
        for one_lang in case_value.keys():
            if len(case_value[one_lang]) < 6:
                continue
            # 计算前x天和后y天的比值，劣化超过阈值则会在邮件中绘制折线图
            if (calculated_rate(case_value[one_lang][0], case_value[one_lang][3]) > threshold and \
                calculated_rate(case_value[one_lang][1], case_value[one_lang][4]) > threshold and \
                calculated_rate(case_value[one_lang][2], case_value[one_lang][5]) > threshold):
                new_add = 1
                flag = 1
                break
            if (len(case_value[one_lang]) >= 8 and \
                calculated_rate(case_value[one_lang][0], case_value[one_lang][4]) > threshold and \
                calculated_rate(case_value[one_lang][1], case_value[one_lang][5]) > threshold and \
                calculated_rate(case_value[one_lang][2], case_value[one_lang][6]) > threshold and \
                calculated_rate(case_value[one_lang][3], case_value[one_lang][7]) > threshold) or \
               (len(case_value[one_lang]) >= 10 and \
                calculated_rate(case_value[one_lang][0], case_value[one_lang][5]) > threshold and \
                calculated_rate(case_value[one_lang][1], case_value[one_lang][6]) > threshold and \
                calculated_rate(case_value[one_lang][2], case_value[one_lang][7]) > threshold and \
                calculated_rate(case_value[one_lang][3], case_value[one_lang][8]) > threshold and \
                calculated_rate(case_value[one_lang][4], case_value[one_lang][9]) > threshold) :
                flag = 1
                break
        
        if flag == 1:
            # 画图
            draw_one_graph(timestamps, res[iCase], iCase, level_str=level_str)
            cur_reason = 'Performance Degradation: [case]: {}/{}  [date]: {}  [trend]: lower is better<br>'.format(
                level_str,
                iCase[1:],
                timestamps[0])
            if new_add == 1 and (timestamps[0]//10000 == current_date or timestamps[0]//10000 == previous_date1 or timestamps[0]//10000 == previous_date2):
                # 链接图片位置
                send_reason_new += cur_reason + show_pic_on_html(iCase, timestamps[0]//10000, level_str)
                new_add_case += cur_reason
                new_add_num += 1
            else:
                # 链接图片位置
                send_reason_old += cur_reason + show_pic_on_html(iCase, timestamps[0]//10000, level_str)
                total_case += cur_reason
                total_num += 1

            
    return


def check_for_benchmarks_conver(res, level_str, timestamps):
    global send_reason_new
    global send_reason_old
    global total_case
    global new_add_case
    global total_num
    global new_add_num
    for iCase in res.keys():
        flag = 0
        new_add = 0
        case_value = res[iCase]
        for one_lang in case_value.keys():
            if len(case_value[one_lang]) < 6:
                continue
            if case_value[one_lang][0] == 0 or case_value[one_lang][1] == 0 or \
               case_value[one_lang][2] == 0 or case_value[one_lang][3] == 0 or \
               case_value[one_lang][4] == 0 or case_value[one_lang][5] == 0 or \
               case_value[one_lang][6] == 0 or case_value[one_lang][7] == 0 or \
               case_value[one_lang][8] == 0 or case_value[one_lang][9] == 0:
               continue
            # 计算前x天和后y天的比值，劣化超过5%则会在邮件中绘制折线图
            if (calculated_rate(1/case_value[one_lang][0], 1/case_value[one_lang][3]) > threshold and \
                calculated_rate(1/case_value[one_lang][1], 1/case_value[one_lang][4]) > threshold and \
                calculated_rate(1/case_value[one_lang][2], 1/case_value[one_lang][5]) > threshold):
                new_add = 1
                flag = 1
                break

            if (len(case_value[one_lang]) >= 8 and \
                calculated_rate(1/case_value[one_lang][0], 1/case_value[one_lang][4]) > threshold and \
                calculated_rate(1/case_value[one_lang][1], 1/case_value[one_lang][5]) > threshold and \
                calculated_rate(1/case_value[one_lang][2], 1/case_value[one_lang][6]) > threshold and \
                calculated_rate(1/case_value[one_lang][3], 1/case_value[one_lang][7]) > threshold) or \
               (len(case_value[one_lang]) >= 10 and \
                calculated_rate(1/case_value[one_lang][0], 1/case_value[one_lang][5]) > threshold and \
                calculated_rate(1/case_value[one_lang][1], 1/case_value[one_lang][6]) > threshold and \
                calculated_rate(1/case_value[one_lang][2], 1/case_value[one_lang][7]) > threshold and \
                calculated_rate(1/case_value[one_lang][3], 1/case_value[one_lang][8]) > threshold and \
                calculated_rate(1/case_value[one_lang][4], 1/case_value[one_lang][9]) > threshold) :
                flag = 1
                break
        
        if flag == 1:
            # 画图
            draw_one_graph(timestamps, res[iCase], iCase, level_str=level_str)
            cur_reason = 'Performance Degradation: [case]: {}/{}  [date]: {}  [trend]: higher is better<br>'.format(
                level_str,
                iCase[1:],
                timestamps[0])

            if new_add == 1 and (timestamps[0]//10000 == current_date or timestamps[0]//10000 == previous_date1 or timestamps[0]//10000 == previous_date2):
                # 链接图片位置
                send_reason_new += cur_reason + show_pic_on_html(iCase, timestamps[0]//10000, level_str)
                new_add_case += cur_reason
                new_add_num += 1
            else:
                # 链接图片位置
                send_reason_old += cur_reason + show_pic_on_html(iCase, timestamps[0]//10000, level_str)
                total_case += cur_reason
                total_num += 1
    return


'''
----------------------------------------------------------------------------
-----------------------------  Benchmark_Game  -----------------------------
----------------------------------------------------------------------------
'''


def gather_benchmarks_result(arch='aarch64', testitem='Execution_Time'):
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', benchmarks_game_name, testitem])
    res, timestamps = get_benchmark_suite_result(level_str, benchmarks_game_name)
    check_for_benchmarks(res, level_str, timestamps)

def benchmark_game():
    gather_benchmarks_result('aarch64', 'Execution_Time')
    gather_benchmarks_result('x86', 'Execution_Time')
    gather_benchmarks_result('aarch64', 'Memory_Peak')
    gather_benchmarks_result('x86', 'Memory_Peak')
    gather_benchmarks_result('aarch64', 'Memory')
    gather_benchmarks_result('x86', 'Memory')
    gather_benchmarks_result('aarch64', 'CPU')
    gather_benchmarks_result('x86', 'CPU')


'''
-------------------------------------------------------------------------------------
-----------------------------  Object_Orient_Benchmark  -----------------------------
-------------------------------------------------------------------------------------
'''


def gather_oo_benchmark_result(arch='aarch64', testitem='Execution_Time'): 
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', oo_benchmark_name, testitem])
    res, timestamps = get_benchmark_suite_result(level_str, oo_benchmark_name)
    if (testitem == 'Memory_Allocation'):
        check_for_benchmarks_conver(res, level_str, timestamps)
    else:
        check_for_benchmarks(res, level_str, timestamps)



def object_orient_benchmark():
    # Execution_Time
    gather_oo_benchmark_result('aarch64')
    gather_oo_benchmark_result('x86')

    # Memory_Allocation
    gather_oo_benchmark_result('aarch64', 'Memory_Allocation')
    gather_oo_benchmark_result('x86', 'Memory_Allocation')

    return


'''
-----------------------------------------------------------------------------------
-----------------------------  Concurrency_Benchmark  -----------------------------
-----------------------------------------------------------------------------------
'''

def gather_concurrency_benchmark_result(arch='aarch64', testitem='Execution_Time'):
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', concurrency_benchmark_name, testitem])
    res, timestamps = get_benchmark_suite_result(level_str, concurrency_benchmark_name)
    if (testitem == 'Throughput'):
        check_for_benchmarks_conver(res, level_str, timestamps)
    else:
        check_for_benchmarks(res, level_str, timestamps)



def concurrency_benchmark():
    global summary_pics
    concurrency_case_info = {
        'Execution_Time': 'Execution_Time(s), lower is better.',
        'Memory_Peak': 'Memory_Peak(kb), lower is better.',
        'Throughput': 'Throughput(op/ms), higher is better.'
    }
    for i in concurrency_case_info.keys():
        gather_concurrency_benchmark_result('aarch64', i)
        gather_concurrency_benchmark_result('x86', i)
    return 


'''
-----------------------------------------------------------------------------
-----------------------------  Micro_Benchmark  -----------------------------
-----------------------------------------------------------------------------
'''


def gather_micro_benchmark_result(arch='aarch64', case_name='array'):  # array or others.
    level_str = '/'.join([arch, micro_benchmark_name, 'Execution_Time', case_name])
    res, timestamps = get_benchmark_suite_result(level_str, micro_benchmark_name)
    check_for_benchmarks(res, level_str, timestamps)


def micro_bench():
    for i in micro_benchmark_info:
        gather_micro_benchmark_result('aarch64', i)
        
    for i in micro_benchmark_info:
        gather_micro_benchmark_result('x86', i)
    return


'''
-----------------------------------------------------------------------------
-----------------------------  Linaro_Benchmark  -----------------------------
-----------------------------------------------------------------------------
'''


def gather_linaro_benchmark_result(arch='aarch64', case_name='algorithm'):  # array or others.
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', linaro_benchmark_name, 'Execution_Time', case_name])
    res, timestamps = get_benchmark_suite_result(level_str, linaro_benchmark_name)
    check_for_benchmarks(res, level_str, timestamps)


def linaro_benchmark():
    gather_linaro_benchmark_result('aarch64', 'algorithm')
    gather_linaro_benchmark_result('aarch64', 'caffeinemark')
    gather_linaro_benchmark_result('aarch64', 'micro')
    gather_linaro_benchmark_result('aarch64', 'stanford')
        
    gather_linaro_benchmark_result('x86', 'algorithm')
    gather_linaro_benchmark_result('x86', 'caffeinemark')
    gather_linaro_benchmark_result('x86', 'micro')
    gather_linaro_benchmark_result('x86', 'stanford')
    return



def gather_workload_benchmark_result(arch='aarch64'):  # array or others.
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', workload_benchmark_name, 'Execution_Time'])
    res, timestamps = get_benchmark_suite_result(level_str, workload_benchmark_name)
    check_for_benchmarks(res, level_str, timestamps)


def workload_benchmark():
    gather_workload_benchmark_result('aarch64')
    return


def gather_workload_ohos_codesize_result(arch='aarch64'):  # array or others.
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', workload_ohos_cosesize_name, 'CodeSize'])
    res, timestamps = get_benchmark_suite_result(level_str, workload_ohos_cosesize_name)
    check_for_benchmarks(res, level_str, timestamps)


def workload_ohos_codesize_benchmark():
    gather_workload_ohos_codesize_result('ohos')
    return


def gather_std_ohos_codesize_result(arch='aarch64'):  # array or others.
    level_str = '/'.join([arch, 'CJPW-Bench(领域级)', std_ohos_cosesize_name, 'CodeSize'])
    res, timestamps = get_benchmark_suite_result(level_str, std_ohos_cosesize_name)
    check_for_benchmarks(res, level_str, timestamps)


def std_ohos_codesize_benchmark():
    gather_std_ohos_codesize_result('ohos')
    return


def gather_compile_std_result(arch='aarch64'):  # array or others.
    level_str = '/'.join([arch, 'CJPW-Bench(领域级)', compile_std_name, 'comparison'])
    res, timestamps = get_benchmark_suite_result(level_str, compile_std_name)
    check_for_benchmarks(res, level_str, timestamps)


def compile_std():
    gather_compile_std_result('aarch64')
    gather_compile_std_result('x86')
    return

def workload_compile():
    level_str = '/'.join(['x86', 'CJCF-Bench(算法级)', workload_compile_name, '发布态', 'compilation_efficiency'])
    res, timestamps = get_benchmark_suite_result(level_str, workload_compile_name)
    check_for_benchmarks(res, level_str, timestamps)

    level_str = '/'.join(['x86', 'CJCF-Bench(算法级)', workload_compile_name, '开发态 有优化', 'compilation_efficiency'])
    res, timestamps = get_benchmark_suite_result(level_str, workload_compile_name)
    check_for_benchmarks(res, level_str, timestamps)

    level_str = '/'.join(['x86', 'CJCF-Bench(算法级)', workload_compile_name, '开发态 无优化', 'compilation_efficiency'])
    res, timestamps = get_benchmark_suite_result(level_str, workload_compile_name)
    check_for_benchmarks(res, level_str, timestamps)

    level_str = '/'.join(['x86', 'CJCF-Bench(算法级)', workload_compile_name, '开发态 无优化 开调试', 'compilation_efficiency'])
    res, timestamps = get_benchmark_suite_result(level_str, workload_compile_name)
    check_for_benchmarks(res, level_str, timestamps)


    level_str = '/'.join(['aarch64', 'CJCF-Bench(算法级)', workload_compile_name, '发布态', 'compilation_efficiency'])
    res, timestamps = get_benchmark_suite_result(level_str, workload_compile_name)
    check_for_benchmarks(res, level_str, timestamps)

    level_str = '/'.join(['aarch64', 'CJCF-Bench(算法级)', workload_compile_name, '开发态 有优化', 'compilation_efficiency'])
    res, timestamps = get_benchmark_suite_result(level_str, workload_compile_name)
    check_for_benchmarks(res, level_str, timestamps)

    level_str = '/'.join(['aarch64', 'CJCF-Bench(算法级)', workload_compile_name, '开发态 无优化', 'compilation_efficiency'])
    res, timestamps = get_benchmark_suite_result(level_str, workload_compile_name)
    check_for_benchmarks(res, level_str, timestamps)

    level_str = '/'.join(['aarch64', 'CJCF-Bench(算法级)', workload_compile_name, '开发态 无优化 开调试', 'compilation_efficiency'])
    res, timestamps = get_benchmark_suite_result(level_str, workload_compile_name)
    check_for_benchmarks(res, level_str, timestamps)


    level_str = '/'.join(['mac', 'CJCF-Bench(算法级)', workload_compile_name, '发布态', 'compilation_efficiency'])
    res, timestamps = get_benchmark_suite_result(level_str, workload_compile_name)
    check_for_benchmarks(res, level_str, timestamps)

'''
--------------------------------------------------------------------
-----------------------------  TAIBAI  -----------------------------
--------------------------------------------------------------------
'''

def gather_taibai_result(test_env='top-level performance'):
    level_str = '/'.join(['x86', 'CJPW-Bench(领域级)', 'TAIBAI', test_env])
    res, timestamps = get_benchmark_suite_result(level_str, taibai_name)
    check_for_benchmarks(res, level_str, timestamps)

def taibai():
    gather_taibai_result('top-level performance')
    gather_taibai_result('top-level performance_8U16G')
    return


'''
--------------------------------------------------------------------
-----------------------------  MetaDSL  -----------------------------
--------------------------------------------------------------------
'''

def gather_MetaDSL_result():
    level_str = '/'.join(['windows', 'CJPW-Bench(领域级)', metadsl_name])
    res, timestamps = get_benchmark_suite_result(level_str, metadsl_name)
    check_for_benchmarks(res, level_str, timestamps)

def MetaDSL():
    gather_MetaDSL_result()
    return


'''
--------------------------------------------------------------------
-----------------------------  WebM  -----------------------------
--------------------------------------------------------------------
'''

def gather_WebM_result():
    level_str = '/'.join(['x86', 'CJPW-Bench(领域级)', webm_name])
    res, timestamps = get_benchmark_suite_result(level_str, webm_name)
    check_for_benchmarks(res, level_str, timestamps)

def WebM():
    gather_WebM_result()
    return

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--user", type=str, help="user for send mail")
    parser.add_argument("--password", type=str, help="password for send mail")
    parser.add_argument("--send", type=str, help="send to all or not.")

    args = parser.parse_args()
    user = args.user
    password = args.password
    send = args.send

    current_date = datetime.now().date()
    previous_date1 = int((current_date - timedelta(days=1)).strftime("%Y%m%d"))
    previous_date2 = int((current_date - timedelta(days=2)).strftime("%Y%m%d"))
    current_date = int(current_date.strftime("%Y%m%d"))
    
    summary_pics = '<h1> Cangjie Benchmark Daily 性能劣化汇总 </h1>' \
                   '<p> Data Source:  </p>' \
                   '<p>  </p>'

    send_reason_new = '<br><h2> New Performance Degradation </h2>'
    send_reason_old = '<br><h2> Historical Performance Degradation </h2>'
    
    taibai()

    MetaDSL()

    WebM()
    
    benchmark_game()
    
    workload_benchmark()

    workload_ohos_codesize_benchmark()

    std_ohos_codesize_benchmark()

    object_orient_benchmark()

    concurrency_benchmark()
    
    linaro_benchmark()

    workload_compile()

    compile_std()

    micro_bench()

    if send == 'all':
        to_addrs = all_to_addrs
    else:
        to_addrs = one_to_addrs

    summary_pics = summary_pics + "新增劣化用例数量： {} <br>".format(new_add_num)
    summary_pics = summary_pics + '新增劣化用例如下: <br>' + new_add_case
    summary_pics = summary_pics + send_reason_new
    summary_pics = summary_pics + "<br><br>---------------------------------------------------------------------------<br><br>"
    
    summary_pics = summary_pics + "历史劣化用例数量： {} <br>".format(total_num)
    summary_pics = summary_pics + '历史劣化用例如下: <br>' + total_case
    summary_pics = summary_pics + send_reason_old

    send_email(summary_pics, user_info=[str(user), str(password)], to_addrs=to_addrs)


