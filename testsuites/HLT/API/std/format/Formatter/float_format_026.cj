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
    var f1 = -3.14
    var f2 = 2.4e-1
    var f3 = 2e3
    var f4 = .8
    var f5 = .123e2
    var f6 = 0x1.1p0
    let f7 = 0x1p2
    let f8 = 0x.2p4

    var flags = '-'
    var width = 20
    var precision = 8
    var special = 'g'
    var res1 = f1.format("${flags}${width}.${precision}e")
    var res2 = f2.format("${flags}${width}.${precision}g")
    var res3 = f3.format("${flags}${width}.${precision}e")
    var res4 = f4.format("${flags}${width}.${precision}g")
    var res5 = f5.format("${flags}${width}.${precision}e")
    var res6 = f6.format("${flags}${width}.${precision}")
    var res7 = f7.format("${flags}${width}.${precision}g")
    var res8 = f8.format("${flags}${width}.${precision}")

    if (res1 != "-3.14000000e+00     ") {
        return 1
    }
    if (res2 != "0.24                ") {
        return 1
    }
    if (res3 != "2.00000000e+03      ") {
        return 1
    }
    if (res4 != "0.8                 ") {
        return 1
    }
    if (res5 != "1.23000000e+01      ") {
        return 1
    }
    if (res6 != "1.06250000          ") {
        return 1
    }
    if (res7 != "4                   ") {
        return 1
    }
    if (res8 != "2.00000000          ") {
        return 1
    }

    return 0
}
