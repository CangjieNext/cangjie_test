/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// (not iOS) RUN-ERRCHECK: %run %run_opt %output %run_args
// (iOS) RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan RegexException: Compilation for pattern `abc)` failed at offset 3: unmatched closing parenthesis.

import std.regex.*

main(): Int64 {
    var pattern = ["abc)"]
    var str = "abc)abc)abc)"
    for (p in pattern) {
        println("pattern:${p}")
        var regex = Regex(p)
        var matcher = Matcher(regex, str)
        var res = matcher.findAll().getOrThrow()
        for (i in res) {
            println("res is ${i.matchString()}")
        }
    }
    return 0
}
