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
    var str: String
    var res: String
    init(p: String, s: String, r: String) {
        pattern = p
        str = s
        res = r
    }
}

main(): Int64 {
    var str = "\n"
    println(str.toArray())
    var cases = [Cases("(a){0}", "", "")]
    for (c in cases) {
        var regex = Regex(c.pattern, RegexOption().multiLine())
        println("pattern is ${c.pattern}")
        println("str is ${c.str}")
        var matcher = Matcher(regex, c.str)
        if (c.res == "None") {
            match (matcher.findAll()) {
                case Some(T) => throw Exception("should not match!")
                case None => ()
            }
        } else {
            var res = matcher.findAll().getOrThrow()
            var total = ""
            for (r in res) {
                total += r.matchString()
            }
            if (total != c.res) {
                throw Exception("${total.toArray()} != ${c.res.toArray()}")
            }
        }
    }
    asanGC()
    return 0
}
