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
        for (i in (A) where (B)){
            (C)
        }
    )
    let expr = parseExpr(input)
    if (expr is ForInExpr) {
        var forExpr = match (expr as ForInExpr) {
            case Some(v) => v
            case None => throw Exception("Not ForInExpr")
        }
        var pattrenExpr = forExpr.pattern
        var InExpr = forExpr.expr
        var body = forExpr.block
        var patternGuard = forExpr.patternGuard
        var pattrenExprValue = match (pattrenExpr as VarPattern) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarPattern")
        }
        var InExprParen = match (InExpr as ParenExpr) {
            case Some(v) => v.parenthesizedExpr
            case None => throw Exception("Not ParenExpr")
        }
        var InExprParenValue = match (InExprParen as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var patternGuardParen = match (patternGuard as ParenExpr) {
            case Some(v) => v.parenthesizedExpr
            case None => throw Exception("Not ParenExpr")
        }
        var patternGuardParenValue = match (patternGuardParen as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var bodyParen = match (body as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodyParenExpr = match (bodyParen as ParenExpr) {
            case Some(v) => v.parenthesizedExpr
            case None => throw Exception("Not ParenExpr")
        }
        var bodyParenExprValue = match (bodyParenExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (pattrenExprValue != "i" || InExprParenValue != "A" || patternGuardParenValue != "B" || bodyParenExprValue !=
            "C") {
            return 1
        }
        return 0
    }
    return 1
}
