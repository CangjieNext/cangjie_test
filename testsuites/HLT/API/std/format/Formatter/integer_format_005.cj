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

    var res4 = a.format("040B")
    var res5 = a.format("0O")
    var res6 = a.format("08X")

    var res7 = b.format("070b")
    var res8 = b.format("0o")
    var res9 = b.format("017x")

    var res10 = c.format("010b")
    var res10_1 = d.format("010o")
    var res11 = c.format("0o")
    var res12 = d.format("0x")

    if (res4 != "0000000011111111111111111111111111111111") {
        return 4
    }
    if (res5 != "37777777777") {
        return 5
    }
    if (res6 != "FFFFFFFF") {
        return 6
    }

    if (res7 != "-000001000000000000000000000000000000000000000000000000000000000000000") {
        return 7
    }
    if (res8 != "-1000000000000000000000") {
        return 8
    }
    if (res9 != "-8000000000000000") {
        return 9
    }

    if (res10 != "0000000000") {
        return 10
    }
    if (res10_1 != "0000000000") {
        return 101
    }

    if (res11 != "0") {
        return 11
    }
    if (res12 != "0") {
        return 12
    }

    return 0
}
