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
    var matchString = "a6Ud8f7M9sd4j5Uu"
    var finalString1 = "a6Ud8f7M10md4j5Uu" //regex1 result
    var finalString2 = "a6Ud8f7M12md4j5Uu" //regex2 result
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var matcher1 = Matcher(regex1, matchString)
    var matcher2 = Matcher(regex2, matchString)
    //regex1 2 times
    var result1 = matcher1.replace("10m", 8)
    var result2 = matcher1.replace("10m", 8)
    //regex1 3 times
    var result3 = matcher2.replace("12m", 8)
    var result4 = matcher2.replace("12m", 8)
    var result5 = matcher2.replace("12m", 8)
    if (result1 != finalString1 || result2 != finalString1 || result3 != finalString2 || result4 != finalString2 ||
        result5 != finalString2) {
        print("${result1}\n${result2}\n${result3}\n${result4}\n${result5}\n")
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
