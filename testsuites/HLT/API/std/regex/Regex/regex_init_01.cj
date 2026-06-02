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
    var regexString = "[0-9][a-z]"
    var matchString = "ad879sd4j5Uu"
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var matchresult1 = regex1.matcher(matchString).findAll()
    var matchresult2 = regex2.matcher(matchString).findAll()
    var matchDatalist1 = matchresult1.getOrThrow()
    var matchDatalist2 = matchresult2.getOrThrow()
    if (matchDatalist1[0].matchString() != "9s" || matchDatalist1[1].matchString() != "4j" || matchDatalist1.size != 2) {
        return 1
    }
    if (matchDatalist2[0].matchString() != "9s" || matchDatalist2[1].matchString() != "4j" ||
        matchDatalist2[2].matchString() != "5U" || matchDatalist2.size != 3) {
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
