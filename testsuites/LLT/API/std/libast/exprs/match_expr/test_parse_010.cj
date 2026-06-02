// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*
internal import std.collection.*

main(): Int64 {
    let code = quote(
            match (score) {
                case b: B<Int64> =>  getScore(b)
                case _ => let a = 1
            }
        )

    let matchExpr = (parseExpr(code) as MatchExpr).getOrThrow()
    let matchcases = matchExpr.matchCases
    if (matchcases.size != 2) {
        return 1
    }

    if (matchcases[0].patterns.size != 1) {
        return 2
    }
    if (!(matchcases[0].patterns[0] is TypePattern)) {
        return 3
    }
    let pat2 = (matchcases[0].patterns[0] as TypePattern).getOrThrow()
    if (!(pat2.pattern is VarPattern)) {
        return 4
    }
    if (!(pat2.patternType is RefType)) {
        return 5
    }
    let pat2Type = (pat2.patternType as RefType).getOrThrow()
    if (pat2Type.typeArguments.size != 1) {
        return 6
    }
    if (!(pat2Type.typeArguments[0] is PrimitiveType)) {
        return 7
    }

    if (!(matchcases[1].patterns[0] is WildcardPattern)) {
        return 8
    }

    let output1 = quote($matchExpr)
    if (!compareTokens(code, output1)) {
        return 9
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
