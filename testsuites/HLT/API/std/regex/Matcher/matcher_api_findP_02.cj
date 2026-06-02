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
    var matchString = "a6Ud879sd4j5Uu"
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var matcher1 = regex1.matcher(matchString)
    var matcher2 = regex2.matcher(matchString)
    var result1 = matcher1.find(1).getOrThrow().matchString()
    var result2 = matcher1.find(1).getOrThrow().matchString()
    if (result1 != "9s" || result2 != "9s") {
        print("Part1+${result1}+${result2}\n")
        return 1
    }
    var result3 = matcher2.find(1).getOrThrow().matchString()
    var result4 = matcher2.find(1).getOrThrow().matchString()
    var result5 = matcher2.find(1).getOrThrow().matchString()
    var result6 = matcher2.find(1).getOrThrow().matchString()
    if (result3 != "6U" || result4 != "6U" || result5 != "6U" || result6 != "6U") {
        print("Part2+${result3}+${result4}+${result5}+${result6}\n")
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
