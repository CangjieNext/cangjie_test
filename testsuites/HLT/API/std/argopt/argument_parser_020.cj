/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.argopt.*
import std.collection.*

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(y) => y
        case None => default
    }
    return result
}

main(): Int64 {
    var args: Array<String> = ["-aa", "-bb", "-cc"]
    var longFormat: Array<String> = []
    var shortFormat = "a:b:c:d:"
    var parser = ArgOpt(args, shortFormat, longFormat)
    var opt1 = parser.getArg("a")
    var opt2 = parser.getArg("b")
    var opt3 = parser.getArg("c")

    var res1 = matchResult<String>(opt1, "")
    var res2 = matchResult<String>(opt2, "")
    var res3 = matchResult<String>(opt3, "")

    var res7 = ""
    var argsMap = parser.getArgumentsMap() // [(-a, a), (-b, b), (-c, c)]
    var unArgs = parser.getUnparseArgs()
    var res8 = ""
    for (item in unArgs) {
        res8 = res8 + item.toString()
    }

    let test = HashMap<String, String>([("-a", "a"), ("-b", "b"), ("-c", "c")])
    for ((tk, tv) in test) {
        if (argsMap[tk] != tv) {
            return 1
        }
    }
    if (res1 == "a" && res2 == "b" && res3 == "c" && res8 == "") {
        return 0
    }

    return 1
}
