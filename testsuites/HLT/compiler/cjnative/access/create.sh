# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

set -v
cp $1.cj $2.cj
cp $1.txt $2.txt
sed -i "s/$1/$2/g" $2.txt