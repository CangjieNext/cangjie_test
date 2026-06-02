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
    var varr: VArray<Range<Int64>, $1> = [0..1 : 1]
    varr[0] = 0..10 : 1
    var sum = 0
    for (i in varr[0]) {
        sum += i
    }
    return sum - 45
}
