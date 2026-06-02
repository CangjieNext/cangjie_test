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

import std.regex.*
import std.runtime.*
import std.argopt.*
import std.process

main() {
    var count: Int64 = 0
    var regexString = "\\?*?"
    var str = "?"
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    try {
        var matches1 = regex1.matcher(str).fullMatch().getOrThrow().matchString() //matches (input: String): Option<MatchData>
    } catch (e: Exception) {
        count = count + 1
    }

    try {
        var matches2 = regex2.matcher(str).fullMatch().getOrThrow().matchString()
    } catch (e: Exception) {
        count = count + 1
    }

    try {
        var matcher1 = regex1.matcher(str).fullMatch().getOrThrow().matchString() //matcher(input: String): Matcher
    } catch (e: Exception) {
        count = count + 1
    }

    try {
        var matcher2 = regex2.matcher(str).fullMatch().getOrThrow().matchString()
    } catch (e: Exception) {
        count = count + 1
    }
    if (count != 4) {
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
