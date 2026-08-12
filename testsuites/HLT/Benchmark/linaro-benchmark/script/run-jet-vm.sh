#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


set -x
export cjHeapSize=16GB
export JETVMPROP="-Xmx2G"

case=$1
case_dir=$2
curPath=$(readlink -f "$(dirname "$0")")
case_path=$curPath/../benchmarks-cj/${case_dir}.cj
output=$curPath/../out/cj/
echo ${case_dir} ${case}
cjc --output-type=cbc --int-overflow wrapping ${case_path} -o ${output}${case}.cbc

get_result() {
    cd $output
    res=`cj ./${case}.cbc`
    echo "${case_dir}:${res}" >> ${curPath}/cj_vm.log
    cd -
}

get_result
