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

import std.runtime.*
import std.regex.*
import std.argopt.*
import std.process

main() {
    var regexString = "(ab+?)([0-9]{2})"
    var matchString = "abb34"
    var matchString1 = "dsabb43fdabb56abb78"

    var regex1 = Regex(regexString)
    var groupresult1 = regex1.matcher(matchString).fullMatch().getOrThrow().groupNumber()
    var groupresult3 = regex1.matcher(matchString1).find().getOrThrow().groupNumber()
    var groupresult4 = regex1.matcher(matchString1).find().getOrThrow().groupNumber()

    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var groupresult2 = regex2.matcher(matchString).fullMatch().getOrThrow().groupNumber()
    var groupresult5 = regex2.matcher(matchString1).find().getOrThrow().groupNumber()
    var groupresult6 = regex2.matcher(matchString1).find().getOrThrow().groupNumber()
    if (groupresult1 != 2 || groupresult2 != 2) {
        print("step1+${groupresult1}+${groupresult2}\n")
        return 1
    } else if (groupresult3 != 2 || groupresult4 != 2) {
        print("step2+${groupresult3}+${groupresult4}\n")
        return 2
    } else if (groupresult5 != 2 || groupresult6 != 2) {
        print("step3+${groupresult5}+${groupresult6}\n")
        return 3
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
