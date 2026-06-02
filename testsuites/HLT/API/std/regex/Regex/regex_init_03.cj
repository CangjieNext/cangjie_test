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
    var regexString = "[0-9][a-z]"
    var matchString = "8S"
    var regex1 = Regex(regexString, RegexOption())
    var regex2 = Regex(regexString, RegexOption().multiLine())
    var regex3 = Regex(regexString, RegexOption().ignoreCase())

    try {
        var matchresult1 = regex1.matcher(matchString).fullMatch().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    try {
        var matchresult2 = regex2.matcher(matchString).fullMatch().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    try {
        var matchresult3 = regex3.matcher(matchString).fullMatch().getOrThrow().matchString()
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
