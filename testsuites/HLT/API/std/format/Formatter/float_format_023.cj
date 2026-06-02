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

    var res1_1 = a.format("-10.40")
    var res2_1 = a.format("+50.40")
    var res3_1 = a.format("#50.40")
    var res4_1 = a.format("0.40e")

    var res1_2 = b.format("-10e")
    var res2_2 = b.format("+50g")
    var res3_2 = b.format("#50G")
    var res4_2 = b.format("50G")

    if (res1_1 != "-0.3400878906250000000000000000000000000000") {
        return 1
    }
    if (res2_1 != "       -0.3400878906250000000000000000000000000000") {
        return 2
    }
    if (res3_1 != "       -0.3400878906250000000000000000000000000000") {
        return 3
    }
    if (res4_1 != "-3.4008789062500000000000000000000000000000e-01") {
        return 4
    }

    if (res1_2 != "3.400000e-01") {
        return 5
    }
    if (res2_2 != "                                             +0.34") {
        return 6
    }
    if (res3_2 != "                                              0.34") {
        return 7
    }
    if (res4_2 != "                                              0.34") {
        return 8
    }

    return 0
}
