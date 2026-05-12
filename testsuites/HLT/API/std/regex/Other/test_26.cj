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
// ASSERT: scan RegexException: Compilation for pattern `a\\1` failed at offset 2: reference to non-existent subpattern.

import std.regex.*
import std.collection.*

class Cases {
    var pattern: String
    var replacement: String
    var str: String
    var res: String
    init(p: String, i: String, s: String, r: String) {
        pattern = p
        replacement = i
        str = s
        res = r
    }
}

main(): Int64 {
    var s = "*"
    var cases = [Cases("a\\${1}", "x", "a$", "abc")]
    for (c in cases) {
        var regex = Regex(c.pattern, RegexOption().multiLine())
        println("pattern is ${c.pattern}")
        println("str is ${c.str}")
        var matcher = Matcher(regex, c.str)
        let res = matcher.replaceAll(c.replacement)
        if (res != c.res) {
            throw Exception("${res} != ${c.res}")
        }
    }
    return 0
}
