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
    var str: String = String([r'w', r'r', r'e', r'r'])
    var regex1 = Regex(str) // init(regex: String)
    var regex2 = Regex(str, RegexOption().ignoreCase()) //init(regex: String , flag: int64)
    var matchesresult1 = regex1.matcher(str).fullMatch().getOrThrow().matchString() //matches (input: String): Option<MatchData>
    var matchesresult3 = regex2.matcher(str).fullMatch().getOrThrow().matchString()

    var matchesresult2 = regex1.matcher(str).fullMatch().getOrThrow().matchString() //matcher(input: String): Matcher
    var matchesresult4 = regex2.matcher(str).fullMatch().getOrThrow().matchString()
    if (matchesresult1 != str || matchesresult2 != str || matchesresult3 != str || matchesresult4 != str) {
        print("${matchesresult1}+${matchesresult2}+${matchesresult3}+${matchesresult4}\n")
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
