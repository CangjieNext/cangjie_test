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
// RUN-EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan res is abc
// ASSERT: scan res is ABC
// ASSERT: scan res is XYZ
// ASSERT: scan res is xyz

import std.regex.*
import asan.*

main(): Int64 {
    var pattern = #"^.[A-Z].$"#
    var str = """
abc
ABC
XYZ
xyz"""
    var regex = Regex(pattern, RegexOption().multiLine().ignoreCase())
    var matcher = Matcher(regex, str)
    var res = matcher.findAll().getOrThrow()
    for (i in res) {
        println("res is ${i.matchString()}")
    }
    asanGC()
    return 0
}
