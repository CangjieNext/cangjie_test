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
    var bStr = ""
    var aStr = "(k)??k"
    var matcher1 = Regex(aStr).matcher(bStr)
    var matcher2 = Regex(aStr).matcher(bStr)
    var matcher3 = Regex(aStr).matcher(bStr)
    var matcher4 = Regex(aStr).matcher(bStr)
    var matcher5 = Regex(aStr).matcher(bStr)
    var matcher6 = Regex(aStr).matcher(bStr)

    var resultFind = matcher1.find()
    match (resultFind) {
        case Some(x) => return 1
        case None => ()
    }

    try {
        var resultFindIndex = matcher2.find(0)
    } catch (e: IndexOutOfBoundsException) {
        if (e.toString() != "IndexOutOfBoundsException: Invalid index: 0 against size: 0.") {
            println(e.toString())
            return 2
        }
    }

    var resultFindAllArrSize = matcher3.findAll()
    match (resultFind) {
        case Some(x) => return 3
        case None => ()
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
    if (resultAllCount != 0) {
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
