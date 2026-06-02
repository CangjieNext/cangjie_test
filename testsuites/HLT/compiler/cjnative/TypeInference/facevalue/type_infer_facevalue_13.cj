/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var i1: Int64 = if (true) {
        2
    } else {
        3
    }
    var i2: Float64 = if (false) {
        2.0
    } else {
        3.0
    }
    var i3: Float64 = if (true) {
        2.0
    } else {
        3.0
    }

    var flag1: Int64 = 2
    var flag2: Float64 = 3.0
    var flag3: Float64 = 2.0
    var res1 = i1 == flag1
    var res2 = i2 == flag2
    var res3 = i3 == flag3
    if (!res1 || !res2 || !res3) {
        return 1
    }
    return 0
}
