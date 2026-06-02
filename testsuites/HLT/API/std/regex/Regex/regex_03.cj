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
    var bStr = "kgkfhkkhgkokkkk"
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
    if (resultFindIndex != "k") {
        return 2
    }

    var resultFindAllArr = matcher3.findAll().getOrThrow()
    if (resultFindAllArr[0].matchString() != "k" || resultFindAllArr[1].matchString() != "k" ||
        resultFindAllArr[2].matchString() != "k" || resultFindAllArr[3].matchString() != "k" ||
        resultFindAllArr[4].matchString() != "k" || resultFindAllArr[5].matchString() != "okk" ||
        resultFindAllArr[6].matchString() != "k" || resultFindAllArr[7].matchString() != "k") {
        return 3
    }

    var resultMatchStart = matcher4.matchStart()
    match (resultMatchStart) {
        case Some(x) =>
            if (x.matchString() != "k") {
                return 4
            }
        case None => return 5
    }

    var resultFullMatch = matcher5.fullMatch()
    match (resultFullMatch) {
        case Some(x) => return 6
        case None => ()
    }

    var resultAllCount = matcher6.allCount() //Int64
    if (resultAllCount != 8) {
        return 7
    }
    let ao = ArgOpt(process.Process.current.arguments, "", ["asan"])
    let map = ao.getArgumentsMap()
    if (map.contains("--asan")) {
        GC()
        sleep(Duration.second * 2)
    }
    return 0
}
