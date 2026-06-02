/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.regex.*
import std.runtime.*
import std.argopt.*
import std.process

main() {
    var regexString = "[0-9][a-z]"
    var matchString1 = "8s"
    var matchString2 = "9D"
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var matchresult1 = regex1.matcher(matchString1).fullMatch().getOrThrow().matchString()
    var matchresult2 = regex2.matcher(matchString2).fullMatch().getOrThrow().matchString()
    var matchresult3 = regex2.matcher(matchString1).fullMatch().getOrThrow().matchString()
    if (matchresult1 != matchString1 || matchresult2 != matchString2 || matchresult3 != matchString1) {
        print("${matchresult1}+${matchresult2}+${matchresult3}\n")
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
