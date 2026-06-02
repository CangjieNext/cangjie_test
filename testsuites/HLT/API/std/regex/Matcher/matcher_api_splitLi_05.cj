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
    var regexString = ""
    var matchString = "ggggg7fgggg"
    var matchStrings = "7ffr4h5gks0rjk3h"
    var regex1 = Regex(regexString)
    var matchDatalist1 = Matcher(regex1, matchString).split(0) //limit=0
    var matchDatalist2 = regex1.matcher(matchString).split(0)
    var matchDatalist3 = Matcher(regex1, matchStrings).split(0)
    var matchDatalist4 = regex1.matcher(matchStrings).split(0)
    if (matchDatalist1.size != 13 || matchDatalist2.size != 13 || matchDatalist3.size != 18 || matchDatalist4.size != 18) {
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
