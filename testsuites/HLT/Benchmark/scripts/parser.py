#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

import csv
import json
import datetime
import requests
import pandas as pd

columns =['name','lang','version','arg(n)','size(B)','cpu(s)','mem(KB)','status','cpu_load','elapsed(s)']
def read_csv(filename="all_measurements.csv"):
    df = pd.read_csv(filename,names=columns)
    with open('reports/myreport.html','w') as f:
        f.write(df.to_html())



if __name__ == '__main__':
    read_csv()
