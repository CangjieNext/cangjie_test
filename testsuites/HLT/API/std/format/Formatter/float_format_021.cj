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

    var res1_1 = a.format("10.20")
    var res2_1 = b.format("10.20")
    var res3_1 = c.format("40.20")
    var res4_1 = d.format("10.10")

    var res1_2 = a.format("10e")
    var res2_2 = b.format("10E")
    var res3_2 = c.format("20G")
    var res4_2 = e.format("20g")

    if (res1_1 != "-0.34008789062500000000") {
        return 1
    }
    if (res2_1 != "0.34000000357627868652") {
        return 2
    }
    if (res3_1 != "                 30.33999999999999985789") {
        return 3
    }
    if (res4_1 != "0.0000000000") {
        return 4
    }
    if (res1_2 != "-3.400879e-01") {
        return 5
    }
    if (res2_2 != "3.400000E-01") {
        return 6
    }
    if (res3_2 != "               30.34") {
        return 7
    }
    if (res4_2 != "                  -0") {
        return 8
    }

    return 0
}
