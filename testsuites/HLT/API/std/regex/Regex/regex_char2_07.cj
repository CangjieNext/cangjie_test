/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.regex.*
import std.runtime.*
import std.argopt.*
import std.process

main() {
    var count: Int64 = 0
    //\u{name} 匹配属于Unicode任何字符，例如\u{23} 匹配#
    var regexstr = "\u{0023}\u{0041}\u{0077}"
    var matcherstr1 = "#Aw"
    var matcherstr2 = "#AW"
    var matcher1 = Regex(regexstr).matcher(matcherstr1)
    var matcher2 = Regex(regexstr).matcher(matcherstr2)
    var result1 = matcher1.find().getOrThrow().matchString()
    if (result1 != "#Aw") {
        print("Part1+${result1}\n")
        return 1
    }
    try {
        var result2 = matcher2.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    if (count != 1) {
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
