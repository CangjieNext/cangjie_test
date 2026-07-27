#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



cwd=`pwd`
shell_dir=$(cd `dirname $0`; pwd)

module_name=$1
options="-O2 --int-overflow=wrapping --no-sub-pkg"

log_name=$shell_dir/../result/cj-${module_name}-result.log
rm -rf $log_name

run_dir=$shell_dir/../../cj/$module_name
if [ ! -d $run_dir ]; then
    echo "ERROR-CJ:Build Module:${module_name}" >> "$log_name"
    exit
fi

cd $run_dir

log_name=$run_dir/../../script/result/cj-${module_name}-result.log
driver=$run_dir/../../script/run/run_cj_common.sh

if [ -f runcase.sh ]; then
    bash ./runcase.sh
else
    for cj_file in ./*.cj; 
    do
        cj_file=`basename $cj_file`
        cjc $options $cj_file -o $module_name.out >> $log_name 2>&1
        if [ $? -ne 0 ]
        then
            echo "ERROR-CJ:Build File:${module_name}${cj_file}" >> $log_name
            continue
        fi
        bash $driver ./$module_name.out $module_name $cj_file
    done
    rm -rf  $module_name.out
fi

cd $cwd
exit
