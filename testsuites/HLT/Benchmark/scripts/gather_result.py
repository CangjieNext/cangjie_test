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
import datetime
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
http_date_dir = ''

from_addr = ""
all_to_addrs = [

]
one_to_addrs = [""]
productName = 'Cangjie'

# 劣化阈值，当劣化超过该阈值时，邮件中会画出劣化用例的折线图
threshold = 0.15

benchmarks_game_name = 'Benchmark_Game'
oo_benchmark_name = 'Object_Orient_Benchmark'
concurrency_benchmark_name = 'Concurrency_Benchmark'
micro_benchmark_name = 'Micro-Bench(原子级)'
taibai_name = 'TAIBAI'
webm_name = 'WebM'

benchmark_suite_dict = {
    benchmarks_game_name: {'llvmgc_cj', 'cjvm_cj', 'go', 'java'},
    oo_benchmark_name: {'llvmgc_cj', 'cjvm_cj', 'go', 'java'},
    concurrency_benchmark_name: {'llvmgc_cj', 'cjvm_cj', 'go', 'loom'}, 
    micro_benchmark_name: {'llvmgc_cj', 'cjvm_cj', 'go', 'java'},
    taibai_name: {'elfSize(MB)', 'time(s)', 'Compile efficiency(s/kloc)', 'memory_max(MB)'},
    webm_name: {'Code Size(KB)', 'CodeSize/SourceSize(B/loc)', 'Compilation Efficiency(s/kloc)', 'Peak Memory Usage(MB)'}
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
    'go': 'blue',
    'swift': 'yellow',
    'java': 'black',
    'loom': 'black'
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
    message['From'] = Header("Cangjie 1.1.0 Benchmark Daily Report", 'utf-8')
    subject = 'Cangjie 1.1.0 Benchmark Daily Report'
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
    # 取近10天的数据
    data_len = min(10, (len(timestamps)))
    new_timestamp = []
    for i in range(data_len):
        timestamp = timestamps[i]['timeStamp']
        new_timestamp.append(timestamp)
        one_result = get_one_timestamp_result(timestamp, level_str)
        case_result.append(one_result)
    return case_result, new_timestamp


def get_benchmark_suite_result(level_str, suite_name):
    # 通过时间戳获取近10天的数据
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
    try:
        summary = result[0]['data']['data'][0]['summary']
    except IndexError:
        summary = ''
    return temp, timestamps, summary


def save_pic_and_add_link_to_html(case_name, ts, level_str):
    case_name = case_name.replace('#', '_').replace('/', '_').replace(' ', '_')
    base_dir = home_dir + 'daily_results/{}/{}/'.format(ts, level_str)
    if not os.path.exists(base_dir):
        os.makedirs(base_dir)
    pic_name = '{}/{}.png'.format(base_dir, case_name)
    if os.path.exists(pic_name):
        os.remove(pic_name)
    plt.savefig(pic_name)
    # make sure your http-server start in cur dir.
    result = '''Result Picture : <a href = {} > {} </a><br>'''.format(
        http_date_dir + pic_name.replace(home_dir + 'daily_results', ''), '{}.png'.format(case_name))
    plt.close()
    return result


# will not draw pic. only for display.
def show_pic_on_html(case_name, ts, level_str):
    case_name = case_name.replace('#', '_').replace('/', '_').replace(' ', '_')
    base_dir = home_dir + 'daily_results/{}/{}/'.format(ts, level_str)
    pic_name = '{}/{}.png'.format(base_dir, case_name)
    url = http_date_dir + pic_name.replace(home_dir + 'daily_results', '')
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

        plt.plot(ticks, cur_data
                 , label=name_label, linewidth=2, color=color, marker='o', markeredgecolor='black')
        for i, val in enumerate(cur_data):
            ax.annotate(str(val), (ticks[i], val), textcoords="offset points", xytext=(0, 10), ha='center')
    plt.title(case_name)
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


'''
----------------------------------------------------------------------------
-----------------------------  Benchmark_Game  -----------------------------
----------------------------------------------------------------------------
'''

def check_for_benchmarks_game(cur_result, last_result, check_lang, level_str, cur_ts):
    global send_reason
    for i in cur_result.keys():
        cur = cur_result[i][check_lang]
        last = last_result[i][check_lang]
        if last == 0:
            return ''
        rate = (cur - last) / last
        # 计算今天的结果和昨天结果的比值，劣化超过15%则会在邮件中绘制折线图
        if rate > threshold:
            cur_reason = 'Performance Degradation: {} {} {} , cur result {}, last result {}, rate {}%<br>'.format(
                level_str,
                check_lang,
                i,
                cur,
                last,
                round(rate, 2) * 100)
            send_reason += cur_reason + show_pic_on_html(i, cur_ts, level_str)
            return cur_reason
    return

def gather_benchmarks_result(arch='aarch64'):
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', benchmarks_game_name, 'Execution_Time'])
    res, timestamps, summary = get_benchmark_suite_result(level_str, benchmarks_game_name)

    # geomean
    cur_result, last_result, (cur_ts, last_ts) = get_cur_and_last_result(productName, level_str, test_suite_name=benchmarks_game_name)
    table_result = [arch, 0, 0, 0, 0, 0, 0]
    if cur_ts != last_ts:
        cur_ts = update_timestamp(cur_ts)
        last_ts = update_timestamp(last_ts)
        cj_llvm_results = [cur_result[i]['llvmgc_cj'] for i in sorted(cur_result.keys())]
        cj_jet_results = [cur_result[i]['cjvm_cj'] for i in sorted(cur_result.keys())]
        go_results = [cur_result[i]['go'] for i in sorted(cur_result.keys())]
        java_results = [cur_result[i]['java'] for i in sorted(cur_result.keys())]

        last_cj_llvm_results = [(last_result[i]['llvmgc_cj'] if i in last_result else 0) for i in sorted(cur_result.keys())]
        last_cj_jet_results = [(last_result[i]['cjvm_cj'] if i in last_result else 0) for i in sorted(cur_result.keys())]
    
        check_for_benchmarks_game(cur_result, last_result, 'llvmgc_cj', level_str, cur_ts)
        check_for_benchmarks_game(cur_result, last_result, 'cjvm_cj', level_str, cur_ts)

        table_result = [arch, geometric_mean(cj_llvm_results), geometric_mean(cj_jet_results),
                        geometric_mean(calculate_rate(cj_llvm_results, last_cj_llvm_results)),
                        geometric_mean(calculate_rate(cj_jet_results, last_cj_jet_results)),
                        geometric_mean(calculate_rate(cj_llvm_results, go_results)),
                        geometric_mean(calculate_rate(cj_jet_results, java_results))]

    result = ''
    for i in sorted(list(res.keys())):
        result += draw_one_graph(timestamps, res[i], i, level_str=level_str)
    return table_result, cur_ts, level_str

def benchmark_game():
    global summary_pics
    table_result_aarch64, _, _ = gather_benchmarks_result('aarch64')
    table_result_x86, cur_ts, level_str = gather_benchmarks_result('x86')
    draw_table([
        ['env', 'cjnative', 'cjvm', 'cur_cjnative/last', 'cur_cjvm/last', 'cjnative/go', 'cjvm/java'],
         table_result_aarch64, table_result_x86
    ], title='Benchmark_Game Execution_Time Geomean', ts=cur_ts, level_str=level_str,
        text='Execution_Time(s), lower is better.')
    summary_pics = summary_pics + show_pic_on_html('Benchmark_Game_Execution_Time_Geomean', cur_ts, level_str)
    return


'''
-------------------------------------------------------------------------------------
-----------------------------  Object_Orient_Benchmark  -----------------------------
-------------------------------------------------------------------------------------
'''

def check_for_oo_result(cur_result, last_result, check_lang, level_str, case_name, cur_ts):
            global send_reason
            for i in cur_result.keys():
                cur = cur_result[i][check_lang]
                last = last_result[i][check_lang]
                if last == 0:
                    return ''
                rate = (cur - last) / last if case_name == 'Execution_Time' else (last - cur) / last

                if rate > threshold:  # performance degradation
                    cur_reason = 'Performance Degradation: {} {} {} , cur result {}, last result {}, rate {}%<br>'.format(
                        level_str,
                        check_lang,
                        i,
                        cur,
                        last,
                        round(rate, 2) * 100)
                    send_reason += cur_reason + show_pic_on_html(i, cur_ts, level_str)
                    return cur_reason
            return ''


def gather_oo_benchmark_result(arch='aarch64', case_name='Execution_Time'): 
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', oo_benchmark_name, case_name])
    res, timestamps, summary = get_benchmark_suite_result(level_str, oo_benchmark_name)

    # geomean
    cur_result, last_result, (cur_ts, last_ts) = get_cur_and_last_result(productName, level_str,
                                                                         test_suite_name=oo_benchmark_name)
    table_result = [arch, 0, 0, 0, 0, 0, 0]
    if cur_ts != last_ts:
        cur_ts = update_timestamp(cur_ts)
        cj_llvm_results = [cur_result[i]['llvmgc_cj'] for i in sorted(cur_result.keys())]
        cj_jet_results = [cur_result[i]['cjvm_cj'] for i in sorted(cur_result.keys())]
        go_results = [cur_result[i]['go'] for i in sorted(cur_result.keys())]
        java_results = [cur_result[i]['java'] for i in sorted(cur_result.keys())]


        last_cj_llvm_results = [(last_result[i]['llvmgc_cj'] if i in last_result else 0) for i in sorted(cur_result.keys())]
        last_cj_jet_results = [(last_result[i]['cjvm_cj'] if i in last_result else 0) for i in sorted(cur_result.keys())]

        check_for_oo_result(cur_result, last_result, 'llvmgc_cj', level_str, case_name, cur_ts)
        check_for_oo_result(cur_result, last_result, 'cjvm_cj', level_str, case_name, cur_ts)

        if case_name == 'Memory_Allocation':
            table_result = [arch, geometric_mean(cj_llvm_results), geometric_mean(cj_jet_results),
                            geometric_mean(calculate_rate(last_cj_llvm_results, cj_llvm_results)),
                            geometric_mean(calculate_rate(last_cj_jet_results, cj_jet_results)),
                            geometric_mean(calculate_rate(go_results, cj_llvm_results)),
                            geometric_mean(calculate_rate(java_results, cj_jet_results))]
            
        else:
            table_result = [arch, geometric_mean(cj_llvm_results), geometric_mean(cj_jet_results),
                            geometric_mean(calculate_rate(cj_llvm_results, last_cj_llvm_results)),
                            geometric_mean(calculate_rate(cj_jet_results, last_cj_jet_results)),
                            geometric_mean(calculate_rate(cj_llvm_results, go_results)),
                            geometric_mean(calculate_rate(cj_jet_results, java_results))]

    result = ''        
    for i in sorted(list(res.keys())):
        result += draw_one_graph(timestamps, res[i], i, level_str=level_str)
    return table_result, cur_ts, level_str


def object_orient_benchmark():
    global summary_pics
    # Execution_Time
    table_result_aarch64, _, _ = gather_oo_benchmark_result('aarch64')
    table_result_aarchx86, cur_ts, level_str = gather_oo_benchmark_result('x86')
    draw_table([
        ['env', 'cjnative', 'cjvm', 'cur_cjnative/last', 'cur_cjvm/last', 'cjnative/go', 'cjvm/java'],
        table_result_aarch64, table_result_aarchx86], 
        title='Object_Orient_Benchmark Execution_Time Geomean', ts=cur_ts, level_str=level_str,
        text='Execution_Time(s), lower is better.')
    summary_pics = summary_pics + show_pic_on_html('Object_Orient_Benchmark_Execution_Time_Geomean', cur_ts, level_str)

    # Memory_Allocation
    table_result_aarch64_ma, _, _ = gather_oo_benchmark_result('aarch64', 'Memory_Allocation')
    table_result_aarchx86_ma, cur_ts, level_str = gather_oo_benchmark_result('x86', 'Memory_Allocation')
    draw_table([
        ['env', 'cjnative', 'cjvm', 'last/cur_cjnative', 'last/cur_cjvm', 'go/cjnative', 'java/cjvm'],
        table_result_aarch64_ma, table_result_aarchx86_ma],
        title='Object_Orient_Benchmark Memory_Allocation Geomean', ts=cur_ts, level_str=level_str,
        text='Memory_Allocation(units / msec), higher is better.')
    summary_pics = summary_pics + show_pic_on_html('Object_Orient_Benchmark_Memory_Allocation_Geomean', cur_ts, level_str)

    return


'''
-----------------------------------------------------------------------------------
-----------------------------  Concurrency_Benchmark  -----------------------------
-----------------------------------------------------------------------------------
'''

def check_for_concurrency_result(cur_result, last_result, check_lang, case_name, level_str, cur_ts):
    global send_reason
    for i in cur_result.keys():
        cur = cur_result[i][check_lang]
        last = last_result[i][check_lang]
        if last == 0:
            return ''
        rate = (last - cur) / last if case_name == 'Throughput' \
            else (cur - last) / last  # Throughput higher is better.

        if rate > threshold:  # performance degradation
            cur_reason = 'Performance Degradation: {} {} {} , cur result {}, last result {}, rate {}%<br>'.format(
                level_str,
                check_lang,
                i,
                cur,
                last,
                round(rate, 2) * 100)
            send_reason += cur_reason + show_pic_on_html(i, cur_ts, level_str)
            return cur_reason
    return ''

def gather_concurrency_benchmark_result(arch='aarch64', case_name='Execution_Time'):
    level_str = '/'.join([arch, 'CJCF-Bench(算法级)', concurrency_benchmark_name, case_name])
    res, timestamps, summary = get_benchmark_suite_result(level_str, concurrency_benchmark_name)

    # geomean
    cur_result, last_result, (cur_ts, last_ts) = get_cur_and_last_result(productName, level_str,
                                                                         test_suite_name=concurrency_benchmark_name)
    table_result = [arch, 0, 0, 0, 0, 0, 0]
    if cur_ts != last_ts:
        cur_ts = update_timestamp(cur_ts)
        cj_llvm_results = [cur_result[i]['llvmgc_cj'] for i in sorted(cur_result.keys())]
        cj_jet_results = [cur_result[i]['cjvm_cj'] for i in sorted(cur_result.keys())]
        go_results = [cur_result[i]['go'] for i in sorted(cur_result.keys())]
        java_results = [cur_result[i]['loom'] for i in sorted(cur_result.keys())]

        last_cj_llvm_results = [(last_result[i]['llvmgc_cj'] if i in last_result else 0) for i in sorted(cur_result.keys())]
        last_cj_jet_results = [(last_result[i]['cjvm_cj'] if i in last_result else 0) for i in sorted(cur_result.keys())]

        check_for_concurrency_result(cur_result, last_result, 'llvmgc_cj', case_name, level_str, cur_ts)
        check_for_concurrency_result(cur_result, last_result, 'cjvm_cj', case_name, level_str, cur_ts)

        if case_name == 'Throughput':
            table_result = [arch, geometric_mean(cj_llvm_results), geometric_mean(cj_jet_results),
                            geometric_mean(calculate_rate(last_cj_llvm_results, cj_llvm_results)),
                            geometric_mean(calculate_rate(last_cj_jet_results, cj_jet_results)),
                            geometric_mean(calculate_rate(go_results, cj_llvm_results)),
                            geometric_mean(calculate_rate(java_results, cj_jet_results))]
        else:
            table_result = [arch, geometric_mean(cj_llvm_results), geometric_mean(cj_jet_results),
                            geometric_mean(calculate_rate(cj_llvm_results, last_cj_llvm_results)),
                            geometric_mean(calculate_rate(cj_jet_results, last_cj_jet_results)),
                            geometric_mean(calculate_rate(cj_llvm_results, go_results)),
                            geometric_mean(calculate_rate(cj_jet_results, java_results))]
                        
    result = ''
    for i in sorted(list(res.keys())):
        result += draw_one_graph(timestamps, res[i], i, level_str=level_str)
    return table_result, cur_ts, level_str


def concurrency_benchmark():
    global summary_pics
    concurrency_case_info = {
        'Execution_Time': 'Execution_Time(s), lower is better.',
        'Memory_Peak': 'Memory_Peak(kb), lower is better.',
        'Throughput': 'Throughput(op/ms), higher is better.'
    }
    for i in concurrency_case_info.keys():
        table_result_aarch64, _, _ = gather_concurrency_benchmark_result('aarch64', i)
        table_result_x86, cur_ts, level_str = gather_concurrency_benchmark_result('x86', i)
        table_header = ''
        if i == 'Throughput':
            table_header = ['env', 'cjnative', 'cjvm', 'last/cur_cjnative', 'last/cur_cjvm', 'go/cjnative', 'loom/cjvm']
        else:
            table_header = ['env', 'cjnative', 'cjvm', 'cur_cjnative/last', 'cur_cjvm/last', 'cjnative/go', 'cjvm/loom']
        draw_table([table_header, table_result_aarch64, table_result_x86], 
             title='Concurrency_Benchmark {} Geomean'.format(i), ts=cur_ts, level_str=level_str,
             text=concurrency_case_info[i])
        summary_pics = summary_pics + show_pic_on_html('Concurrency_Benchmark_{}_Geomean'.format(i), cur_ts, level_str)
    return 


'''
-----------------------------------------------------------------------------
-----------------------------  Micro_Benchmark  -----------------------------
-----------------------------------------------------------------------------
'''

def check_for_micro_result(cur_result, last_result, check_lang, level_str, cur_ts):
    global send_reason
    for i in cur_result.keys():
        cur = cur_result[i][check_lang]
        last = last_result[i][check_lang]
        if last == 0:
            return ''
        rate = (cur - last) / last

        if rate > threshold:  # performance degradation
            cur_reason = 'Performance Degradation: {} {} {} , cur result {}, last result {}, rate {}%<br>'.format(
                level_str,
                check_lang,
                i,
                cur,
                last,
                round(rate, 2) * 100)
            send_reason += cur_reason + show_pic_on_html(i, cur_ts, level_str)
            return cur_reason
    return ''


def gather_micro_benchmark_result(arch='aarch64', case_name='array'):  # array or others.
    level_str = '/'.join([arch, micro_benchmark_name, 'Execution_Time', case_name])
    res, timestamps, summary = get_benchmark_suite_result(level_str, micro_benchmark_name)

    # geomean
    cur_result, last_result, (cur_ts, last_ts) = get_cur_and_last_result(productName, level_str,
                                                                         test_suite_name=micro_benchmark_name)
    if cur_result == None:
        return None, None, None
    table_result = [case_name, 0, 0, 0, 0, 0, 0, 0, 0]
    if cur_ts != last_ts:
        cur_ts = update_timestamp(cur_ts)
        cj_llvm_results = [cur_result[i]['llvmgc_cj'] for i in sorted(cur_result.keys())]
        cj_jet_results = [cur_result[i]['cjvm_cj'] for i in sorted(cur_result.keys())]
        go_results = [cur_result[i]['go'] for i in sorted(cur_result.keys())]
        java_results = [cur_result[i]['java'] for i in sorted(cur_result.keys())]

        last_cj_llvm_results = [(last_result[i]['llvmgc_cj'] if i in last_result else 0) for i in sorted(cur_result.keys())]
        last_cj_jet_results = [(last_result[i]['cjvm_cj'] if i in last_result else 0) for i in sorted(cur_result.keys())]

        # micro用例较多，暂不将劣化超过阈值的用例展示在邮件里，可进看板查看
        # check_for_micro_result(cur_result, last_result, 'llvmgc_cj', level_str, cur_ts)
        # check_for_micro_result(cur_result, last_result, 'cjvm_cj', level_str, cur_ts)

        table_result = [case_name, geometric_mean(cj_llvm_results), geometric_mean(cj_jet_results),
                        geometric_mean(calculate_rate(cj_llvm_results, last_cj_llvm_results)),
                        geometric_mean(calculate_rate(cj_jet_results, last_cj_jet_results)),
                        geometric_mean(calculate_rate(cj_llvm_results, go_results)),
                        geometric_mean(calculate_rate(cj_llvm_results, java_results)),
                        geometric_mean(calculate_rate(cj_jet_results, go_results)),
                        geometric_mean(calculate_rate(cj_jet_results, java_results))]
        
    # 为每个用例话折线图，因用例过多，暂不执行
    # result = ''
    # for i in sorted(list(res.keys())):
    #     result += draw_one_graph(timestamps, res[i], i, level_str=level_str)
    return table_result, cur_ts, level_str


def micro_bench():
    global summary_pics
    table_result = [['module', 'cjnative', 'cjvm', 'cur_cjnative/last', 'cur_cjvm/last', 'cjnative/go', 'cjnative/java', 'cjvm/go', 'cjvm/java']]
    cur_ts = ''
    level_str = ''

    for i in micro_benchmark_info:
        table_result_tmp, cur_ts, level_str = gather_micro_benchmark_result('aarch64', i)
        if table_result_tmp != None:
            table_result.append(table_result_tmp)
    draw_table(table_result, 
         title='Micro_Benchmark Execution_Time Geomean', ts=cur_ts, level_str=level_str,
         text='aarch64, Execution_Time(ns/op), lower is better.', size=(14, 14), input_fontsize=10, text_y=0.95)
    summary_pics = summary_pics + show_pic_on_html('Micro_Benchmark_Execution_Time_Geomean', cur_ts, level_str)

    table_result = [['module', 'cjnative', 'cjvm', 'cur_cjnative/last', 'cur_cjvm/last', 'cjnative/go', 'cjnative/java', 'cjvm/go', 'cjvm/java']]
    for i in micro_benchmark_info:
        table_result_tmp, cur_ts, level_str = gather_micro_benchmark_result('x86', i)
        if table_result_tmp != None:
            table_result.append(table_result_tmp)
    draw_table(table_result, 
         title='Micro_Benchmark Execution_Time Geomean', ts=cur_ts, level_str=level_str,
         text='x86, Execution_Time(ns/op), lower is better.', size=(14, 14), input_fontsize=10, text_y=0.95)
    summary_pics = summary_pics + show_pic_on_html('Micro_Benchmark_Execution_Time_Geomean', cur_ts, level_str)

    return


'''
--------------------------------------------------------------------
-----------------------------  TAIBAI  -----------------------------
--------------------------------------------------------------------
'''

def gather_taibai_result(baseline, test_env='top-level performance', machine_config='48U384G'):
    level_str = '/'.join(['x86', 'CJPW-Bench(领域级)', 'TAIBAI', test_env])
    level_str_new = level_str.replace(' ', '_')
    res, timestamps, summary = get_benchmark_suite_result(level_str, taibai_name)

    # geomean
    cur_result, last_result, (cur_ts, last_ts) = get_cur_and_last_result(productName, level_str, test_suite_name=taibai_name)

    if cur_ts != last_ts:
        cur_ts = update_timestamp(cur_ts)
        last_ts = update_timestamp(last_ts)
        elfSize_results = [cur_result[i]['elfSize(MB)'] for i in sorted(cur_result.keys())]
        time_results = [cur_result[i]['time(s)'] for i in sorted(cur_result.keys())]
        efficiency_results = [cur_result[i]['Compile efficiency(s/kloc)'] for i in sorted(cur_result.keys())]
        memory_results = [cur_result[i]['memory_max(MB)'] for i in sorted(cur_result.keys())]
        
        last_elfSize_results = [last_result[i]['elfSize(MB)'] for i in sorted(last_result.keys())]
        last_time_results = [last_result[i]['time(s)'] for i in sorted(last_result.keys())]
        last_efficiency_results = [last_result[i]['Compile efficiency(s/kloc)'] for i in sorted(last_result.keys())]
        last_memory_results = [last_result[i]['memory_max(MB)'] for i in sorted(last_result.keys())]

        draw_table([
                    ['Indicators', 'cur', 'last', 'baseline', 'cur/last', 'cur/baseline'],
                    ['codesize(MB)', geometric_mean(elfSize_results), geometric_mean(last_elfSize_results), baseline[0],
                     geometric_mean(calculate_rate(elfSize_results, last_elfSize_results)),
                     geometric_mean(calculate_rate(elfSize_results, [baseline[0]]))],
                    ['time(s)', geometric_mean(time_results), geometric_mean(last_time_results), baseline[1],
                     geometric_mean(calculate_rate(time_results, last_time_results)),
                     geometric_mean(calculate_rate(time_results, [baseline[1]]))],
                    ['Compile efficiency(s/kloc)', geometric_mean(efficiency_results), geometric_mean(last_efficiency_results), baseline[2],
                     geometric_mean(calculate_rate(efficiency_results, last_efficiency_results)),
                     geometric_mean(calculate_rate(efficiency_results, [baseline[2]]))],
                    ['memory_max(MB)', geometric_mean(memory_results), geometric_mean(last_memory_results), baseline[3],
                     geometric_mean(calculate_rate(memory_results, last_memory_results)),
                     geometric_mean(calculate_rate(memory_results, [baseline[3]]))],
                    ], title='TAIBAI Compilation Performance', ts=cur_ts, level_str=level_str_new,
                        text='{} Compilation Performance, lower is better.'.format(machine_config), size=(18, 4))
    global summary_pics
    
    summary_pics = summary_pics + show_pic_on_html('TAIBAI_Compilation_Performance', cur_ts, level_str_new)

    result = ''
    for i in sorted(list(res.keys())):
        result += draw_one_graph(timestamps, res[i], i, level_str=level_str)
    return

def taibai():
    baseline1 = [331.92, 1143.66, 3.2, 103441.7]
    gather_taibai_result(baseline1, 'top-level performance', '48U384G')
    baseline2 = [332.05, 2160.13, 6.1, 13656.51]
    gather_taibai_result(baseline2, 'top-level performance_8U16G', '8U16G')
    return


'''
--------------------------------------------------------------------
-----------------------------  WebM  -----------------------------
--------------------------------------------------------------------
'''

def gather_WebM_result(baseline):
    level_str = '/'.join(['x86', 'CJPW-Bench(领域级)', 'WebM', 'Compile'])
    level_str_new = level_str.replace(' ', '_')
    res, timestamps, summary = get_benchmark_suite_result(level_str, webm_name)

    # geomean
    cur_result, last_result, (cur_ts, last_ts) = get_cur_and_last_result(productName, level_str, test_suite_name=webm_name)

    if cur_ts != last_ts:
        cur_ts = update_timestamp(cur_ts)
        last_ts = update_timestamp(last_ts)
        elfSize_results = [float(cur_result[i]['Code Size(KB)']) for i in sorted(cur_result.keys())]
        time_results = [float(cur_result[i]['Compilation Efficiency(s/kloc)']) for i in sorted(cur_result.keys())]
        efficiency_results = [float(cur_result[i]['CodeSize/SourceSize(B/loc)']) for i in sorted(cur_result.keys())]
        memory_results = [float(cur_result[i]['Peak Memory Usage(MB)']) for i in sorted(cur_result.keys())]
        
        last_elfSize_results = [float(last_result[i]['Code Size(KB)']) for i in sorted(last_result.keys())]
        last_time_results = [float(last_result[i]['Compilation Efficiency(s/kloc)']) for i in sorted(last_result.keys())]
        last_efficiency_results = [float(last_result[i]['CodeSize/SourceSize(B/loc)']) for i in sorted(last_result.keys())]
        last_memory_results = [float(last_result[i]['Peak Memory Usage(MB)']) for i in sorted(last_result.keys())]

        draw_table([
                    ['Indicators', 'cur', 'last', 'baseline', 'cur/last', 'cur/baseline'],
                    ['CodeSize(KB)', geometric_mean(elfSize_results), geometric_mean(last_elfSize_results), baseline[0],
                     geometric_mean(calculate_rate(elfSize_results, last_elfSize_results)),
                     geometric_mean(calculate_rate(elfSize_results, [baseline[0]]))],
                    ['CodeSize/SourceSize(B/loc)', geometric_mean(efficiency_results), geometric_mean(last_efficiency_results), baseline[1],
                     geometric_mean(calculate_rate(efficiency_results, last_efficiency_results)),
                     geometric_mean(calculate_rate(efficiency_results, [baseline[1]]))],
                    ['Compilation Efficiency(s/kloc)', geometric_mean(time_results), geometric_mean(last_time_results), baseline[2],
                     geometric_mean(calculate_rate(time_results, last_time_results)),
                     geometric_mean(calculate_rate(time_results, [baseline[2]]))],
                    ['memory_max(MB)', geometric_mean(memory_results), geometric_mean(last_memory_results), baseline[3],
                     geometric_mean(calculate_rate(memory_results, last_memory_results)),
                     geometric_mean(calculate_rate(memory_results, [baseline[3]]))],
                    ], title='WebM Compilation Performance', ts=cur_ts, level_str=level_str_new,
                        text='rtosv2x Compilation Performance, lower is better.', size=(18, 4))
    global summary_pics
    
    summary_pics = summary_pics + show_pic_on_html('WebM_Compilation_Performance', cur_ts, level_str_new)

    result = ''
    for i in sorted(list(res.keys())):
        result += draw_one_graph(timestamps, res[i], i, level_str=level_str)
    return

def webm():
    baseline1 = [4265.43, 341.5, 5.63, 1407.52]
    gather_WebM_result(baseline1)
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

    summary_pics = '<h1> Cangjie 1.1.0 Benchmark Daily Report Summary </h1>' \
                   '''<pre>性能daily邮件由以下几部分组成：
1. 相关链接，包含看板链接和Jenkins工程链接
2. 性能数据汇总，由各个项目的几何平均数组成。 包含以下几部分数据
   a)	Benchmark Game x86/aarch64 cjnative/cjvm/go/java 运行性能数据
   b)	Object Orient Benchmark x86/aarch64 cjnative/cjvm/go/java 运行性能数据
   c)	Concurrency Benchmark x86/aarch64 cjnative/cjvm/go/loom 运行性能数据
   d)	Micro Benchmark  x86/aarch64 cjnative/cjvm/go/java 运行性能数据
   e)	TAIBAI  elfSize(MB)/time(s)/Compile efficiency(s/kloc)/memory_max(MB) 编译性能数据
   e)	WebM  Code Size(KB)/CodeSize SourceSize(B/loc)/Compilation Efficiency(s/kloc)/Peak Memory Usage(MB) 编译性能数据
   注：
       * 展示数据包括执行耗时（Execution_Time），内存峰值（Memory_Peak），动态内存分配能力（Memory_Allocation），吞吐量（Throughput），编译性能（Compilation Performance）等；
       * 测试项优化趋势已在各表头中注明（“lower is better” 或 “higher is better”），但请注意，邮件内所有【比值（x/y）】均为【lower is better】。
3. 性能波动用例的历史数据图。

如果图片不显示，请手动单击下载或者开启outlook自动下载选项。
</pre>''' 

    send_reason = '<br><h1> Performance Degradation </h1>'

    summary_pics = summary_pics + '<h3> 【1】 Benchmark_Game: </h3>'
    benchmark_game()

    summary_pics = summary_pics + '<h3> 【2】 Object_Orient_Benchmark: </h3>'
    object_orient_benchmark()

    summary_pics = summary_pics + '<h3> 【3】 Concurrency_Benchmark: </h3>'
    concurrency_benchmark()
    
    summary_pics = summary_pics + '<h3> 【4】 Micro_Benchmark: </h3>'
    micro_bench()

    summary_pics = summary_pics + '<h3> 【5】 TAIBAI: </h3>'
    taibai()

    summary_pics = summary_pics + '<h3> 【6】 WebM: </h3>'
    webm()

    if send == 'all':
        to_addrs = all_to_addrs
    else:
        to_addrs = one_to_addrs

    send_email(summary_pics + send_reason, user_info=[str(user), str(password)], to_addrs=to_addrs)


