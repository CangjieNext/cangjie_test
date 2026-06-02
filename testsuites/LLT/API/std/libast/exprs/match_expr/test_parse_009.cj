// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

main(): Int64 {
    let code = quote(
            match (score) {
                case 60|70 where score>10 => print("pass")
                case a => a + 1
                case _ => let a = 1
            }
        )

    let matchExpr = (parseExpr(code) as MatchExpr).getOrThrow()
    let matchcases = matchExpr.matchCases
    if (matchcases.size != 3) {
        return 1
    }
    if (matchcases[0].patterns.size != 2 || !(matchcases[0].patterns[0] is ConstPattern)) {
        return 2
    }

    if (!(matchcases[0].patternGuard is BinaryExpr)) {
        return 3
    }

    if (matchcases[1].patterns.size != 1) {
        return 4
    }
    if (!(matchcases[1].patterns[0] is VarOrEnumPattern)) {
        return 5
    }
    if ((matchcases[1].patterns[0] as VarOrEnumPattern).getOrThrow().identifier.value != "a") {
        return 6
    }

    if (!(matchcases[2].patterns[0] is WildcardPattern)) {
        return 7
    }

    let output1 = quote($matchExpr)
    if (!compareTokens(code, output1)) {
        return 8
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
