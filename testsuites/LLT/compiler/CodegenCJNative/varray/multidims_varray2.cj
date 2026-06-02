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
    var varr1: VArray<VArray<VArray<Int64, $2>, $3>, $4> = [
        [[1, 2], [3, 4], [5, 6]],
        [[21, 31], [41, 51], [61, 71]],
        [[22, 32], [42, 52], [62, 72]],
        [[23, 33], [43, 53], [63, 73]]
    ]

    if (varr1[0][1][1] != 4 || varr1[3][2][1] != 73) {
        return 1
    }
    return 0
}
