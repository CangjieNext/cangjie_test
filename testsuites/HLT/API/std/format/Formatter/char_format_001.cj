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
    var a: Rune = r'a'
    var b = r'-'
    var c = r'\n'
    var d = r'\b'

    var res1 = a.format("-10") // left  align
    var res2 = b.format("10") // right align
    var res3 = c.format("10") // right align
    var res4 = c.format("-") // left align
    var res5 = d.format("-") // left align

    if (res1 != "a         ") {
        return 1
    }
    if (res2 != "         -") {
        return 2
    }
    if (res3 != "         \n") {
        return 3
    }
    if (res4 != "\n") {
        return 4
    }
    if (res5 != "\b") {
        return 5
    }
    return 0
}
