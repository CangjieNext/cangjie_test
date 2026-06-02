// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-begin ASTException: Current match expr has an empty selector
// ASSERT: scan-next ASTException: Cannot get patternGuard from match case

internal import std.ast.*
internal import std.collection.*

main(): Int64 {
    var cnt = 0
    let code = quote(
            match {
                case 1 < 2 => "fail"
                case 2 < 1 => "wrong"
                case _ => "others"
            }
        )

    let matchExpr = (parseExpr(code) as MatchExpr).getOrThrow()
    if (matchExpr.matchCases.size != 3) {
        return 1
    }

    try {
        let selector = matchExpr.selector
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    if (!(matchExpr.matchCases[0].expr is BinaryExpr)) {
        return 2
    }

    if (!(matchExpr.matchCases[2].expr is WildcardExpr)) {
        return 3
    }

    try {
        let guard = matchExpr.matchCases[2].patternGuard
    } catch (e: ASTException) {
        println(e)
        cnt++
    }

    if (cnt != 2) {
        return 4
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
