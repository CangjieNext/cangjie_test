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
    // \n
    var result1 = Regex("\n", RegexOption().ignoreCase()).matcher("\n").find().getOrThrow().matchString()
    try {
        var result3 = Regex("\n", RegexOption().ignoreCase()).matcher("\\n").find().getOrThrow().matchString()
    } catch (e: NoneValueException) {
        count = count + 1
    }
    var result4 = Regex("\n", RegexOption().ignoreCase()).matcher("43asd\ndsf").find().getOrThrow().matchString()
    if (result1 != "\n" || result4 != "\n") {
        print("Part1+${result1}+${result4}\n")
        return 1
    }
    if (count != 1) {
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
