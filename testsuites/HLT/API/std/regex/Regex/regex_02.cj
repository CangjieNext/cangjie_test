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

import std.regex.*
import std.runtime.*
import std.argopt.*
import std.process

main() {
    var count: Int64 = 0
    var bStr = "fggfhhhgkokkkk"
    var aStr = "(ok)??k"
    var matcher1 = Regex(aStr).matcher(bStr)
    var matcher2 = Regex(aStr).matcher(bStr)
    var matcher3 = Regex(aStr).matcher(bStr)
    var matcher4 = Regex(aStr).matcher(bStr)
    var matcher5 = Regex(aStr).matcher(bStr)
    var matcher6 = Regex(aStr).matcher(bStr)

    var resultFind = matcher1.find().getOrThrow().matchString()
    if (resultFind != "k") {
        return 1
    }

    var resultFindIndex = matcher2.find(9).getOrThrow().matchString()
    if (resultFindIndex != "okk") {
        return 2
    }

    var resultFindAllArr = matcher3.findAll().getOrThrow()
    if (resultFindAllArr[0].matchString() != "k" || resultFindAllArr[1].matchString() != "okk" ||
        resultFindAllArr[2].matchString() != "k" || resultFindAllArr[3].matchString() != "k") {
        return 3
    }

    var resultMatchStart = matcher4.matchStart()
    match (resultMatchStart) {
        case Some(x) => return 4
        case None => ()
    }

    var resultFullMatch = matcher5.fullMatch()
    match (resultFullMatch) {
        case Some(x) => return 5
        case None => ()
    }

    var resultAllCount = matcher6.allCount() //Int64
    if (resultAllCount != 4) {
        return 6
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
