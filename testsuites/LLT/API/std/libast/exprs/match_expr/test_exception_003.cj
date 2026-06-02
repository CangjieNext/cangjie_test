// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-begin ASTException: Cannot get expression from match case
// ASSERT: scan-next ASTException: Cannot get patternGuard from match case

internal import std.ast.*
internal import std.collection.*

main(): Int64 {
    var cnt = 0
    let code = quote(
            match (score) {
                case 0 => print("fail")
                case b: B<Int64> where true =>  getScore(b)
                case _ => let a = 1
            }
        )

    let matchExpr = (parseExpr(code) as MatchExpr).getOrThrow()
    if (matchExpr.matchCases.size != 3) {
        return 1
    }

    try {
        let expr1 = matchExpr.matchCases[0].expr
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    if (!(matchExpr.matchCases[1].patternGuard is LitConstExpr)) {
        return 2
    }

    try {
        let guard3 = matchExpr.matchCases[2].patternGuard
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    if (cnt != 2) {
        return 3
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
