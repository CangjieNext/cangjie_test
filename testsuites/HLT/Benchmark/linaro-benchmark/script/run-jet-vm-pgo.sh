#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



export cjHeapSize=16GB

case=$1
case_dir=$2
curPath=$(readlink -f "$(dirname "$0")")
case_path=$curPath/../benchmarks-cj/${case_dir}.cj
output_dir=$curPath/../out/cj/
export JETVMPROP="-Xmx2g -Djet.jprof.dir.path=${output_dir}/jprofs -Djet.profiler"
cjc --output-type=exe --int-overflow wrapping ${case_path} -o ${output_dir}${case}
${output_dir}${case}
cjc --output-type=cbc --int-overflow wrapping --jc-options="+pgo -jprofile=${output_dir}/jprofs/${case}.jprof" ${case_path} -o ${output_dir}${case}.cbc

get_result() {
    cd ${output_dir}
    export JETVMPROP="-Xmx2g"
    res=`cj ./${case}.cbc`
    echo "${case_dir}:${res}" >> ${curPath}/cj_vm_pgo.log
}

get_result
