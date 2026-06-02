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
    var cases = [
        Cases("b", "", "", ""),
        Cases("b", "x", "", ""),
        Cases("b", "", "abc", "ac"),
        Cases("b", "x", "abc", "axc"),
        Cases("y", "", "abc", "abc"),
        Cases("y", "x", "abc", "abc"),
        Cases("[a-c]*", "x", "def", "xdxexfx"),
        Cases("[a-c]*", "x", "abc", "xx"),
        // Cases("[^\u{6211}]","x","abc\u{6211}abc","x"), // not supported.

        Cases("^[a-c]*", "x", "abcdabc", "xdabc"),
        Cases("[a-c]*$", "x", "abcdabc", "abcdxx"),
        Cases("^[a-c]*$", "x", "abcdabc", "abcdabc"),
        Cases("^[a-c]*", "x", "abc", "x"),
        Cases("[a-c]*$", "x", "abc", "xx"),
        Cases("^[a-c]*$", "x", "abc", "x"),
        Cases("^[a-c]*", "x", "abc", "x"),
        Cases("^[a-c]*", "x", "dabcd", "xdabcd"),
        Cases("[a-c]*$", "x", "dabce", "dabcexx"),
        Cases("^[a-c]*$", "x", "dabce", "dabce"),
        Cases("abc", "def", "abcdef", "defdef"),
        Cases("bc", "BC", "abcabcdef", "aBCaBCdef"),
        Cases("abc", "", "abcdabc", "d"),
        Cases("x", "xXx", "xxxXxxx", "xXxxXxxXxXxXxxXxxXx"),
        Cases("abc", "d", "abc", "d"),
        Cases(".+", "x", "abc", "x"),
        Cases("[a-c]+", "x", "abcdabcdef", "xdxdef"),
        Cases("(a)", "<\${0}>", "xaxaxa", "x<\${0}>x<\${0}>x<\${0}>")
    ]
    for (c in cases) {
        var regex = Regex(c.pattern, RegexOption().multiLine())
        println("pattern is ${c.pattern}")
        println("str is ${c.str}")
        println("replacement is ${c.replacement}")
        var matcher = Matcher(regex, c.str)
        let res = matcher.replaceAll(c.replacement)
        if (res != c.res) {
            throw Exception("${res} != ${c.res}")
        }
    }
    asanGC()
    return 0
}
