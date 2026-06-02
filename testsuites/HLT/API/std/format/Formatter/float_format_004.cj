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
    var a: Float16 = -3.1241
    var b: Float32 = .34
    var c: Float64 = 3_0.3__4_
    var d: Float64 = 0.0

    var res1 = a.format("0")
    var res2 = b.format("0")
    var res3 = c.format("0")

    var res4 = a.format("010")
    var res5 = a.format("01")
    var res6 = a.format("02")

    var res7 = b.format("010")
    var res8 = b.format("01")
    var res9 = b.format("03")

    var res10 = c.format("010")
    var res11 = d.format("010")
    var res12 = c.format("01")
    var res13 = (-0.0).format("01")

    if (res1 != "-3.125000") {
        return 1
    }
    if (res2 != "0.340000") {
        return 2
    }
    if (res3 != "30.340000") {
        return 3
    }
    if (res4 != "-03.125000") {
        return 4
    }
    if (res5 != "-3.125000") {
        return 5
    }
    if (res6 != "-3.125000") {
        return 6
    }

    if (res7 != "000.340000") {
        return 7
    }
    if (res8 != "0.340000") {
        return 8
    }
    if (res9 != "0.340000") {
        return 9
    }

    if (res10 != "030.340000") {
        return 10
    }
    if (res11 != "000.000000") {
        return 11
    }
    if (res12 != "30.340000") {
        return 12
    }
    if (res13 != "-0.000000") {
        return 13
    }

    return 0
}
