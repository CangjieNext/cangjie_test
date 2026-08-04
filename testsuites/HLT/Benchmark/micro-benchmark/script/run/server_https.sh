#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



version=$1

PWD
base=$PWD/../result
result_list="$base/result-$version-server_https.list"
jmeter_path=${WORKSPACE}/../Micro_Http_Settings/apache-jmeter-5.6.2/bin

java -version

# http1.1s 使用jmeter
${jmeter_path}/jmeter.sh -n -t ${jmeter_path}/templates/server_https.jmx -l ${base}/result_https.jtl
${jmeter_path}/jmeter.sh -g ${base}/result_https.jtl -o ${base}/report_https

# jmeter 数据处理
python3 $PWD/server_analyzer.py ${base}/report_https/statistics.json >> $result_list

sed -i '/Total/d' $result_list
rm -rf ${base}/report_http* ${base}/result_https.jtl
