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
    var c: Float64 = 3_0.3__4_
    try {
        var res3 = c.format("#o")
    } catch (e: IllegalArgumentException) {
        if (e.toString() != "IllegalArgumentException: Wrong format string '#o' for 'float' type.") {
            return 1
        }
    }
    return 0
}
