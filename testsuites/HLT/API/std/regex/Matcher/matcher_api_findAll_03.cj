/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.runtime.*
import std.regex.*
import std.argopt.*
import std.process

main() {
    var regexString = "[0-9][a-z]"
    var matchString = "fdsfdfgd"
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var matcher1 = Matcher(regex1, matchString)
    var matcher2 = Matcher(regex2, matchString)
    var count: Int64 = 0
    try {
        var result1 = matcher1.findAll().getOrThrow()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    try {
        var result3 = matcher2.findAll().getOrThrow()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    if (count != 2) {
        return 1
    }
    asan()
    return 0
}

func asan() {
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        sleep(Duration.millisecond * 100)
        GC()
        sleep(Duration.millisecond * 100)
    }
}
