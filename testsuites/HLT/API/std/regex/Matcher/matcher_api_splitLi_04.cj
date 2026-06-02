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
    var matchString = "ggggg7fgggg"
    var matchStrings = "7ffr4h5gks0rjk3h"
    var regex1 = Regex(regexString)
    var matchDatalist1 = Matcher(regex1, matchString).split(0) //limit=0
    var matchDatalist2 = regex1.matcher(matchString).split(0)
    var matchDatalist3 = Matcher(regex1, matchStrings).split(0)
    var matchDatalist4 = regex1.matcher(matchStrings).split(0)
    var result1: Array<String> = ["ggggg", "gggg"]
    var result2: Array<String> = ["", "fr", "", "ks", "jk", ""]
    if (matchDatalist1.size != 2 || matchDatalist2.size != 2 || matchDatalist3.size != 6 || matchDatalist4.size != 6) {
        print("Part1\n")
        print("${matchDatalist1.size}+${matchDatalist2.size}+${matchDatalist3.size}+${matchDatalist4.size}\n")
        return 1
    }
    if (matchDatalist1[0] != result1[0] || matchDatalist1[1] != result1[1]) {
        print("Part2\n")
        print("${matchDatalist1[0]}+${matchDatalist1[1]}\n")
        return 2
    }
    if (matchDatalist2[0] != result1[0] || matchDatalist2[1] != result1[1]) {
        print("Part3\n")
        print("${matchDatalist2[0]}+${matchDatalist2[1]}\n")
        return 3
    }
    if (matchDatalist3[0] != result2[0] || matchDatalist3[1] != result2[1] || matchDatalist3[2] != result2[2] ||
        matchDatalist3[3] != result2[3] || matchDatalist3[4] != result2[4] || matchDatalist3[5] != result2[5]) {
        print("Part4\n")
        print(
            "${matchDatalist3[0]}+${matchDatalist3[1]}+${matchDatalist3[2]}+${matchDatalist3[3]}+${matchDatalist3[4]}+${matchDatalist3[5]}\n")
        return 4
    }
    if (matchDatalist4[0] != result2[0] || matchDatalist4[1] != result2[1] || matchDatalist4[2] != result2[2] ||
        matchDatalist4[3] != result2[3] || matchDatalist4[4] != result2[4] || matchDatalist4[5] != result2[5]) {
        print("Part5\n")
        print(
            "${matchDatalist4[0]}+${matchDatalist4[1]}+${matchDatalist4[2]}+${matchDatalist4[3]}+${matchDatalist4[4]}+${matchDatalist4[5]}\n")
        return 5
    }
    print("success\n")
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
