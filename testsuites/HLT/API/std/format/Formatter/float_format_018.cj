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
    var flags = '<'
    var width = -0
    var precision = -80
    var special = 'l'
    try {
        var res = a.format("${flags}${width}.${precision}${special}")
    } catch (e: IllegalArgumentException) {
        println(e)
        if (e.toString() == "IllegalArgumentException: Wrong format string '<0.-80l' for 'float' type.") {
            return 0
        }
    }
    return 1
}
