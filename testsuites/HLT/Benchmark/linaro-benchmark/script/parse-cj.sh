#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



case=$1
curPath=$(readlink -f "$(dirname "$0")")
output=$curPath/../out/cj/

parse_result() {
    cd $output

    case_line=`grep -n $case tmp.log | awk -F ":" '{print $1}'`
    time_line=`expr $case_line - 1`
    time_data=`sed -n "${time_line}p" tmp.log`

    echo "$case:$time_data" >> cj.log

    # memory_line=`expr $case_line + 9`
    # tmp=`sed -n "${memory_line}p" tmp.log`
    # memory_data=${tmp#*: }
    # echo "memory_data: $memory_data" >> cj.log
}

parse_result
