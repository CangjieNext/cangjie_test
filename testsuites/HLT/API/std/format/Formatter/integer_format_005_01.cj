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
    try {
        var res1 = a.format("00O")
        var res2 = a.format("0.0O")
    } catch (e: IllegalArgumentException) {
        if (e.toString() == "IllegalArgumentException: Wrong format string '00O' for 'UInt' type.") {
            return 0
        }
    }
    return 1
}
