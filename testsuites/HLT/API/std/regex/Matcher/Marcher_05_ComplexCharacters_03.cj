/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*
import std.regex.*
import std.argopt.*
import std.process

main(): Int64 {
    var regexStr = "Server(?!01|02|3080|888)"
    var matcherStr = """
Server01
Server0201
Serverfgfffffff01
Server308001
Server88801
Servernvnv01"""
    var regex = Regex(regexStr, RegexOption())
    var matcher = Matcher(regex, matcherStr)
    var matchResult = matcher.findAll().getOrThrow()
    var matchCount = matchResult.size
    if (matchCount != 2 || matchResult[0].matchString() != "Server" || matchResult[1].matchString() != "Server") {
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
