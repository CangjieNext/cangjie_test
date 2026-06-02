/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.regex.*
import std.runtime.*
import std.argopt.*
import std.process

main() {
    var count: Int64 = 0
    //[dfg]--fg
    var regexstr = "[dfg]"
    var matcher1 = Regex(regexstr).matcher("fg")
    var result1 = matcher1.find().getOrThrow().matchString()
    var result2 = matcher1.find().getOrThrow().matchString()
    if (result1 != "f" || result2 != "g") {
        print("Part1+${result1}+${result2}\n")
        return 1
    }
    //[dfg]--sz
    try {
        var result5 = Regex(regexstr).matcher("sz").find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    //[dfg]--z
    var matcher5 = Regex(regexstr).matcher("z")
    try {
        var result10 = matcher5.find().getOrThrow().matchString()
    } catch (e: Exception) {
        count = count + 1
    }
    try {
        var result11 = matcher5.find().getOrThrow().matchString()
    } catch (e: Exception) {
        count = count + 1
    }

    //[^dfg]--sz
    var regexstr2 = "[^dfg]"
    var matcher3 = Regex(regexstr2).matcher("sz")
    var result3 = matcher3.find().getOrThrow().matchString()
    var result4 = matcher3.find().getOrThrow().matchString()
    if (result3 != "s" || result4 != "z") {
        print("Part2+${result3}+${result4}\n")
        return 3
    }

    //[^dfg]--fg
    try {
        var result6 = Regex(regexstr2).matcher("fg").find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    //[^dfg]--szz
    var matcher4 = Regex(regexstr2).matcher("szz")
    var result7 = matcher4.find().getOrThrow().matchString()
    var result8 = matcher4.find().getOrThrow().matchString()
    var result9 = matcher4.find().getOrThrow().matchString()
    if (result7 != "s" || result8 != "z" || result9 != "z") {
        print("Part3+${result7}+${result8}+${result9}\n")
        return 4
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
