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
// ASSERT: scan  class 'ArgOpt' is deprecated. Use `parseArguments(Array<String>, Array<ArgumentSpec>): ParsedArguments` instead.
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
    var args: Array<String> = ["-a1", "-b2", "-cfoo", "--arg1", "bar", "--arg2", "a1", "a2"]
    var longFormat: Array<String> = ["arg1=", "arg2="]
    var shortFormat = "a:b:c:"
    var parser = ArgOpt(args, shortFormat, longFormat)
    var opt1 = parser.getArg("--arg1")
    var opt2 = parser.getArg("--arg2")
    var opt3 = parser.getArg("a")
    var opt4 = parser.getArg("b")
    var opt5 = parser.getArg("c")
    var opt6 = parser.getArg("abc")
    var res1 = matchResult<String>(opt1, "")
    var res2 = matchResult<String>(opt2, "")
    var res3 = matchResult<String>(opt3, "")
    var res4 = matchResult<String>(opt4, "")
    var res5 = matchResult<String>(opt5, "")
    var res6 = matchResult<String>(opt6, "")

    var res7 = ""
    var argsMap = parser.getArgumentsMap()
    var unArgs = parser.getUnparseArgs()
    var res8 = ""
    for (item in unArgs) {
        res8 = res8 + item.toString()
    }

    if (res1 != "bar") {
        return 1
    }
    if (res2 != "a1") {
        return 1
    }
    if (res3 != "1") {
        return 1
    }
    if (res4 != "2") {
        return 1
    }
    if (res5 != "foo") {
        return 1
    }
    if (res6 != "") {
        return 1
    }
    let test = HashMap<String, String>([("-a", "1"), ("-b", "2"), ("-c", "foo"), ("--arg1", "bar"), ("--arg2", "a1")])
    for ((tk, tv) in test) {
        if (argsMap[tk] != tv) {
            return 1
        }
    }
    if (res8 != "a2") {
        return 1
    }
    return 0
}
