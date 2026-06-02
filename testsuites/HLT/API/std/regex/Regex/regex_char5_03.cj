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
    var matcherstr1 = "fggfhhhgkokkkk"
    var matcherstr = "dasdadad"
    //量词{?}-匹配零次或者一次
    var regexstr6 = "(k)?k"
    var matcher6 = Regex(regexstr6).matcher(matcherstr1)
    var result6 = matcher6.find().getOrThrow().matchString() //k-kk-kk
    var result61 = matcher6.find().getOrThrow().matchString() //k-kk-kk
    if (result6 != "k") {
        print("Part6+${result6}\n")
        return 1
    }

    var matcher61 = Regex(regexstr6).matcher(matcherstr)
    try {
        var result61 = matcher61.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    //量词{??}匹配零次
    var regexstr7 = "(k)??k"
    var matcher7 = Regex(regexstr7).matcher(matcherstr1)
    var result7 = matcher7.find().getOrThrow().matchString() //k-k-k-k-k
    if (result7 != "k") {
        print("Part7+${result7}\n")
        return 2
    }
    var matcher71 = Regex(regexstr7).matcher(matcherstr)
    try {
        var result71 = matcher71.find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    if (count != 2) {
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
