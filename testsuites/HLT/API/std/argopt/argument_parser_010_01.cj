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

func matchResult<T>(x: Option<T>, default: T): T {
    var result = match (x) {
        case Some(y) => y
        case None => default
    }
    return result
}

main(): Int64 {
    var args: Array<String> = ["-"]
    var longFormat: Array<String> = []
    var shortFormat = "a:"
    var parser = ArgOpt(args, shortFormat, longFormat)
    var opt1 = parser.getArg("-a")
    var res1 = matchResult<String>(opt1, "")

    if (res1 == "") {
        return 0
    }
    return 1
}
