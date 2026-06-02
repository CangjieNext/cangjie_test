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
    var d = -0
    var res1 = a.format("0")
    var res2 = b.format("0")
    var res3 = c.format("0")

    var res4 = a.format("010")
    var res6 = a.format("02")

    var res7 = b.format("010")
    var res9 = b.format("03")

    var res10 = c.format("010")
    var res10_1 = d.format("010")
    var res12 = c.format("01")

    if (res1 != "20") {
        return 1
    }
    if (res2 != "-20") {
        return 2
    }
    if (res3 != "0") {
        return 3
    }

    if (res4 != "0000000020") {
        return 4
    }
    if (res6 != "20") {
        return 6
    }

    if (res7 != "-000000020") {
        return 7
    }

    if (res9 != "-20") {
        return 9
    }

    if (res10 != "0000000000") {
        return 10
    }
    if (res10_1 != "0000000000") {
        return 11
    }
    if (res12 != "0") {
        return 12
    }

    return 0
}
