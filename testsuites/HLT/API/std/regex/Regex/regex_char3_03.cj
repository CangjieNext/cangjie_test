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
    var matcherstr1 = "Chapter"
    var matcherstr2 = "terest"
    var matcherstr3 = "aptitude"
    //\b
    var regexstr1 = "ter\\b"
    var matcher1 = Regex(regexstr1).matcher(matcherstr1)
    var result1 = matcher1.find().getOrThrow().matchString()
    if (result1 != "ter") {
        print("Part1+${result1}\n")
        return 1
    }
    var matcher2 = Regex(regexstr1).matcher(matcherstr2)
    try {
        var result2 = matcher2.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    var matcher3 = Regex(regexstr1).matcher(matcherstr3)
    try {
        var result3 = matcher3.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    var regexstr2 = "\\bter"
    var matcher4 = Regex(regexstr2).matcher(matcherstr1)
    try {
        var result4 = matcher4.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    var matcher5 = Regex(regexstr2).matcher(matcherstr2)
    var result5 = matcher5.find().getOrThrow().matchString()
    if (result5 != "ter") {
        print("Part5+${result5}\n")
        return 2
    }

    var matcher6 = Regex(regexstr2).matcher(matcherstr3)
    try {
        var result6 = matcher6.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    //\B
    var regexstr3 = "apt\\B"
    var matcherstr4 = "terestapt"
    var matcher7 = Regex(regexstr3).matcher(matcherstr1)
    var result7 = matcher7.find().getOrThrow().matchString()

    var matcher8 = Regex(regexstr3).matcher(matcherstr4)
    try {
        var result8 = matcher8.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    var matcher9 = Regex(regexstr3).matcher(matcherstr3)
    var result9 = matcher9.find().getOrThrow().matchString()

    if (result7 != "apt" || result9 != "apt") {
        print("Part3+${result7}+${result9}\n")
        return 3
    }
    if (count != 5) {
        return 4
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
