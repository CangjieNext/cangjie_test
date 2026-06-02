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

main(): Int64 {
    var pattern = "A{1,,}"
    var str = "A"
    var regex = Regex(pattern)
    var matcher = Matcher(regex, str)
    try {
        var res = matcher.findAll().getOrThrow()
    } catch (e: NoneValueException) {
        asanGC()
        return 0
    }
    return 1
}
