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
            case return a => return a
            case a=b => a=b
            case A.b<T> => A.b<T>
            case for (x in items) {1} => for (x in items) {1}
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
        var matches0IsExpr = match (matches0Expr as ReturnExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ReturnExpr")
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
        var mp0IsExpr = match (mp0Expr as ReturnExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ReturnExpr")
        }
        var mp0IsExprValue = match (mp0IsExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var matches1Expr = match (matches1 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches1UnaryExpr = match (matches1Expr as AssignExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not AssignExpr")
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
        var mp1UnaryExpr = match (mp1Expr as AssignExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not AssignExpr")
        }
        var mp1UnaryExprValue = match (mp1UnaryExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var matches2Expr = match (matches2 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches2ParenExpr = match (matches2Expr as MemberAccess) {
            case Some(v) => v.typeArguments[0]
            case None => throw Exception("Not MemberAccess")
        }
        var matches2ParenExprValue = match (matches2ParenExpr as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        var mp2 = match (matches2 as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mp2Expr = match (mp2 as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp2ParenExpr = match (mp2Expr as MemberAccess) {
            case Some(v) => v.typeArguments[0]
            case None => throw Exception("Not MemberAccess")
        }
        var mp2ParenExprValue = match (mp2ParenExpr as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }

        var mp3 = match (matches3 as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mp3Expr = match (mp3 as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        if (hasSelector != false || matches0IsExprValue != "a" || !(mp0Expr is Expr) || mp0IsExprValue != "a" ||
            matches1UnaryExprValue != "a" || !(mp1Expr is Expr) || mp1UnaryExprValue != "a" || matches2ParenExprValue !=
            "T" || !(mp2Expr is Expr) || mp2ParenExprValue != "T" || !(mp3Expr is Expr)) {
            return 1
        }
        return 0
    }
    return 1
}
