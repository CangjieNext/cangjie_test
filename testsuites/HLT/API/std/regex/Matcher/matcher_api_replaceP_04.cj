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
    var matchString = "gg6sgggg"
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var matchresult1 = Matcher(regex1, matchString).replace("10m", 4)
    var matchresult2 = Matcher(regex2, matchString).replace("11m", 4)
    var matchresult3 = regex1.matcher(matchString).replace("12m", 4)
    var matchresult4 = regex2.matcher(matchString).replace("13m", 4)
    if (matchresult1 != matchString || matchresult2 != matchString || matchresult3 != matchString || matchresult4 !=
        matchString) {
        print("${matchresult1}+${matchresult2}+${matchresult3}+${matchresult4}\n")
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
