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
         match (return a) {
            case 10 where true => return a
            case 10 where true => a=b
            case 10 where true => A.b<T>
            case 10 where true => for (x in items) {1}
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
        var mhSelectorExpr = match (mhSelector as ReturnExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ReturnExpr")
        }
        var mhSelectorValue = match (mhSelectorExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var matches0 = mh.matchCases[0]
        var matches1 = mh.matchCases[1]
        var matches2 = mh.matchCases[2]
        var matches3 = mh.matchCases[3]
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
        var mp0ReturnExpr = match (mp0Expr as ReturnExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ReturnExpr")
        }
        var mp0ReturnExprValue = match (mp0ReturnExpr as RefExpr) {
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
        var mp1AssExpr = match (mp1Expr as AssignExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not AssignExpr")
        }
        var mp1AssExprValue = match (mp1AssExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var matches2patterns = match (matches2 as MatchCase) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not MatchCase")
        }
        var matches2Constpatterns = match (matches2patterns as ConstPattern) {
            case Some(v) => v.litConstExpr
            case None => throw Exception("Not ConstPattern")
        }
        var matches2ConstpatternsValue = match (matches2Constpatterns as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var matches2patternGuard = match (matches2 as MatchCase) {
            case Some(v) => v.patternGuard
            case None => throw Exception("Not MatchCase")
        }
        var matches2patternGuardValue = match (matches2patternGuard as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var mp2 = match (matches2 as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mp2Expr = match (mp2 as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp2MemExpr = match (mp2Expr as MemberAccess) {
            case Some(v) => v.typeArguments[0]
            case None => throw Exception("Not MemberAccess")
        }

        var mp2MemExprValue = match (mp2MemExpr as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }

        var matches3patterns = match (matches3 as MatchCase) {
            case Some(v) => v.patterns[0]
            case None => throw Exception("Not MatchCase")
        }
        var matches3Constpatterns = match (matches3patterns as ConstPattern) {
            case Some(v) => v.litConstExpr
            case None => throw Exception("Not ConstPattern")
        }
        var matches3ConstpatternsValue = match (matches3Constpatterns as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var matches3patternGuard = match (matches3 as MatchCase) {
            case Some(v) => v.patternGuard
            case None => throw Exception("Not MatchCase")
        }
        var matches3patternGuardValue = match (matches3patternGuard as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (hasSelector != true || mh.matchCases.size == 0 || mhSelectorValue != "a" ||
            !(matches0patterns is ConstPattern) || matches0ConstpatternsValue != "10" || matches0patternGuardValue !=
            "true" || mp0ReturnExprValue != "a" || !(matches1patterns is ConstPattern) || matches1ConstpatternsValue !=
            "10" || matches1patternGuardValue != "true" || mp1AssExprValue != "a" || !(matches2patterns is ConstPattern) ||
            matches2ConstpatternsValue != "10" || matches2patternGuardValue != "true" || mp2MemExprValue != "T" ||
            !(matches3patterns is ConstPattern) || matches3ConstpatternsValue != "10" || matches3patternGuardValue !=
            "true") {
            return 1
        }
        return 0
    }
    return 1
}
