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
    var regexStr2 = "^df"
    var matchStr = """
dfddDF
dfddddd"""
    var countexp = 0
    var regexOption = RegexOption()
    var regex1 = Regex(regexStr1, regexOption)
    var matcher1 = Matcher(regex1, matchStr)
    var re1 = matcher1.replace("mm")
    var expStr1 = """
mmddDF
dfddddd"""
    var re2 = matcher1.replace("mm")
    var expStr2 = """
mmddDF
mmddddd"""
    var re3 = matcher1.replace("mm")
    if (re1 != expStr1 || re2 != expStr2 || re3 != expStr2) {
        return 1
    }

    var regex2 = Regex(regexStr2, regexOption)
    var matcher2 = Matcher(regex2, matchStr)
    var re4 = matcher2.replace("mm")
    var re5 = matcher2.replace("mm")
    if (re4 != expStr1 || re5 != expStr1) {
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
