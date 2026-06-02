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
    var varr: VArray<Int64, $5> = VArray<Int64, $5> {i => i}
    var sum = 0
    for (i in 0..5) {
        sum += varr[i]
    }
    if (sum == 10 && varr.size == 5) {
        return 0
    }
    return 1
}
