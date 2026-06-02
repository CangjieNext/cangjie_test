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
    //[^m-z]---az
    var regexstr = "[^m-z]"
    var result1 = Regex(regexstr).matcher("az").find().getOrThrow().matchString()
    if (result1 != "a") {
        print("Part+${result1}\n")
        return 1
    }
    //[^m-z]---sz
    try {
        var result2 = Regex(regexstr).matcher("sz").find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    //[^m-z]---afga
    var result3 = Regex(regexstr).matcher("afga").find().getOrThrow().matchString()
    if (result3 != "a") {
        print("Part3+${result3}\n")
        return 2
    }

    //[m-z]---az
    var regexstr1 = "[m-z]"
    var result4 = Regex(regexstr1).matcher("az").find().getOrThrow().matchString()
    if (result4 != "z") {
        print("Part4+${result4}\n")
        return 3
    }
    //[m-z]---sz
    var matcher5 = Regex(regexstr1).matcher("sz")
    var result5 = matcher5.find().getOrThrow().matchString()
    var result51 = matcher5.find().getOrThrow().matchString()
    if (result5 != "s" || result51 != "z") {
        print("Part5+${result5}+${result51}\n")
        return 4
    }

    //[m-z]---afga
    try {
        var result6 = Regex(regexstr1).matcher("afga").find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    if (count != 2) {
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
