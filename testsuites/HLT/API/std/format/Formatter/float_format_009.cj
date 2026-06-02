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
    try {
        var res1 = a.format("-0")
        var res2 = b.format("--20")
        var res3 = b.format("-0.02")
    } catch (e: IllegalArgumentException) {
        if (e.toString() == "IllegalArgumentException: Wrong format string '-0' for 'float' type.") {
            return 0
        }
    }
    return 1
}
