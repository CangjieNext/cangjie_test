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
    var result1 = Matcher(regex1, matchString).replace("10m", 0)
    var result2 = Matcher(regex2, matchString).replace("10m", 1)
    var result3 = regex1.matcher(matchString).replace("10m", 13)
    var result4 = regex2.matcher(matchString).replace("10m", 12)

    if (result1 != "a6Ud8710md4j56u" || result2 != "a10md879sd4j56u" || result3 != "a6Ud879sd4j56u" || result4 !=
        "a6Ud879sd4j510m") {
        print("${result1}+${result2}+${result3}+${result4}\n")
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
