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
    var regexString = "((ab)+?)([0-9]){2}"
    var matchString = "abab34"

    var regex1 = Regex(regexString)
    var groupresult3 = regex1.matcher(matchString).fullMatch().getOrThrow().matchPosition(2)
    var groupresult5 = Matcher(regex1, matchString).fullMatch().getOrThrow().matchPosition(3)

    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var groupresult4 = regex2.matcher(matchString).fullMatch().getOrThrow().matchPosition(2)
    var groupresult6 = Matcher(regex2, matchString).fullMatch().getOrThrow().matchPosition(3)
    //(ab)+?
    if (groupresult3.start != 2 || groupresult3.end != 4 || groupresult4.start != 2 || groupresult4.end != 4) {
        print("${groupresult3.start}+${groupresult3.end}+${groupresult4.start}+${groupresult4.end}\n")
        return 1
    }
        //([0-9]){2}
        else if (groupresult5.start != 5 || groupresult5.end != 6 || groupresult6.start != 5 || groupresult6.end != 6) {
        print("${groupresult5.start}+${groupresult6.end}+${groupresult6.start}+${groupresult6.end}\n")
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
