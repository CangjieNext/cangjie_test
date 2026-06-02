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
    var a: UInt32 = 4294967295
    var b: Int64 = -9223372036854775808
    var c = 0
    var d = -0

    var res1_1 = a.format(".40b")
    var res2_1 = a.format(".40o")
    var res3_1 = a.format(".40x")
    var res4_1 = a.format(".40")

    var res1_2 = b.format(".40b")
    var res2_2 = b.format(".40o")
    var res3_2 = b.format(".40x")
    var res4_2 = b.format(".40")

    var res1_3 = 0.format(".40b")
    var res2_3 = (-0).format(".40o")
    var res3_3 = 0.format(".40x")
    var res4_3 = (-0).format(".40")

    if (res1_1 != "0000000011111111111111111111111111111111") {
        return 11
    }
    if (res2_1 != "0000000000000000000000000000037777777777") {
        return 21
    }
    if (res3_1 != "00000000000000000000000000000000ffffffff") {
        return 31
    }
    if (res4_1 != "0000000000000000000000000000004294967295") {
        return 41
    }

    if (res1_2 != "-1000000000000000000000000000000000000000000000000000000000000000") {
        return 12
    }
    if (res2_2 != "-0000000000000000001000000000000000000000") {
        return 22
    }
    if (res3_2 != "-0000000000000000000000008000000000000000") {
        return 32
    }
    if (res4_2 != "-0000000000000000000009223372036854775808") {
        return 42
    }

    if (res1_3 != "0000000000000000000000000000000000000000") {
        return 13
    }
    if (res2_3 != "0000000000000000000000000000000000000000") {
        return 23
    }
    if (res3_3 != "0000000000000000000000000000000000000000") {
        return 33
    }
    if (res4_3 != "0000000000000000000000000000000000000000") {
        return 43
    }

    return 0
}
