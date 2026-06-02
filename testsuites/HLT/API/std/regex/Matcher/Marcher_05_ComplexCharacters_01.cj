/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*
import std.regex.*
import std.argopt.*
import std.process

main(): Int64 {
    var regexStr = "industr(?:y|ies)"
    var matcherStr = """
industry
industries
industryg
industrg
industriesfdfd"""
    var regex = Regex(regexStr, RegexOption())
    var matcher = Matcher(regex, matcherStr)
    var matchResult = matcher.findAll().getOrThrow()
    var matchCount = matchResult.size
    if (matchCount != 4 || matchResult[0].matchString() != "industry" || matchResult[1].matchString() != "industries" ||
        matchResult[2].matchString() != "industry" || matchResult[3].matchString() != "industries") {
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
