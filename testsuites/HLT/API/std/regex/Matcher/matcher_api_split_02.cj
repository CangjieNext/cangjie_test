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

import std.runtime.*
import std.regex.*
import std.argopt.*
import std.process

main() {
    var regexString = "[0-9][a-z]"
    var matchString = "ggggggggg"
    var regex1 = Regex(regexString)
    var matchDatalist1 = Matcher(regex1, matchString).split()
    var matchDatalist2 = regex1.matcher(matchString).split()
    var result: Array<String> = [matchString]
    if (matchDatalist1.size != 1 || matchDatalist2.size != 1) {
        print("Part1\n")
        print("${matchDatalist1.size}+${matchDatalist2.size}\n")
        return 1
    }
    if (matchDatalist1[0] != result[0]) {
        print("Part2\n")
        print("${matchDatalist1[0]}\n")
        return 2
    }
    if (matchDatalist2[0] != result[0]) {
        print("Part3\n")
        print("${matchDatalist2[0]}\n")
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
