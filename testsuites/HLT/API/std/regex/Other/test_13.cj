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
    var cases = [
        Cases("^abcdefg", "abcdefg", "abcdefg"),
        Cases("abcd..", "abcdef", "abcdef"),
        Cases("a+", "baaab", "aaa"),
        Cases("b", "abc", "b"),
        Cases(".", "a", "a"),
        Cases(".*", "abcdef", "abcdef"),
        Cases("^", "abcde", ""),
        Cases("&", "abcde", "None"),
        Cases("^abcd$", "abcd", "abcd"),
        Cases("a*", "baaab", "aaa"),
        Cases("[a-z]+", "abcd", "abcd"),
        Cases("[a-z]+", "ab1234cd", "abcd"),
        Cases(#"[a\-\]z]+"#, "az]-bcz", "az]-z"),
        Cases(#"[^\n]+"#, "abcd\n", "abcd"),
        Cases("(a)", "a", "a"),
        Cases("(.*)", "abcd", "abcd"),
        Cases("(..)(..)", "abcd", "abcd"),
        Cases("(([^xyz]*)(d))", "abcd", "abcd"),
        Cases("((a|b|c)*(d))", "abcd", "abcd"),
        Cases("(((a|b|c)*)(d))", "abcd", "abcd"),
        Cases("a*(|(b))c*", "aacc", "aacc"),
        Cases("(.*).*", "ab", "ab"),
        Cases("[.]", ".", "."),
        Cases("/$", "/abc/", "/"),
        Cases("/$", "/abc", "None"),
        Cases("/$", "/abc", "None"),
        Cases(".", "abc", "abc"),
        Cases("(.)", "abc", "abc"),
        Cases("..", "abcd", "abcd"),
        Cases("ab*", "abbaab", "abbaab"),
        Cases("a(b*)", "abbaab", "abbaab"),
        Cases("ab$", "cab", "ab"),
        Cases("axxb$", "axxcb", "None"),
        Cases("data", "daXY data", "data"),
        Cases("da(.)a$", "daXY data", "data"),
        Cases("zx+", "zzx", "zx"),
        Cases("ab$", "abcab", "ab"),
        Cases("(aa)*$", "a", ""),
        Cases("(?:.|(?:.a))", "", "None"),
        Cases("(?:A(?:A|a))", "Aa", "Aa"),
        Cases("(?:A|(?:A|a))", "a", "a"),
        Cases("(?:(?:^).)", "\n", "None"),
        Cases("\\B", "x", "None"),
        Cases("\\B", "xx", ""),
        Cases(#"(\/\*(\s|.)*?\*\/)|(\/\/.*)"#, "//abc", "//abc"),
        Cases(#"(\/\*(\s|.)*?\*\/)|(\/\/.*)"#, "/*...*/", "/*...*/"),
        Cases(
            #"(\/\*(\s|.)*?\*\/)|(\/\/.*)"#,
            """
   	         /*...
   	         ...*/""",
            """
/*...
   	         ...*/"""
        ),
        Cases("(|a)*", "aa", ""),
        Cases(#"[^\S\s]"#, "abcd", "None"),
        Cases(#"[^\S[:space:]]"#, "abcd", "None"),
        Cases(#"[^\D\d]"#, "abcd", "None"),
        Cases(#"(?i)\W"#, "k", "None"),
        Cases(#"(?i)\W"#, "s", "None"),
        Cases(#"\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\{\|\}\~"#, "!\"#$%&'()*+,-./:;<=>?@[\\]^_{|}~",
            "!\"#$%&'()*+,-./:;<=>?@[\\]^_{|}~"),
        Cases(#"[\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\\\]\^\_\{\|\}\~]+"#, "!\"#$%&'()*+,-./:;<=>?@[\\]^_{|}~",
            "!\"#$%&'()*+,-./:;<=>?@[\\]^_{|}~"),
        Cases(#"."#, "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890",
            "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm1234567890")
    ]
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
            let res = matcher.findAll().getOrThrow()
            var utf8_res = Array<Array<UInt8>>(res.size, {i => res[i].matchString().toArray()})
            //}
            var total = ""
            for (r in res) {
                total += r.matchString()
            }
            if (total != c.res) {
                throw Exception("${total} != ${c.res}")
            }
        }
    }
    asanGC()
    return 0
}
