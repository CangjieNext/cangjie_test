#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



version=$1

PWD
base=$PWD/../result
result_list="$base/result-$version-server_http2.list"
jmeter_path=${WORKSPACE}/../Micro_Http_Settings/apache-jmeter-5.6.2/bin

# http2.0使用 h2load
# c1 m1
for size in 32 256 2048 16384 131072
do
    h2load https://127.0.0.1:62003/get${size} --duration=10 --warm-up-time=5 -c 1 -m 1 >> temp_log.txt
    time_temp=$(grep "request:" temp_log.txt | awk '{print $6}')
    echo -n "BenchmarkHttp2SeverGet_N$size: " >> $result_list
    python3 $PWD/convert_time.py $time_temp >> $result_list
    rm -rf temp_log.txt
done

for size in 32 256 2048 16384 131072
do
    h2load https://127.0.0.1:62003/post --duration=10 --warm-up-time=5 -c 1 -m 1 -d $jmeter_path/data/data_${size}.txt >> temp_log.txt
    time_temp=$(grep "request:" temp_log.txt | awk '{print $6}')
    echo -n "BenchmarkHttp2SeverPost_N$size: " >> $result_list
    python3 $PWD/convert_time.py $time_temp >> $result_list
    rm -rf temp_log.txt
done

# c1 m100
for size in 32 256 2048 16384 131072
do
    h2load https://127.0.0.1:62003/get${size} --duration=10 --warm-up-time=5 -c 1 -m 100 >> temp_log.txt
    time_temp=$(grep "request:" temp_log.txt | awk '{print $6}')
    echo -n "BenchmarkHttp2SeverGet_C1_M100_N$size: " >> $result_list
    python3 $PWD/convert_time.py $time_temp >> $result_list
    rm -rf temp_log.txt
done

for size in 32 256 2048 16384 131072
do
    h2load https://127.0.0.1:62003/post --duration=10 --warm-up-time=5 -c 1 -m 100 -d $jmeter_path/data/data_${size}.txt >> temp_log.txt
    time_temp=$(grep "request:" temp_log.txt | awk '{print $6}')
    echo -n "BenchmarkHttp2SeverPost_C1_M100_N$size: " >> $result_list
    python3 $PWD/convert_time.py $time_temp >> $result_list
    rm -rf temp_log.txt
done

# c100 m1
for size in 32 256 2048 16384 131072
do
    h2load https://127.0.0.1:62003/get${size} --duration=10 --warm-up-time=5 -c 100 -m 1 >> temp_log.txt
    time_temp=$(grep "request:" temp_log.txt | awk '{print $6}')
    echo -n "BenchmarkHttp2SeverGet_C100_M1_N$size: " >> $result_list
    python3 $PWD/convert_time.py $time_temp >> $result_list
    rm -rf temp_log.txt
done

for size in 32 256 2048 16384 131072
do
    h2load https://127.0.0.1:62003/post --duration=10 --warm-up-time=5 -c 100 -m 1 -d $jmeter_path/data/data_${size}.txt >> temp_log.txt
    time_temp=$(grep "request:" temp_log.txt | awk '{print $6}')
    echo -n "BenchmarkHttp2SeverPost_C100_M1_N$size: " >> $result_list
    python3 $PWD/convert_time.py $time_temp >> $result_list
    rm -rf temp_log.txt
done

# c10 m10
for size in 32 256 2048 16384 131072
do
    h2load https://127.0.0.1:62003/get${size} --duration=10 --warm-up-time=5 -c 10 -m 10 >> temp_log.txt
    time_temp=$(grep "request:" temp_log.txt | awk '{print $6}')
    echo -n "BenchmarkHttp2SeverGet_C10_M10_N$size: " >> $result_list
    python3 $PWD/convert_time.py $time_temp >> $result_list
    rm -rf temp_log.txt
done

for size in 32 256 2048 16384 131072
do
    h2load https://127.0.0.1:62003/post --duration=10 --warm-up-time=5 -c 10 -m 10 -d $jmeter_path/data/data_${size}.txt >> temp_log.txt
    time_temp=$(grep "request:" temp_log.txt | awk '{print $6}')
    echo -n "BenchmarkHttp2SeverPost_C10_M10_N$size: " >> $result_list
    python3 $PWD/convert_time.py $time_temp >> $result_list
    rm -rf temp_log.txt
done