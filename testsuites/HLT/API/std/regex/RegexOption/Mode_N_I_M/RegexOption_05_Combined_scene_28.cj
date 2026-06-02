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
    var regexStr1 = "^df.*dd$\n^df.*dd$"
    var regexStr2 = "^df.*\n.*DD$"
    var matchStr = """
dfdd
dfdddDD"""
    var regexOption = RegexOption().ignoreCase().multiLine()

    var regex1 = Regex(regexStr1, regexOption)
    var matcher1 = Matcher(regex1, matchStr)
    var re1 = matcher1.fullMatch().getOrThrow().matchString()

    var regex2 = Regex(regexStr2, regexOption)
    var matcher2 = Matcher(regex2, matchStr)
    var re2 = matcher2.fullMatch().getOrThrow().matchString()

    if (re1 != matchStr || re2 != matchStr) {
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
