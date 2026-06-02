/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.regex.*
import std.runtime.*
import std.argopt.*
import std.process

main() {
    var regexString = "[0-9]"
    var matchString: Array<String> = ["9a807$6中5^4*3&2@1!00", "8a", "70", "6$", "5中", "4^", "3*", "2&", "1@", "0!",
        "00"]
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    for (i in matchString) {
        var expectresult = i[0..1]
        var matchresult1 = Matcher(regex1, i).matchStart().getOrThrow().matchString()
        var matchresult2 = Matcher(regex2, i).matchStart().getOrThrow().matchString()
        var matchresult3 = regex1.matcher(i).matchStart().getOrThrow().matchString()
        var matchresult4 = regex2.matcher(i).matchStart().getOrThrow().matchString()
        if (matchresult1 != expectresult || matchresult2 != expectresult || matchresult3 != expectresult ||
            matchresult4 != expectresult) {
            print("${matchresult1}+${matchresult2}+${matchresult3}+${matchresult4}\n")
            return 1
        }
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
