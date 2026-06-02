// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

// EXEC-PIPE: %compiler %cmp_opt %enableO2 -o %output %f
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
var varr1: VArray<Int64, $5> = [1, 2, 3, 4, 5]
var varr2: VArray<VArray<Int8, $3>, $2> = [[Int8(1), Int8(2), Int8(3)], VArray<Int8, $3>(repeat: Int8(4))]
var varr3: VArray<(Rune, Int64), $5> = [(r'a', 1), (r'b', 2), (r'c', 3), (r'c', 4), (r'd', 5)]

main() {
    var res1 = varr1[4]
    varr1[4] = 66
    if (res1 != 5 || varr1[4] != 66 || varr2[0][1] != 2 || varr2[0][0] != 1) {
        return 1
    }
    varr3[4] = (r'j', 10)
    if (varr3[4][0] != r'j' || varr3[0][1] != 1) {
        return 1
    }
    return 0
}
