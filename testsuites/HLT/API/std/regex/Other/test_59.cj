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
// ASSERT: scan res is abc1
// ASSERT: scan res is abc2
// ASSERT: scan res is abc3
// ASSERT: scan res is abc1
// ASSERT: scan res is abc3

import std.regex.*
import asan.*

main(): Int64 {
    var pattern = "abc[0-9]"
    var str = "abc1abc2abc3"
    var regex = Regex(pattern)
    var matcher = Matcher(regex, str)
    var res = matcher.find().getOrThrow()
    println("res is ${res.matchString()}")

    res = matcher.find().getOrThrow()
    println("res is ${res.matchString()}")

    res = matcher.find().getOrThrow()
    println("res is ${res.matchString()}")

    res = matcher.find(0).getOrThrow()
    println("res is ${res.matchString()}")

    res = matcher.find(8).getOrThrow()
    println("res is ${res.matchString()}")
    asanGC()
    return 0
}
