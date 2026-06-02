/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.convert.*

main(): Int64 {
    var a: Int32 = -20
    var res1 = a.format("-10")
    var res2 = a.format("+10")
    var res3 = (-20).format("10")
    var res4 = a.format("-")

    if (res1 != "-20       ") {
        return 1
    }
    if (res2 != "       -20") {
        return 2
    }
    if (res3 != "       -20") {
        return 3
    }
    if (res4 != "-20") {
        return 4
    }

    return 0
}
