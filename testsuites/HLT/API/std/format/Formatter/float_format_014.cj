/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.convert.*

main(): Int64 {
    var a: Float16 = -0.34
    var b: Float32 = .34
    var c: Float64 = 3_0.3__4_
    var d: Float64 = 0.0
    var e: Float64 = -0.0

    var res1 = a.format(".1")
    var res2 = b.format("10.5")
    var res3 = c.format("010.1")
    var res4 = d.format("010.6")
    var res5 = e.format("010.2")

    if (res1 != "-0.3") {
        return 1
    }
    if (res2 != "   0.34000") {
        return 2
    }
    if (res3 != "00000030.3") {
        return 3
    }
    if (res4 != "000.000000") {
        return 4
    }
    if (res5 != "-000000.00") {
        return 5
    }

    return 0
}
