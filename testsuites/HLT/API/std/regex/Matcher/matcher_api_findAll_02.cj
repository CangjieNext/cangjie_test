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

    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())

    var matchDatalist1 = Matcher(regex1, matchString).findAll().getOrThrow()
    var matchDatalist2 = Matcher(regex2, matchString).findAll().getOrThrow()

    var matcher1 = regex1.matcher(matchString)
    var find1 = matcher1.find()
    var matchDatalist3 = matcher1.findAll().getOrThrow()

    var matcher2 = regex2.matcher(matchString)
    var find2 = matcher2.find()
    var matchDatalist4 = matcher2.findAll().getOrThrow()

    if (matchDatalist1[0].matchString() != "9s" || matchDatalist1[1].matchString() != "4j" || matchDatalist1.size != 2) {
        print("${matchDatalist1[0].matchString()}+${matchDatalist1[1].matchString()}+${matchDatalist1.size}\n")
        return 1
    } else if (matchDatalist2[0].matchString() != "6U" || matchDatalist2[1].matchString() != "9s" ||
        matchDatalist2[2].matchString() != "4j" || matchDatalist2[3].matchString() != "5U" || matchDatalist2.size != 4) {
        print(
            "${matchDatalist2[0].matchString()}+${matchDatalist2[1].matchString()}+${matchDatalist2[2].matchString()}+${matchDatalist2[3].matchString()}+${matchDatalist2.size}\n")
        return 2
    } else if (matchDatalist3[0].matchString() != "9s" || matchDatalist3[1].matchString() != "4j" ||
        matchDatalist3.size != 2) {
        print("${matchDatalist3[0].matchString()}+${matchDatalist3[1].matchString()}+${matchDatalist3.size}\n")
        return 3
    } else if (matchDatalist4[0].matchString() != "6U" || matchDatalist4[1].matchString() != "9s" ||
        matchDatalist4[2].matchString() != "4j" || matchDatalist4[3].matchString() != "5U" || matchDatalist4.size != 4) {
        print(
            "${matchDatalist4[0].matchString()}+${matchDatalist4[1].matchString()}+${matchDatalist4[2].matchString()}+${matchDatalist4[3].matchString()}+${matchDatalist4.size}\n")
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
