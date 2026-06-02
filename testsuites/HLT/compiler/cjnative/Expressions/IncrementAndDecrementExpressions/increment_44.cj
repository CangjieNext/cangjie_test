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

type int1 = Int64

type int2 = Int32

main(): Int64 {
    var i1: Int64 = 1
    var i2: int1 = 2
    var i3: Int32 = 1
    var i4: int2 = 2
    i1--
    i1++
    var res1: int1 = i1 + i2
    i3--
    i3++
    var res2: int2 = i3 + i4
    if (res1 == 3 && res2 == 3) {
        return 0
    }
    return 1
}
