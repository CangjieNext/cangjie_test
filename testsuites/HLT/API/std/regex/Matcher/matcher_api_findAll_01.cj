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

import std.regex.*
import std.runtime.*
import std.argopt.*
import std.process

main() {
    var regexString = "[0-9][a-z]"
    var matchString = "9sd"

    var regex1 = Regex(regexString)
    var matchDatalist1 = Matcher(regex1, matchString).findAll().getOrThrow()
    var matchDatalist3 = regex1.matcher(matchString).findAll().getOrThrow()

    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var matchDatalist2 = Matcher(regex2, matchString).findAll().getOrThrow()
    var matchDatalist4 = regex2.matcher(matchString).findAll().getOrThrow()

    if (matchDatalist1[0].matchString() != "9s" || matchDatalist1.size != 1) {
        print("${matchDatalist1[0].matchString()}+${matchDatalist1.size}\n")
        return 1
    } else if (matchDatalist2[0].matchString() != "9s" || matchDatalist2.size != 1) {
        print("${matchDatalist2[0].matchString()}+${matchDatalist2.size}\n")
        return 2
    } else if (matchDatalist3[0].matchString() != "9s" || matchDatalist3.size != 1) {
        print("${matchDatalist3[0].matchString()}+${matchDatalist3.size}\n")
        return 3
    } else if (matchDatalist4[0].matchString() != "9s" || matchDatalist4.size != 1) {
        print("${matchDatalist4[0].matchString()}+${matchDatalist4.size}\n")
        return 4
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
