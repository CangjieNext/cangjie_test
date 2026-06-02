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
            case if (a) {b} else {c} => if (a) {b} else {c}
            case while (a) {c} => while (a) {c}
            case do {b} while(d) => do {b} while(d)
            case { x:Int32 => 2 } => { x:Int32 => 2 }
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
        var matches0IfExpr = match (matches0Expr as IfExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not IfExpr")
        }
        var matches0IfExprValue = match (matches0IfExpr as RefExpr) {
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
        var mp0IfExpr = match (mp0Expr as IfExpr) {
            case Some(v) => v.elseExpr
            case None => throw Exception("Not IfExpr")
        }
        var mp0IfElseExpr = match (mp0IfExpr as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp0IfElseExprValue = match (mp0IfElseExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var matches1Expr = match (matches1 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches1WhileExpr = match (matches1Expr as WhileExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not WhileExpr")
        }
        var matches1WhileExprValue = match (matches1WhileExpr as RefExpr) {
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
        var mp1WhileExpr = match (mp1Expr as WhileExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not WhileExpr")
        }
        var mp1WhileExprValue = match (mp1WhileExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var matches2Expr = match (matches2 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches2DoExpr = match (matches2Expr as DoWhileExpr) {
            case Some(v) => v.block
            case None => throw Exception("Not DoWhileExpr")
        }
        var matches2DoExprblock = match (matches2DoExpr as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var matches2DoExprblockValue = match (matches2DoExprblock as RefExpr) {
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
        var mp2DoExpr = match (mp2Expr as DoWhileExpr) {
            case Some(v) => v.block
            case None => throw Exception("Not DoWhileExpr")
        }
        var mp2DoExprblock = match (mp2DoExpr as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp2DoExprblockValue = match (mp2DoExprblock as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var matches3Expr = match (matches3 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches3LambdaExpr = match (matches3Expr as LambdaExpr) {
            case Some(v) => v.funcParams[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var matches3LambdaExprValue = match (matches3LambdaExpr as Decl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not Decl")
        }
        var mp3 = match (matches3 as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mp3Expr = match (mp3 as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp3LambdaExpr = match (mp3Expr as LambdaExpr) {
            case Some(v) => v.funcParams[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var mp3LambdaExprValue = match (mp3LambdaExpr as Decl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (hasSelector != false || matches0IfExprValue != "a" || !(mp0Expr is Expr) || mp0IfElseExprValue != "c" ||
            matches1WhileExprValue != "a" || !(mp1Expr is Expr) || mp1WhileExprValue != "a" ||
            matches2DoExprblockValue != "b" || !(mp2Expr is Expr) || mp2DoExprblockValue != "b" ||
            matches3LambdaExprValue != "x" || !(mp3Expr is Expr) || mp3LambdaExprValue != "x") {
            return 1
        }
        return 0
    }
    return 1
}
