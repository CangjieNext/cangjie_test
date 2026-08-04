#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <process_id> <process_name>"
    exit 1
fi

pid=$1
process_name=$2

if ! ps -p $pid > /dev/null; then
    echo "Process with ID $pid does not exist."
    exit 1
fi

output_file="${process_name}_usage_info.txt"

if [ -f "$output_file" ]; then
    rm "$output_file"
fi


touch "$output_file"

while ps -p $pid > /dev/null; do

    cpu_usage=$(ps -p $pid -o %cpu | awk 'NR==2')

    mem_usage=$(ps -p $pid -o rss | awk 'NR==2')

    current_time=$(date +"%Y-%m-%d %H:%M:%S")

    echo "Time: $current_time" >> "$output_file"
    echo "Process: $process_name (PID: $pid)" >> "$output_file"
    echo "CPU Usage: $cpu_usage%" >> "$output_file"
    echo "Memory Usage: $mem_usage kb" >> "$output_file"
    echo "--------------------------" >> "$output_file"

    sleep 1
done