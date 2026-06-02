// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

//VarDecl example

main(): Int64 {
    let input = quote(
            var scoreResult: String = match (score) {
                case 0 => "zero"
                case 10 | 20 | 30 | 40 | 50 => "fail"
                case 70 | 80 => "good"
                case 90 => "excellent" // matched
                case _ => "not a valid score"
            }
        )

    let matchExpr = parseDecl(input)
    let output = quote($matchExpr)
    output.dump()
    let flag = compareTokens(input, output)
    if (!flag) {
        return 1
    }

    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
