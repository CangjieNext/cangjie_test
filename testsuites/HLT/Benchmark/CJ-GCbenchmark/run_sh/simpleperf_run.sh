# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

testcase=$1
name=$3
# benchmark memory test
cmd="$testcase $2 $3 $4 $5 &"
echo ${cmd} | awk '{run=$0; system(run)}'
pid=`pidof ${testcase}`
simpleperf record -g -p ${pid} --duration 10 -o ${name}/pref.data
simpleperf report -g -i ${name}/pref.data > ${name}/pref.txt