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
    var regexString = "((ab)+?)([0-9]{2})"
    var matchString3 = "ababab23"
    var matchString4 = "abABab23"
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var groupresult11 = regex1.matcher(matchString3).fullMatch().getOrThrow().matchString(1)
    var groupresult12 = regex1.matcher(matchString3).fullMatch().getOrThrow().matchString(2)
    var groupresult13 = regex1.matcher(matchString3).fullMatch().getOrThrow().matchString(3)

    var groupresult21 = regex2.matcher(matchString4).fullMatch().getOrThrow().matchString(1)
    var groupresult22 = regex2.matcher(matchString4).fullMatch().getOrThrow().matchString(2)
    var groupresult23 = regex2.matcher(matchString4).fullMatch().getOrThrow().matchString(3)
    if (groupresult11 != "ababab" || groupresult12 != "ab" || groupresult13 != "23") {
        print("part1\n")
        print("${groupresult11}+${groupresult12}+${groupresult13}\n")
        return 1
    }
    if (groupresult21 != "abABab" || groupresult22 != "ab" || groupresult23 != "23") {
        print("part2\n")
        print("${groupresult21}+${groupresult22}+${groupresult23}\n")
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
