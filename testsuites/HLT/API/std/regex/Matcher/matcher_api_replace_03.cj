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
    var matcher1 = Matcher(regex1, matchString)
    var matcher2 = regex1.matcher(matchString)
    var result1 = matcher1.replace("12m")
    var result2 = matcher1.replace("12m")
    var result3 = matcher1.replace("13m")
    if (result1 != "a6Ud8712md4j5Uu" || result2 != "a6Ud8712md12m5Uu" || result3 != "a6Ud8712md12m5Uu") {
        print("${result1}+${result2}+${result3}\n")
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
