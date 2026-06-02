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
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

/* SCAN
res is aa
res is aa
res is aa
 */
import std.regex.*
import asan.*
import std.collection.*

main(): Int64 {
    var pattern = #"(a)\1"#
    var str = "a aaa aaaaa"
    var regex = Regex(pattern)
    var matcher = Matcher(regex, str)
    var res = matcher.findAll().getOrThrow()
    for (i in res) {
        println("res is ${i.matchString()}")
    }
    asanGC()
    return 0
}
