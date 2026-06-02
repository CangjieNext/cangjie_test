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
    var matcherstr1 = "fggfhhhgkkk"
    //$
    var regexstr1 = "[k]{3}$"
    var matcher1 = Regex(regexstr1).matcher(matcherstr1)
    var result1 = matcher1.find().getOrThrow().matchString()
    if (result1 != "kkk") {
        print("Part1+${result1}\n")
        return 1
    }

    var regexstr2 = "[k]{2}$"
    var matcher2 = Regex(regexstr2).matcher(matcherstr1)
    var result2 = matcher2.find().getOrThrow().matchString()
    try {
        var result2 = matcher2.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    var regexstr3 = "[k]{2}$(g|f)"
    var matcherstr3 = "kk$g"
    var matcher3 = Regex(regexstr3).matcher(matcherstr3)
    try {
        var result3 = matcher3.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    if (count != 2) {
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
