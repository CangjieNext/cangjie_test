/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.ast.*

main() {
    var input: Tokens = quote(
         match {
            case a > b => 1
         }
    )
    let expr = parseExpr(input)
    if (expr is MatchExpr) {
        var mh = match (expr as MatchExpr) {
            case Some(v) => v
            case None => throw Exception("Not MatchExpr")
        }
        var hasSelector = true
        try {
            mh.selector
        } catch (e: ASTException) {
            hasSelector = false
        }

        var matches = mh.matchCases[0]
        var matchesExpr = match (matches as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matchesleft = match (matchesExpr as BinaryExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var matchesleftExpr = match (matchesleft as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var matchesright = match (matchesExpr as BinaryExpr) {
            case Some(v) => v.rightExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var matchesrightExpr = match (matchesright as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var mp = match (matches as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mpExpr = match (mp as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mpValue = match (mpExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (hasSelector != false || matchesleftExpr != "a" || matchesrightExpr != "b" || !(mpExpr is Expr) || mpValue !=
            "1") {
            return 1
        }
        return 0
    }
    return 1
}
