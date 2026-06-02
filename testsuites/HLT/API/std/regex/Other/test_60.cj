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
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan res is testabc2abc3abc4abc5
// ASSERT: scan res is testtestabc3abc4abc5
// ASSERT: scan res is testtesttestabc4abc5
// ASSERT: scan res is testtesttesttestabc5
// ASSERT: scan res is abc1abc2testabc4abc5

import asan.*
import std.regex.*

main(): Int64 {
    var pattern = "abc[0-9]"
    var str = "abc1abc2abc3abc4abc5"
    var regex = Regex(pattern)
    var matcher = Matcher(regex, str)
    var res = matcher.replace("test")
    println("res is ${res}")

    res = matcher.replace("test")
    println("res is ${res}")

    res = matcher.replace("test")
    println("res is ${res}")

    res = matcher.replace("test")
    println("res is ${res}")

    res = matcher.replace("test", 8)
    println("res is ${res}")
    asanGC()
    return 0
}
