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

    var res1_1 = a.format("10.20")
    var res2_1 = a.format("20.10")
    var res3_1 = a.format("20.20")
    var res4_1 = a.format("10.10")

    var res1_2 = a.format("10b")
    var res2_2 = a.format("10o")
    var res3_2 = a.format("20x")
    var res4_2 = a.format("20")

    var res1_3 = b.format("10b")
    var res2_3 = b.format("10o")
    var res3_3 = b.format("20x")
    var res4_3 = b.format("20")

    var res1_4 = 0.format("10b")
    var res2_4 = 0.format("10o")
    var res3_4 = (-0).format("20x")
    var res4_4 = (-0).format("20")

    if (res1_1 != "00000000004294967295") {
        return 11
    }
    if (res2_1 != "          4294967295") {
        return 21
    }
    if (res3_1 != "00000000004294967295") {
        return 31
    }
    if (res4_1 != "4294967295") {
        return 41
    }
    if (res1_2 != "11111111111111111111111111111111") {
        return 12
    }
    if (res2_2 != "37777777777") {
        return 22
    }
    if (res3_2 != "            ffffffff") {
        return 32
    }
    if (res4_2 != "          4294967295") {
        return 42
    }
    if (res1_3 != "-1000000000000000000000000000000000000000000000000000000000000000") {
        return 13
    }
    if (res2_3 != "-1000000000000000000000") {
        return 23
    }
    if (res3_3 != "   -8000000000000000") {
        return 33
    }
    if (res4_3 != "-9223372036854775808") {
        return 43
    }
    if (res1_4 != "         0") {
        return 14
    }
    if (res2_4 != "         0") {
        return 24
    }
    if (res3_4 != "                   0") {
        return 34
    }
    if (res4_4 != "                   0") {
        return 44
    }

    return 0
}
