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

    var flags = '-'
    var width = 10
    var precision = 8
    var special = 'g'
    var res1 = a.format("${flags}${width}.${precision}${special}")
    var res2 = b.format("${flags}${width}.${precision}${special}")
    var res3 = c.format("${flags}${width}.${precision}${special}")
    var res4 = d.format("${flags}${width}.${precision}${special}")

    if (res1 != "-0.34008789") {
        return 1
    }
    if (res2 != "0.34      ") {
        return 2
    }
    if (res3 != "30.34     ") {
        return 3
    }
    if (res4 != "0         ") {
        return 4
    }

    return 0
}
