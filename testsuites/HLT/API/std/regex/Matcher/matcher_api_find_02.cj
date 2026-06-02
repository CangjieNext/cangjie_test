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
import std.process.*

main() {
    var regexString = "[0-9][a-z]"
    var matchString = "a6Ud879sd4j5Uu"

    var regex1 = Regex(regexString)
    var matcher1 = Matcher(regex1, matchString)
    var result1 = matcher1.find().getOrThrow().matchString()
    var result2 = matcher1.find().getOrThrow().matchString()

    var regex2 = Regex(regexString, RegexOption().ignoreCase())
    var matcher2 = Matcher(regex2, matchString)
    var result3 = matcher2.find().getOrThrow().matchString()
    var result4 = matcher2.find().getOrThrow().matchString()
    var result5 = matcher2.find().getOrThrow().matchString()
    var result6 = matcher2.find().getOrThrow().matchString()
    if (result1 != "9s" || result2 != "4j" || result3 != "6U" || result4 != "9s" || result5 != "4j" || result6 != "5U") {
        print("${result1}+${result2}+${result3}+${result4}+${result5}+${result6}\n")
        return 1
    }
    asan()
    return 0
}

func asan() {
    let map = Process.current.arguments
    if (map.contains("--asan")) {
        sleep(Duration.millisecond * 100)
        GC()
        sleep(Duration.millisecond * 100)
    }
}
