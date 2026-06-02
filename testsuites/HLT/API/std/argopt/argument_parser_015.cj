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
import std.collection.*

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(y) => y
        case None => default
    }
    return result
}

main(): Int64 {
    var args: Array<String> = ["--long-arg", "-a1", "--arg2=bar", "-b2"]
    var args1: Array<String> = ["--long-arg=foo", "-a1", "--arg2=bar", "-b2"]
    var longFormat: Array<String> = ["long-arg=", "arg2="]
    var shortFormat = "a:b:c:"
    var parser1 = ArgOpt(args, shortFormat, longFormat)
    var parser2 = ArgOpt(args1, shortFormat, longFormat)
    var opt1 = parser1.getArg("--arg2")
    var opt2 = parser1.getArg("--long-arg")
    var opt3 = parser1.getArg("a")
    var opt4 = parser1.getArg("b")

    var res1 = matchResult<String>(opt1, "")
    var res2 = matchResult<String>(opt2, "")
    var res3 = matchResult<String>(opt3, "")
    var res4 = matchResult<String>(opt4, "")

    var res7 = ""
    var argsMap = parser1.getArgumentsMap() //  [(--long-arg, -a1), (--arg2, bar), (-b,2)]
    var unArgs = parser1.getUnparseArgs() // []
    var res8 = ""
    for (item in unArgs) {
        res8 = res8 + item.toString()
    }
    let test = HashMap<String, String>([("--arg2", "bar"), ("-b", "2"), ("--long-arg", "-a1")])
    for ((tk, tv) in test) {
        if (argsMap[tk] != tv) {
            return 1
        }
    }
    if (res1 == "bar" && res2 == "-a1" && res3 == "" && res4 == "2" && res8 == "") {
        return 0
    }

    return 1
}
