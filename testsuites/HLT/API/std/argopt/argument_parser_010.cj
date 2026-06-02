/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.argopt.*

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(y) => y
        case None => default
    }
    return result
}

main(): Int64 {
    var args: Array<String> = ["-a", "x", "-b", "y", "-cfoo"]
    var longFormat: Array<String> = []
    var shortFormat = "a:b:c"
    var parser = ArgOpt(args, shortFormat, longFormat)
    var opt1 = parser.getArg("-a")
    var opt2 = parser.getArg("b")
    var opt3 = parser.getArg("-c")

    var res1 = matchResult<String>(opt1, "")
    var res2 = matchResult<String>(opt2, "")
    var res3 = matchResult<String>(opt3, "")

    var res7 = ""
    var argsMap = parser.getArgumentsMap() // [(-a, x),(-b, y)]
    var unArgs = parser.getUnparseArgs()
    for (item in argsMap) {
        res7 = res7 + item[0].toString() + "," + item[1].toString()
    }
    var res8 = ""
    for (item in unArgs) {
        res8 = res8 + item.toString()
    }
    if (res1 == "x" && res2 == "y" && res3 == "" && res7 == "-a,x-b,y" && res8 == "-cfoo") {
        return 0
    }
    return 1
}
