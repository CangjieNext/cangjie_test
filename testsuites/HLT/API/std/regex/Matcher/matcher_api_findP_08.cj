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
    var matchString = "a6U8Sd8f7M9sd4j5Uu"
    var regex1 = Regex(regexString)
    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var matcher1 = Matcher(regex1, matchString) //1.Initialization
    var change1 = matcher1.find() //2.modify region
    var region1 = matcher1.region() //3.current region

    var matcher2 = Matcher(regex2, matchString)
    var change2 = matcher2.find()
    var region2 = matcher2.region()
    if (region1.start != 0 || region1.end != matchString.size) {
        print("Part1\n")
        print("${region1.start}+${region1.end}\n")
        return 1
    } else if (region2.start != 0 || region2.end != matchString.size) {
        print("Part2\n")
        print("${region2.start}+${region2.end}\n")
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
