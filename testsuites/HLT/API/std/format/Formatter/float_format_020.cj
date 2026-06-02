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

    var res1_1 = a.format("-20")
    var res2_1 = a.format("+20")
    var res3_1 = a.format("20")
    var res4_1 = a.format("020")

    var res1_2 = b.format("-.20")
    var res2_2 = b.format("+.20")
    var res3_2 = b.format(".20")
    var res4_2 = b.format("0.20")

    var res1_3 = c.format("-e")
    var res2_3 = c.format("+g")
    var res3_3 = d.format("#E")
    var res4_3 = e.format("0G")
    if (res1_1 != "-0.340088           ") {
        return 1
    }
    if (res2_1 != "           -0.340088") {
        return 2
    }
    if (res3_1 != "           -0.340088") {
        return 3
    }
    if (res4_1 != "-000000000000.340088") {
        return 4
    }
    if (res1_2 != "0.34000000357627868652") {
        return 5
    }
    if (res2_2 != "+0.34000000357627868652") {
        return 6
    }
    if (res3_2 != "0.34000000357627868652") {
        return 7
    }
    if (res4_2 != "0.34000000357627868652") {
        return 8
    }

    if (res1_3 != "3.034000e+01") {
        return 9
    }
    if (res2_3 != "+30.34") {
        return 10
    }
    if (res3_3 != "0.000000E+00") {
        return 11
    }
    if (res4_3 != "-0") {
        return 12
    }

    return 0
}
