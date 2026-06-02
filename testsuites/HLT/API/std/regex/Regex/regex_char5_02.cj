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
    var matcherstr1 = "fggfhkkhhgkkk"
    //量词{+}:many
    var regexstr3 = "k.+k"
    var matcherstr = "dasdadad"
    var matcher3 = Regex(regexstr3).matcher(matcherstr1)
    var result3 = matcher3.find().getOrThrow().matchString() //kkhhgkkk
    if (result3 != "kkhhgkkk") {
        print("Part3+${result3}\n")
        return 1
    }
    var matcher31 = Regex(regexstr3).matcher(matcherstr)
    try {
        var result31 = matcher31.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    var regexstr4 = "k.+"
    var matcher4 = Regex(regexstr4).matcher(matcherstr1)
    var result4 = matcher4.find().getOrThrow().matchString() //kkhhgkkk
    if (result4 != "kkhhgkkk") {
        print("Part4+${result4}\n")
        return 2
    }
    var matcher41 = Regex(regexstr4).matcher(matcherstr)
    try {
        var result41 = matcher41.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    //量词{+?}:only one
    var regexstr5 = "k.+?"
    var matcher5 = Regex(regexstr5).matcher(matcherstr1)
    var result5 = matcher5.find().getOrThrow().matchString() //kk/kk
    if (result5 != "kk") {
        print("Part5+${result5}\n")
        return 3
    }
    var matcher51 = Regex(regexstr5).matcher(matcherstr)
    try {
        var result51 = matcher51.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    var regexstr6 = "k.+?k"
    var matcher6 = Regex(regexstr6).matcher(matcherstr1)
    var result6 = matcher6.find().getOrThrow().matchString() //kkhhgk
    if (result6 != "kkhhgk") {
        print("Part6+${result6}\n")
        return 4
    }

    var matcher61 = Regex(regexstr6).matcher(matcherstr)
    try {
        var result61 = matcher61.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    if (count != 4) {
        return 5
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
