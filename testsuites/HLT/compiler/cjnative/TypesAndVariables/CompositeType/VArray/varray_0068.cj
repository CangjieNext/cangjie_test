/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var varr: VArray<(VArray<Int64, $3>, (VArray<Int64, $4>)), $2> = [([1, 2, 3], ([1, 2, 3, 4])), ([1, 2, 3], ([1, 2, 3,
            4]))]
    varr[0] = ([-1, 2, 3], ([-1, 2, 3, 4]))
    var sum = varr[0][0][0] + varr[0][1][0] + varr[1][0][0] + varr[1][1][0]
    return sum
}
