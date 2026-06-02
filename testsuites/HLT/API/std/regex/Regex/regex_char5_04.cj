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
    var matcherstr1 = "fggfhhhgkkk"
    //量词{n}
    var regexstr1 = "[k]{3}"
    var matcher1 = Regex(regexstr1).matcher(matcherstr1)
    var result1 = matcher1.find().getOrThrow().matchString() //kkk
    if (result1 != "kkk") {
        print("Part1+${result1}\n")
        return 1
    }

    var regexstr2 = "[k]{2}"
    var matcher2 = Regex(regexstr2).matcher(matcherstr1)
    var result2 = matcher2.find().getOrThrow().matchString() //kk
    if (result2 != "kk") {
        print("Part2+${result2}\n")
        return 2
    }

    var regexstr3 = "[k]{1}"
    var matcher3 = Regex(regexstr3).matcher(matcherstr1)
    var result3 = matcher3.find().getOrThrow().matchString() //k-k-k
    if (result3 != "k") {
        print("Part3+${result3}\n")
        return 3
    }
    //量词{n}?
    var regexstr4 = "[k]{3}?"
    var matcher4 = Regex(regexstr4).matcher(matcherstr1)
    var result4 = matcher4.find().getOrThrow().matchString() //kkk
    if (result4 != "kkk") {
        print("Part4+${result4}\n")
        return 4
    }

    var regexstr5 = "[k]{2}?"
    var matcher5 = Regex(regexstr5).matcher(matcherstr1)
    var result5 = matcher5.find().getOrThrow().matchString() //kk
    if (result5 != "kk") {
        print("Part5+${result5}\n")
        return 5
    }

    var regexstr6 = "[k]{1}?"
    var matcher6 = Regex(regexstr6).matcher(matcherstr1)
    var result6 = matcher6.find().getOrThrow().matchString() //k-k-k
    if (result6 != "k") {
        print("Part6+${result6}\n")
        return 6
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
