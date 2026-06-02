/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*
import std.regex.*
import std.argopt.*
import std.process

main(): Int64 {
    var regexStr = "mg"
    var matcherStr = """
mg43234242
42424243242
345mg54353453
g"""
    var regex = Regex(regexStr, RegexOption().multiLine())
    var matcher = Matcher(regex, matcherStr)
    var matchCountBefore = matcher.allCount()
    matcher.setRegion(3, 38)
    var matchCountAfterSet = matcher.allCount()
    matcher.resetRegion()
    var matchCountAfterReSet = matcher.allCount()
    if (matchCountBefore != 2 || matchCountAfterSet != 1 || matchCountAfterReSet != matchCountBefore) {
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
