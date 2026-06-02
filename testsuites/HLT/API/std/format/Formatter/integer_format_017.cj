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

    var flags = '-'
    var width = 10
    var precision = 8
    var special = 'x'
    var res1 = a.format("${flags}${width}.${precision}${special}")
    var res2 = a.format("-10.8x")

    if (res1 == res2 && res1 == "00000014  ") {
        return 0
    }

    return 1
}
