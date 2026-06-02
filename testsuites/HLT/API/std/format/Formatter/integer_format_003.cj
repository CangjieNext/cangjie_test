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
    var a: UInt32 = 20
    var b: Int64 = -20
    var c = 0
    var res1 = a.format("#")
    var res2 = b.format("#")
    var res3 = c.format("#o")
    var res4 = a.format("#o")
    var res4_1 = a.format("#O")
    var res5 = a.format("#b")
    var res5_1 = a.format("#B")
    var res6 = a.format("#x")
    var res6_1 = a.format("#X")

    if (res1 != "20") {
        return 1
    }
    if (res2 != "-20") {
        return 2
    }
    if (res3 != "0o0") {
        return 3
    }
    if (res4 != "0o24") {
        return 4
    }
    if (res4_1 != "0O24") {
        return 5
    }
    if (res5 != "0b10100") {
        return 6
    }
    if (res5_1 != "0B10100") {
        return 7
    }
    if (res6 != "0x14") {
        return 8
    }
    if (res6_1 != "0X14") {
        return 9
    }

    return 0
}
