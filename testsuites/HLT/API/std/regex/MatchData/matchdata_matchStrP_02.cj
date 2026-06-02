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
    var regexString = "((ab)+?)([0-9]){2}"
    var matchString3 = "ababab23"
    var matchString4 = "abABab23"

    var regex1 = Regex(regexString)
    var groupresult1 = regex1.matcher(matchString3).fullMatch().getOrThrow().matchString(0)

    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var groupresult2 = regex2.matcher(matchString4).fullMatch().getOrThrow().matchString(0)
    if (groupresult1 != matchString3 || groupresult2 != matchString4) {
        print("${groupresult1}+${groupresult2}\n")
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
