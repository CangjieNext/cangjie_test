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
         match (a is B) {
            case 10 where true => a is B
            case 10 where true => a as B
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
        var mhSelector = mh.selector
        var mhSelectorExpr = match (mhSelector as IsExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not IsExpr")
        }
        var mhSelectorValue = match (mhSelectorExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var matches0 = mh.matchCases[0]
        var matches1 = mh.matchCases[1]
        var matches0patterns = match (matches0 as MatchCase) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not MatchCase")
        }
        var matches0Constpatterns = match (matches0patterns as ConstPattern) {
            case Some(v) => v.litConstExpr
            case None => throw Exception("Not ConstPattern")
        }
        var matches0ConstpatternsValue = match (matches0Constpatterns as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var matches0patternGuard = match (matches0 as MatchCase) {
            case Some(v) => v.patternGuard
            case None => throw Exception("Not MatchCase")
        }
        var matches0patternGuardValue = match (matches0patternGuard as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var mp0 = match (matches0 as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mp0Expr = match (mp0 as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp0IsExpr = match (mp0Expr as IsExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not IsExpr")
        }
        var mp0IsExprValue = match (mp0IsExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var matches1patterns = match (matches1 as MatchCase) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not MatchCase")
        }
        var matches1Constpatterns = match (matches1patterns as ConstPattern) {
            case Some(v) => v.litConstExpr
            case None => throw Exception("Not ConstPattern")
        }
        var matches1ConstpatternsValue = match (matches1Constpatterns as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var matches1patternGuard = match (matches1 as MatchCase) {
            case Some(v) => v.patternGuard
            case None => throw Exception("Not MatchCase")
        }
        var matches1patternGuardValue = match (matches1patternGuard as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var mp1 = match (matches1 as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mp1Expr = match (mp1 as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp1AsExpr = match (mp1Expr as AsExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not AsExpr")
        }
        var mp1AsExprValue = match (mp1AsExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (hasSelector != true || mh.matchCases.size == 0 || mhSelectorValue != "a" ||
            !(matches0patterns is ConstPattern) || matches0ConstpatternsValue != "10" || matches0patternGuardValue !=
            "true" || mp0IsExprValue != "a" || !(matches1patterns is ConstPattern) || matches1ConstpatternsValue != "10" ||
            matches1patternGuardValue != "true" || mp1AsExprValue != "a") {
            return 1
        }
        return 0
    }
    return 1
}
