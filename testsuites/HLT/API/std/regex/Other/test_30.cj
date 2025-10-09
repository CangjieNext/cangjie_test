/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  ../../asan
// EXEC: %compiler %cmp_opt %compile_lib_opt asan/asanGC.cj -o asan.%middle
// EXEC: %compiler %cmp_opt asan.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.regex.*
import asan.*
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
    var cases: Array<Cases> = [
        //  Cases("***","test","123","test1test2test3test") // => RegexException: Compilation for pattern `***` failed at offset 0: quantifier does not follow a repeatable item.
    ]
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
    asanGC()
    return 0
}
