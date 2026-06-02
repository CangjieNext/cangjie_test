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
    var matchString = "a6Ud879sd4j56u"
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var result1 = Matcher(regex1, matchString).find(0).getOrThrow().matchString()
    var result2 = Matcher(regex2, matchString).find(1).getOrThrow().matchString()
    var result3 = regex2.matcher(matchString).find(12).getOrThrow().matchString()

    if (result1 != "9s" || result2 != "6U" || result3 != "6u") {
        print("${result1}+${result2}+${result3}+${result3}\n")
        return 1
    }
    try {
        var result4 = regex1.matcher(matchString).find(13).getOrThrow().matchString()
    } catch (e: NoneValueException) {
        asan()
        return 0
    }
    return 2
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
