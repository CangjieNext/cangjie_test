#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.



cwd=`pwd`
shell_dir=$(cd `dirname $0`; pwd)
cd $cwd

module_name=$1
run_dir=$shell_dir/../../go/$module_name
result_dir=$shell_dir/../result
result_file=$result_dir/go-${module_name}-result.log

rm -rf $result_file

go_path=`which go`
if [ $? -ne 0 ]
then
	echo "ERROR-GO:Build Error.Not Found go!" >$result_file
	exit
fi
go_root=`realpath $go_path | sed -e "s/\\/bin\\/go$//"`
export GOROOT=$go_root
export PATH=$GOROOT/bin:$PATH
export GO111MODULE=on
cd $run_dir
go test -bench=. -timeout=30m >>$result_file 2>&1
cd $cwd
