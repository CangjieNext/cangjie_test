// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let incOrDecExprTokens = quote(
    	a++
    )
    let isIncOrDec = parseExpr(incOrDecExprTokens) is IncOrDecExpr
    if (!isIncOrDec) {
        return 1
    }

    let incExpr = (parseExpr(incOrDecExprTokens) as IncOrDecExpr).getOrThrow()
    let expr = (incExpr.expr as RefExpr).getOrThrow().identifier.value
    if (expr != "a") {
        return 2
    }
    let opKind = incExpr.op
    if (opKind.kind != TokenKind.INCR) {
        return 3
    }
    let decExprTokens = quote(
        b--
    )
    let decExpr = (parseExpr(decExprTokens) as IncOrDecExpr).getOrThrow()
    let decIdent = (decExpr.expr as RefExpr).getOrThrow().identifier.value
    if (decIdent != "b") {
        return 4
    }
    let opDecKind = decExpr.op
    if (opDecKind.kind != TokenKind.DECR) {
        return 5
    }

    let inputTokens = quote(
    	break
    )
    let isIncOrDec1 = (parseExpr(inputTokens) is IncOrDecExpr)
    if (isIncOrDec1) {
        return 6
    }
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
