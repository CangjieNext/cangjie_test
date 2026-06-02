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
            case a(){3} => a(){3}
            case spawn {x} => spawn {x}
            case synchronized(mtx2) {} => synchronized(mtx2) {}
            case () => ()
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
        var matches0TraExpr = match (matches0Expr as TrailingClosureExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not TrailingClosureExpr")
        }
        var matches0TraExprCall = match (matches0TraExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var matches0TraExprCallValue = match (matches0TraExprCall as RefExpr) {
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
        var mp0TraExpr = match (mp0Expr as TrailingClosureExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not TrailingClosureExpr")
        }
        var mp0TraExprCall = match (mp0TraExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var mp0TraExprCallValue = match (mp0TraExprCall as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var matches1Expr = match (matches1 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches1SpawnExpr = match (matches1Expr as SpawnExpr) {
            case Some(v) => v.lambdaExpr
            case None => throw Exception("Not SpawnExpr")
        }
        var matches1SpawnLamExpr = match (matches1SpawnExpr as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var matches1SpawnLamExprValue = match (matches1SpawnLamExpr as RefExpr) {
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
        var mp1SpawnExpr = match (mp1Expr as SpawnExpr) {
            case Some(v) => v.lambdaExpr
            case None => throw Exception("Not SpawnExpr")
        }
        var mp1SpawnLamExpr = match (mp1SpawnExpr as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var mp1SpawnLamExprValue = match (mp1SpawnLamExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var matches2Expr = match (matches2 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches2SynExpr = match (matches2Expr as SynchronizedExpr) {
            case Some(v) => v.structuredMutex
            case None => throw Exception("Not SynchronizedExpr")
        }
        var matches2SynExprValue = match (matches2SynExpr as RefExpr) {
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
        var mp2SynExpr = match (mp2Expr as SynchronizedExpr) {
            case Some(v) => v.structuredMutex
            case None => throw Exception("Not SynchronizedExpr")
        }
        var mp2SynExprValue = match (mp2SynExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var matches3Expr = match (matches3 as MatchCase) {
            case Some(v) => v.expr
            case None => throw Exception("Not MatchCase")
        }
        var matches3ExprValue = match (matches3Expr as LitConstExpr) {
            case Some(v) => v.literal.kind
            case None => throw Exception("Not LitConstExpr")
        }
        var mp3 = match (matches3 as MatchCase) {
            case Some(v) => v.block
            case None => throw Exception("Not MatchCase")
        }
        var mp3Expr = match (mp3 as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var mp3ExprValue = match (mp3Expr as LitConstExpr) {
            case Some(v) => v.literal.kind
            case None => throw Exception("Not LitConstExpr")
        }
        if (hasSelector != false || matches0TraExprCallValue != "a" || mp0TraExprCallValue != "a" ||
            matches1SpawnLamExprValue != "x" || mp1SpawnLamExprValue != "x" || matches2SynExprValue != "mtx2" ||
            !(mp2Expr is Expr) || mp2SynExprValue != "mtx2" || !(matches3Expr is LitConstExpr) || matches3ExprValue != TokenKind
            .UNIT_LITERAL || !(mp3Expr is Expr) || !(mp3Expr is LitConstExpr) || mp3ExprValue != TokenKind.UNIT_LITERAL) {
            return 1
        }
        return 0
    }
    return 1
}
