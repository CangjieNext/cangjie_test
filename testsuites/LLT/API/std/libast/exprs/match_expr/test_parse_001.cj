// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
            match (score) {
                case e1(x1,y1)|e2(x2,y2) => "zeros"
                case 60|70 where score>10 => print("pass")
                case 90 => print("good")
                case ("Bob",90) => print("Bob good!")
                case excellent => "excellent"
                case _ => let a = 1
            }
        )

    let matchExpr = (parseExpr(input) as MatchExpr).getOrThrow()
    let mode = matchExpr.selector
    if (!(mode is RefExpr)) {
        return 1
    }

    let output = quote($matchExpr)
    output.dump()
    let flag = compareTokens(input, output)
    if (!flag) {
        return 2
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
