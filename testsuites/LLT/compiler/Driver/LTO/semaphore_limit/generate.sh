# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
#
# See https://cangjie-lang.cn/pages/LICENSE for license information.

#!/bin/sh

i=0
while [ $i -ne 150 ]
do
    echo "package pkg$i" > pkg$i.cj
    echo "$i"
    cjc pkg$i.cj --output-type=staticlib --lto=thin -o libpkg$i.bc
    i=$(($i+1))
done