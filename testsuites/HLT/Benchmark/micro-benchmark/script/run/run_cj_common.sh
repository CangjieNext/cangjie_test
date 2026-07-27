#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



cwd=`pwd`
shell_dir=$(cd `dirname $0`; pwd)

exec_command=$1
module_name=$2
file_name=$3

result_dir=$shell_dir/../result
result_file=$result_dir/cj-${module_name}-result.log
error_info=$result_dir/$module_name-error-info.txt
output_info=$result_dir/$module_name-output-info.txt

echo "File-Name:"$file_name
rm -rf $error_info $output_info

timeout 1200 $exec_command 2>$error_info 1>$output_info
if [ $? -ne 0 ]; then
	cat $error_info >>$result_file
	cat $output_info >>$result_file
	echo "ERROR-CJ:FAIL FILE: ${file_name}" >>$result_file
	echo -e "\tFail-Module:"$module_name
	echo -e "\tFail-File:"$file_name
else
	if [ -s $error_info ]; then
		cat $error_info >>$result_file
		echo "ERROR-CJ:EXCEPTION FILE: ${file_name}" >>$result_file
	fi
	cat $output_info >>$result_file
fi

rm -rf $error_info $output_info
cd $cwd
exit





























