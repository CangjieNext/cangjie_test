/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.regex.*
import std.runtime.*
import std.argopt.*
import std.process

main(): Int64 {
    var regexStr1 = "df"
    var matchStr1 = """
Dfdd
dfddddd"""
    var matchStr2 = """
Ffdd
Dfddddd"""
    var countexp = 0
    var regexOption = RegexOption().ignoreCase().multiLine()
    for (i in 0..100) {
        if (i % 2 == 0) {
            regexOption.multiLine()
        } else {
            regexOption.ignoreCase()
        }
    }
    var regex = Regex(regexStr1, regexOption)
    var matcher1 = Matcher(regex, matchStr1)
    var re1 = matcher1.matchStart().getOrThrow().matchString()
    if (re1 != "Df") {
        return 1
    }
    var matcher2 = Matcher(regex, matchStr2)
    try {
        var re2 = matcher2.matchStart().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        countexp += 1
    }
    if (countexp != 1) {
        return 2
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
