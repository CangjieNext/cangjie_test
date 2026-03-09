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
// EXEC: %compiler %cmp_opt %cmp_utest_opt asan.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.regex.*
import asan.*
import std.unittest.*
import std.unittest.testmacro.*

main(): Int64 {
    var pattern = #"^.[a-c].$"#
    var str = """
aAA
bBB
cCC"""
    var regex = Regex(pattern, RegexOption().multiLine().ignoreCase())
    var matcher = Matcher(regex, str)
    var res = matcher.findAll().getOrThrow()
    @Assert(res[0].matchString(), "aAA")
    @Assert(res[1].matchString(), "bBB")
    @Assert(res[2].matchString(), "cCC")
    asanGC()
    return 0
}
