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

    var res1 = a.format(".8")
    var res2 = b.format("10.20")
    var res3 = c.format("010.20")
    var res4 = d.format("010.10")
    var res5 = e.format("010.20")

    if (res1 != "-0.34008789") {
        return 1
    }
    if (res2 != "0.34000000357627868652") {
        return 2
    }
    if (res3 != "30.33999999999999985789") {
        return 3
    }
    if (res4 != "0.0000000000") {
        return 4
    }
    if (res5 != "-0.00000000000000000000") {
        return 5
    }

    return 0
}
