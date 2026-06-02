/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.regex.*

main(): Int64 {
    var pattern = #"(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)(a1)(a2)\63"#
    var str = "a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1a2a1"
    var regex = Regex(pattern)
    var matcher = Matcher(regex, str)
    var res = matcher.findAll().getOrThrow()
    for (i in res) {
        println("res is ${i.matchString()}")
    }
    return 0
}
