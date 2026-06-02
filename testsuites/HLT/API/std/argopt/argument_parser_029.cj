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
    var args: Array<String> = ["arg1=long", "-ashort", "arg2", "long", "-b2"]
    var longFormat: Array<String> = ["arg1=", "arg2=", "arg3"]
    var shortFormat = "a:b:c:"
    var parser = ArgOpt(args, shortFormat, longFormat)

    var opt1 = parser.getArg("--arg1")
    var opt2 = parser.getArg("--arg2")
    var opt3 = parser.getArg("--arg3")
    var opt4 = parser.getArg("a")
    var opt5 = parser.getArg("b")
    var opt6 = parser.getArg("c")

    var res1 = matchResult<String>(opt1, "")
    var res2 = matchResult<String>(opt2, "")
    var res3 = matchResult<String>(opt3, "")
    var res4 = matchResult<String>(opt4, "")
    var res5 = matchResult<String>(opt5, "")
    var res6 = matchResult<String>(opt6, "")

    var res7 = ""
    var argsMap = parser.getArgumentsMap() // [(-a, short), (-b, 2)]
    var unArgs = parser.getUnparseArgs() // [arg1=long, arg2, long]
    for (item in argsMap) {
        res7 = res7 + item[0].toString() + "," + item[1].toString()
    }
    var res8 = ""
    for (item in unArgs) {
        res8 = res8 + item.toString()
    }

    if (res1 == "" && res2 == "" && res3 == "" && res4 == "short" && res5 == "2" && res6 == "" && res7 == "-a,short-b,2" &&
        res8 == "arg1=longarg2long") {
        return 0
    }

    return 1
}
