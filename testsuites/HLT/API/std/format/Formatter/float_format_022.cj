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

    var res1_1 = a.format(".40e")
    var res2_1 = a.format(".40g")
    var res3_1 = a.format(".40")

    var res1_2 = b.format(".40e")
    var res2_2 = c.format(".40g")
    var res3_2 = c.format(".40G")

    var res1_3 = d.format(".40e")
    var res2_3 = e.format(".40g")
    var res3_3 = d.format(".40G")

    if (res1_1 != "-3.4008789062500000000000000000000000000000e-01") {
        return 1
    }
    if (res2_1 != "-0.340087890625") {
        return 2
    }
    if (res3_1 != "-0.3400878906250000000000000000000000000000") {
        return 3
    }

    if (res1_2 != "3.4000000357627868652343750000000000000000e-01") {
        return 4
    }
    if (res2_2 != "30.33999999999999985789145284797996282578") {
        return 5
    }
    if (res3_2 != "30.33999999999999985789145284797996282578") {
        return 6
    }
    if (res1_3 != "0.0000000000000000000000000000000000000000e+00") {
        return 7
    }
    if (res2_3 != "-0") {
        return 8
    }
    if (res3_3 != "0") {
        return 9
    }

    return 0
}
