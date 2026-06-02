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
            case a is B => a is B
            case -b => -b
            case (A) => (A)
            case obj(a) => obj(a)
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
        var matches0 = mh.matchCases[0]
        var matches1 = mh.matchCases[1]
        var matches2 = mh.matchCases[2]
        var matches3 = mh.matchCases[3]
        var matches0Expr = match (matches0 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches0IsExpr = match (matches0Expr as IsExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not IsExpr")
        }
        var matches0IsExprValue = match (matches0IsExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
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

        var matches1Expr = match (matches1 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches1UnaryExpr = match (matches1Expr as UnaryExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not UnaryExpr")
        }
        var matches1UnaryExprValue = match (matches1UnaryExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var mp1 = match (matches1 as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mp1Expr = match (mp1 as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp1UnaryExpr = match (mp1Expr as UnaryExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not UnaryExpr")
        }
        var mp1UnaryExprValue = match (mp1UnaryExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var matches2Expr = match (matches2 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches2ParenExpr = match (matches2Expr as ParenExpr) {
            case Some(v) => v.parenthesizedExpr
            case None => throw Exception("Not ParenExpr")
        }
        var matches2ParenExprValue = match (matches2ParenExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var mp2 = match (matches2 as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mp2Expr = match (mp2 as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp2ParenExpr = match (mp2Expr as ParenExpr) {
            case Some(v) => v.parenthesizedExpr
            case None => throw Exception("Not ParenExpr")
        }
        var mp2ParenExprValue = match (mp2ParenExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var matches3Expr = match (matches3 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches3CallExpr = match (matches3Expr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var matches3CallExprValue = match (matches3CallExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var mp3 = match (matches3 as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mp3Expr = match (mp3 as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp3CallExpr = match (mp3Expr as CallExpr) {
            case Some(v) => v.arguments[0]
            case None => throw Exception("Not CallExpr")
        }
        var mp3CallArgExpr = match (mp3CallExpr as Argument) {
            case Some(v) => v.expr
            case None => throw Exception("Not Argument")
        }
        var mp3CallExprValue = match (mp3CallArgExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (hasSelector != false || matches0IsExprValue != "a" || !(mp0Expr is Expr) || mp0IsExprValue != "a" ||
            matches1UnaryExprValue != "b" || !(mp1Expr is Expr) || mp1UnaryExprValue != "b" || matches2ParenExprValue !=
            "A" || !(mp2Expr is Expr) || mp2ParenExprValue != "A" || matches3CallExprValue != "obj" ||
            !(mp3Expr is Expr) || mp3CallExprValue != "a") {
            return 1
        }
        return 0
    }
    return 1
}
