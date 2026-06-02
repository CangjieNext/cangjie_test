// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE & Linux) EXEC-PIPE: rm -rf dir;mkdir dir
// (CJNATIVE & Linux) EXEC-PIPE: %compiler %cmp_opt -O2 %f -o %output --apc -j2 --save-temps=./dir
// (CJNATIVE & Linux) EXEC-PIPE: %ls dir/0-%n.bc
// (CJNATIVE & Linux) EXEC-PIPE: %ls dir/1-%n.bc

main() {
    return 0
}
