// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

// EXEC-PIPE: %compiler %cmp_opt %enableO2 -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

main() {
    let varr1: VArray<(Rune, Int64), $5> = [(r'a', 1), (r'b', 2), (r'c', 3), (r'c', 4), (r'd', 5)]
    var z = {=> varr1;}
    var c = z()
    if (c[0][0] != r'a') {
        return 1
    }

    return 0
}
