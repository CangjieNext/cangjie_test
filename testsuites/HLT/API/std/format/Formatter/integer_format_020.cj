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

    var res1_1 = a.format("-15")
    var res2_1 = a.format("+15")
    var res3_1 = a.format("#15")
    var res4_1 = a.format("015")

    var res1_2 = b.format("-.30")
    var res2_2 = b.format("+.10")
    var res3_2 = b.format("#.0")
    var res4_2 = b.format("0.20")

    var res1_3 = a.format("-x")
    var res2_3 = b.format("+X")
    var res3_3 = a.format("#b")
    var res4_3 = b.format("0B")

    var res1_4 = 0.format("-O")
    var res2_4 = (-0).format("+o")
    //    var res3_4 = 0.format("#")
    //    var res4_4 = (-0).format("0")

    if (res1_1 != "4294967295     ") {
        return 11
    }
    if (res2_1 != "    +4294967295") {
        return 21
    }
    if (res3_1 != "     4294967295") {
        return 31
    }
    if (res4_1 != "000004294967295") {
        return 41
    }
    if (res1_2 != "-000000000009223372036854775808") {
        return 12
    }
    if (res2_2 != "-9223372036854775808") {
        return 22
    }
    if (res3_2 != "-9223372036854775808") {
        return 32
    }
    if (res4_2 != "-09223372036854775808") {
        return 42
    }
    if (res1_3 != "ffffffff") {
        return 13
    }
    if (res2_3 != "-8000000000000000") {
        return 23
    }
    if (res3_3 != "0b11111111111111111111111111111111") {
        return 33
    }
    if (res4_3 != "-1000000000000000000000000000000000000000000000000000000000000000") {
        return 43
    }
    if (res1_4 != "0") {
        return 14
    }
    if (res2_4 != "+0") {
        return 24
    }

    return 0
}
