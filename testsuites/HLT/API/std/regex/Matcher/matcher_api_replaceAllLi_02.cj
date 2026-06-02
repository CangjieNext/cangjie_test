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
    var matchString = "a6Ud879sd4j5Uu"
    var replaceString = "ddd"
    var limit = 0 //limit=0
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var matchDatalist1 = Matcher(regex1, matchString).replaceAll(replaceString, limit)
    var matchDatalist2 = Matcher(regex2, matchString).replaceAll(replaceString, limit)
    var matchDatalist3 = regex1.matcher(matchString).replaceAll(replaceString, limit)
    var matchDatalist4 = regex2.matcher(matchString).replaceAll(replaceString, limit)

    if (matchDatalist1 != matchString || matchDatalist2 != matchString || matchDatalist3 != matchString ||
        matchDatalist4 != matchString) {
        print("${matchDatalist1}+${matchDatalist2}+${matchDatalist3}+${matchDatalist4}\n")
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
