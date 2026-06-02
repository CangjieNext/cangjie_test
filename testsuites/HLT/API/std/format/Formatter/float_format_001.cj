/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.convert.*

// flags '-'

main(): Int64 {
    var a: Float16 = -0.34
    var b: Float32 = .34
    var c: Float64 = 3_0.3__4_
    var d: Float64 = 20.00

    var res1 = a.format("-20") // left  align
    var res2 = b.format("+20") // right align
    var res3 = c.format("10") // left align
    var res4 = d.format("-10") // left align
    var res5 = d.format("-") // left align

    if (res1 != "-0.340088           ") {
        return 1
    }
    if (res2 != "           +0.340000") {
        return 2
    }
    if (res3 != " 30.340000") {
        return 3
    }
    if (res4 != "20.000000 ") {
        return 4
    }
    if (res5 != "20.000000") {
        return 5
    }

    return 0
}
