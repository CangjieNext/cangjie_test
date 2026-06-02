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
    var matcher1 = Matcher(regex1, matchString) // 1. Initialization
    var str1 = matcher1.resetString(matchString).getString() //2.reset String to same String
    var str2 = matcher1.resetString("").getString() //2.reset String to empty String
    var str3 = matcher1.resetString("asdasd").getString() //2.reset String to different String
    if (str1 != matchString || str2 != "" || str3 != "asdasd") {
        print("${str1}+${str2}+${str3}\n")
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
