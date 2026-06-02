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
    //\nunmber
    var matcherstr1 = "fggfhhhgkkk"
    var matcherstr2 = "ggfhhhgkkk"
    var matcherstr3 = "dgfhhhgkkk"
    var regexstr1 = "(f|g)(([a-z])+)\\1"
    var matcher1 = Regex(regexstr1).matcher(matcherstr1)
    var result1 = matcher1.find().getOrThrow().matchString() //fggf

    var matcher2 = Regex(regexstr1).matcher(matcherstr2)
    var result2 = matcher2.find().getOrThrow().matchString() //ggfhhhg

    var matcher3 = Regex(regexstr1).matcher(matcherstr3)
    var result3 = matcher3.find().getOrThrow().matchString() //gfhhhg

    if (result1 != "fggf" || result2 != "ggfhhhg" || result3 != "gfhhhg") {
        print("Part1+${result1}+${result2}+${result3}\n")
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
