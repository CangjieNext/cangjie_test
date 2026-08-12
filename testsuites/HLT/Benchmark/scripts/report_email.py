#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import smtplib
from email.header import Header
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import pandas as pd

tolerance = -5
benchmarks_game_send = False
code_size_send = False

from_addr = ""
to_addrs_default = [""]


def report_benchmarks_game(data, cur_version, last_version, backend, debug, user, password):
    to_addrs = to_addrs_default
    if debug:
        to_addrs = [""]
    smtp_server = ""
    server = smtplib.SMTP(smtp_server, 25)
    server.set_debuglevel(1)
    server.login(user, password)

    message = MIMEMultipart()
    message['To'] = ";".join(to_addrs)

    def draw_red(value):
        global benchmarks_game_send
        value = float(value[:-1])
        if value < tolerance:
            benchmarks_game_send = True
            return ('background-color:OrangeRed')
        elif value > -tolerance:
            benchmarks_game_send = True
            return ('background-color:PaleGreen')
        return ('background-color:AliceBlue')

    def draw_back(value):
        return ('background-color:AliceBlue')

    df = pd.DataFrame(data)

    df_new = pd.DataFrame(df.values.T, columns=df.index, index=df.columns)
    pd.set_option('display.colheader_justify', 'left')
    df_new.columns = ['cur_result/s', 'last_result/s', 'rate']
    df_new = df_new.style.applymap(draw_red, subset=['rate']).applymap(draw_back, subset=['cur_result/s',
                                                                                          'last_result/s']).set_caption(
        "Benchmarks-Game/lower is better")
    t = df_new.to_html()
    print(t)

    def get_id(inf):
        if inf != 'none':
            return inf[str(cur_version).index('('):].split(' ')[0][1:]
        else:
            return 'none'

    commit_id = get_id(cur_version)
    print("cur", cur_version, commit_id)
    last_id = get_id(last_version)
    print("last", last_version, last_id)
    txt_html = """
            
            """.format(commit_id, cur_version, last_id, last_version,
                       abs(tolerance), backend) + t

    message['From'] = Header("[{}]仓颉后冒烟性能报告".format(backend), 'utf-8')
    subject = '[{}]Cangjie Post Smoke Benchmark'.format(backend)
    message['Subject'] = Header(subject, 'utf-8').encode()
    part_html = MIMEText(txt_html, "html", "utf-8")
    message.attach(part_html)
    print("Send Mail:", benchmarks_game_send)
    if benchmarks_game_send or debug:
        server.sendmail(from_addr, to_addrs, message.as_string())

    server.quit()


def report_code_size(data, cur_version, last_version, backend, debug, user, password):
    code_size_tolerance = 30  # 30KB.
    to_addrs = to_addrs_default
    if debug:
        to_addrs = [""]
    smtp_server = ""
    server = smtplib.SMTP(smtp_server, 25)
    server.set_debuglevel(1)
    server.login(user, password)

    message = MIMEMultipart()
    message['To'] = ";".join(to_addrs)

    def draw_red(value):
        global code_size_send
        value = float(value[:-1])
        if value > code_size_tolerance:  # cur - last > 30, bad situation.
            code_size_send = True
            return ('background-color:OrangeRed')
        elif value < -code_size_tolerance:  # cur < last - 30, good situation.
            code_size_send = True
            return ('background-color:PaleGreen')
        return ('background-color:AliceBlue')

    def draw_back(value):
        return ('background-color:AliceBlue')

    df = pd.DataFrame(data)

    df_new = pd.DataFrame(df.values.T, columns=df.index, index=df.columns)
    pd.set_option('display.colheader_justify', 'left')
    df_new.columns = ['cur_size/KB', 'last_size/KB', 'difference']
    df_new = df_new.style.applymap(draw_red, subset=['difference']).applymap(draw_back, subset=['cur_size/KB',
                                                                                                'last_size/KB']).set_caption(
        "so code size/lower is better")
    t = df_new.to_html()
    print(t)

    def get_id(inf):
        if inf != 'none':
            return inf[str(cur_version).index('('):].split(' ')[0][1:]
        else:
            return 'none'

    commit_id = get_id(cur_version)
    print("cur", cur_version, commit_id)
    last_id = get_id(last_version)
    print("last", last_version, last_id)
    txt_html = """
            """.format(commit_id, cur_version, last_id, last_version, backend) + t

    message['From'] = Header("[{}]仓颉后冒烟 Code Size 监控".format(backend), 'utf-8')
    subject = '[{}]Cangjie Post Smoke Code Size Monitoring'.format(backend)
    message['Subject'] = Header(subject, 'utf-8').encode()
    part_html = MIMEText(txt_html, "html", "utf-8")
    message.attach(part_html)
    print("Send Mail:", code_size_send)
    if code_size_send or debug:
        server.sendmail(from_addr, to_addrs, message.as_string())

    server.quit()
    pass


def report_compile_smoke(data, cur_version, last_version, backend, debug, user, password, report_tolerance):
    to_addrs = to_addrs_default
    if debug:
        to_addrs = [""]
    smtp_server = ""
    server = smtplib.SMTP(smtp_server, 25)
    server.set_debuglevel(1)
    server.starttls()
    server.login(user, password)

    message = MIMEMultipart()
    message['To'] = ";".join(to_addrs)

    def draw_red(value):
        value = float(value[:-1])
        if value < report_tolerance:
            return ('background-color:OrangeRed')
        elif value > -report_tolerance:
            return ('background-color:PaleGreen')
        return ('background-color:AliceBlue')

    def draw_back(value):
        return ('background-color:AliceBlue')

    df = pd.DataFrame(data)

    df_new = pd.DataFrame(df.values.T, columns=df.index, index=df.columns)
    pd.set_option('display.colheader_justify', 'left')
    df_new.columns = ['cur_result/s', 'last_result/s', 'rate']
    df_new = df_new.style.applymap(draw_red, subset=['rate']).applymap(draw_back, subset=['cur_result/s',
                                                                                          'last_result/s']).set_caption(
        "compile_smoke/lower is better")
    t = df_new.to_html()
    print(t)

    def get_id(inf):
        if inf != 'none':
            return inf[str(cur_version).index('('):].split(' ')[0][1:]
        else:
            return 'none'

    commit_id = get_id(cur_version)
    print("cur", cur_version, commit_id)
    last_id = get_id(last_version)
    print("last", last_version, last_id)
    txt_html = """
                """.format(commit_id, cur_version, last_id, last_version,
                           abs(tolerance), backend) + t

    message['From'] = Header("[{}]仓颉后冒烟编译性能报告".format(backend), 'utf-8')
    subject = '[{}]Cangjie Post Smoke Compile Benchmark'.format(backend)
    message['Subject'] = Header(subject, 'utf-8').encode()
    part_html = MIMEText(txt_html, "html", "utf-8")
    message.attach(part_html)
    print("Send Compile Smoke Mail: True")
    server.sendmail(from_addr, to_addrs, message.as_string())
    server.quit()
