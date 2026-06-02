/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.regex.*
import std.runtime.*
import std.argopt.*
import std.process

main(): Int64 {
    var regexStr1 = "df"
    var matchStr = """
DFddd
dfddddd"""
    var regexOption = RegexOption().ignoreCase()
    for (i in 0..100) {
        regexOption.ignoreCase()
    }
    var regex1 = Regex(regexStr1, regexOption)
    var matcher1 = Matcher(regex1, matchStr)
    var re1 = matcher1.replace("mm")
    var re2 = matcher1.replace("mm")
    var expStr1 = """
mmddd
dfddddd"""
    var expStr2 = """
mmddd
mmddddd"""
    if (re1 != expStr1 || re2 != expStr2) {
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
