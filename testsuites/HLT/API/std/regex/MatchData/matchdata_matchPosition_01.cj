/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.runtime.*
import std.regex.*
import std.argopt.*
import std.process

main() {
    var regexString = "((ab)+?)([0-9]{2})"
    var matchString = "dsdababABagfg34234565323" //can't match
    var regex1 = Regex(regexString)
    var count: Int64 = 0
    try {
        var groupresult1 = regex1.matcher(matchString).fullMatch().getOrThrow().matchPosition()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    try {
        var groupresult2 = Matcher(regex1, matchString).find().getOrThrow().matchPosition()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    try {
        var groupresult3 = regex2.matcher(matchString).fullMatch().getOrThrow().matchPosition()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    try {
        var groupresult4 = Matcher(regex2, matchString).find().getOrThrow().matchPosition()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    if (count != 4) {
        return 1
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
