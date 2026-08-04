#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import os
import time
import re
import argparse

snapshot_repos = ''
h = ''


def download(download_url):
    print(download_url)
    os.system('wget {} -q --no-check-certificate'.format(download_url))


def get_html():
    os.system('curl {} -k -o {}'.format(snapshot_repos, h))
    time.sleep(3)


def get_newest_url(b, last_commit=""):
    with open(h, 'r') as f:
        content = f.read()
        names = [j for j in re.findall(re.compile(r'202\d{11}_[\da-z]+_dev_' + b), content)]
        commits = [x[15:] for x in names]  # 14 number and _.
        timestamps = [int(x[:14]) for x in names]
        if not timestamps:
            raise Exception("url not found for package: {}".format(b))
        temp = timestamps.index(max(timestamps))
        if last_commit != "" and str(commits[temp]).startswith(
                last_commit):  # we should avoid get same commit package here.
            return ""
        else:
            download_url = snapshot_repos + '{}.tar.gz'.format(names[temp])
            return download_url


def check_for_benchmarksgame():
    from push_smoke import get_last_result_new, productName
    level_str = '/'.join([backend + '_smoke_' + arch, 'CJCF-Bench', 'benchmarksgame', 'time'])
    data = get_last_result_new(productName=productName, level_str=level_str)
    if data:
        temp = data[0]['summary']
        print("last commit:", temp)
        temp = temp[str(temp).index('(') + 1:]
        temp = temp[:str(temp).index(' ')]
        while get_newest_url(download_backend, temp) == "":
            time.sleep(10)  # sleep until new commit package is uploaded.
            get_html()
    else:
        print("no last data")


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--backend", type=str, default='llvmgc', help="llvmgc,jet")
    parser.add_argument("--arch", type=str, default='x86', help="x86,aarch64")
    parser.add_argument("--bench", action='store_true', help="check last bench result commit.")
    args = parser.parse_args()
    backend = args.backend
    arch = args.arch
    bench = args.bench
    download_backend = backend + '_arm' if arch == 'aarch64' or arch == 'arm' else backend
    get_html()
    if bench:
        check_for_benchmarksgame()

    download(get_newest_url(download_backend))
