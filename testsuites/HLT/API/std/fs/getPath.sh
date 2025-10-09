# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

#!/bin/bash

$(rm -rf queryresult.txt)
$(rm -rf mypath.cj)
files=$(find /dev -type $1 > queryresult.txt )
firstline=$(cat queryresult.txt| head -n 1)
echo var mypath:String=\"$(echo $firstline)\" >mypath.cj
