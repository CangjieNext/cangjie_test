/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
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
    var args: Array<String> = ["--=bar"]
    var longFormat: Array<String> = ["--="]
    var shortFormat = ""
    try {
        var parser = ArgOpt(args, shortFormat, longFormat)
        var opt2 = parser.getArg("")
        var res2 = matchResult<String>(opt2, "")

        var res7 = ""
        var argsMap = parser.getArgumentsMap()
        var unArgs = parser.getUnparseArgs()
        for (item in argsMap) {
            res7 = res7 + item[0].toString() + "," + item[1].toString()
        }
        var res8 = ""
        for (item in unArgs) {
            res8 = res8 + item.toString()
        }

        if (res2 == "" && res7 == "" && res8 == "--=bar") {
            return 1
        }
    } catch (e: IllegalArgumentException) {
        println(e) // Exception Exception IllegalArgumentException Invalid character string: please check the parameter :--=
        return 0
    }
    return 1
}
