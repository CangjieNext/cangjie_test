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
    var matcherstr1 = "fggfhhhgkkkg"
    //量词{n,}
    var regexstr2 = "[k]{3,}"
    var matcher2 = Regex(regexstr2).matcher(matcherstr1)
    var result2 = matcher2.find().getOrThrow().matchString() //kkk
    if (result2 != "kkk") {
        print("Part2+${result2}\n")
        return 1
    }

    var regexstr3 = "[k]{4,}"
    var matcher3 = Regex(regexstr3).matcher(matcherstr1) //no match
    try {
        var result3 = matcher3.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    //量词{n,}?
    var regexstr4 = "[k]{3,}?g"
    var matcherstr2 = "fggfhhhgkkkg"
    var matcher4 = Regex(regexstr4).matcher(matcherstr2)
    var result4 = matcher4.find().getOrThrow().matchString() //kkkg
    if (result4 != "kkkg") {
        print("Part4+${result4}\n")
        return 2
    }
    if (count != 1) {
        return 3
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
