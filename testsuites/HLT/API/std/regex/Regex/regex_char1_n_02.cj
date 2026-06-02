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
    var result1 = Regex("\\n").matcher("\n").fullMatch().getOrThrow().matchString()
    var result2 = Regex("\\\n").matcher("\n").fullMatch().getOrThrow().matchString()
    var result3 = Regex("\\\\n").matcher("\\n").fullMatch().getOrThrow().matchString()

    if (result1 != "\n" || result2 != "\n" || result3 != "\\n") {
        print("Part1+${result1}+${result2}+${result3}")
        return 1
    }

    try {
        var resultn1 = Regex("\\n").matcher("\\n").fullMatch().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    try {
        var resultn2 = Regex("\\\n").matcher("\\n").fullMatch().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }

    try {
        var resultn3 = Regex("\\\\n").matcher("\n").fullMatch().getOrThrow().matchString()
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
