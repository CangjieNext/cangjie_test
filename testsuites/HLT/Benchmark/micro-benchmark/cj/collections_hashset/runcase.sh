#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



cwd=`pwd`
shell_dir=$(cd `dirname $0`; pwd)

module_name=`basename $cwd`
log_name=$shell_dir/../../script/result/cj-${module_name}-result.log
rm -rf $log_name

options="-O2 --int-overflow=wrapping"
driver=$shell_dir/../../script/run/run_cj_common.sh
common_file="common_collection.cj"

for cj_file in ./*.cj; 
do
	cj_file=`basename $cj_file`
	if [ $cj_file == $common_file ]
    then
        continue
    fi
	cjc $options $cj_file $common_file  -o ./$module_name.out >>$log_name 2>&1
	if [ $? -ne 0 ]
    then
        echo "ERROR-CJ:BUILD FILE: ${cj_file}" >>$log_name
        continue
    fi
	bash $driver ./$module_name.out $module_name $cj_file
done

rm -rf  $module_name.out
cd $cwd
