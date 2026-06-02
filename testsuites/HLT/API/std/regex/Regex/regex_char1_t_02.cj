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
    // \
    var result1 = Regex("\\t").matcher("\t").fullMatch().getOrThrow().matchString()
    var result2 = Regex("\\\t").matcher("\t").fullMatch().getOrThrow().matchString()
    var result3 = Regex("\\\\t").matcher("\\t").fullMatch().getOrThrow().matchString()

    if (result1 != "\t" || result2 != "\t" || result3 != "\\t") {
        print("Part1+${result1}+${result2}+${result3}\n")
        return 1
    }

    try {
        var resultt1 = Regex("\\t").matcher("\\t").fullMatch().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    try {
        var resultt2 = Regex("\\\t").matcher("\\t").fullMatch().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    try {
        var resultt3 = Regex("\\\\t").matcher("\t").fullMatch().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    if (count != 3) {
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
