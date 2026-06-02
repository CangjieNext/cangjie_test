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

main(): Int64 {
    var input: Tokens = quote(
        synchronized(mtx) {
            var a:Int32 = 1
            a++
            a+b;
            -b;4
        }
    )
    let expr = parseExpr(input)
    if (expr is SynchronizedExpr) {
        var synchronizedExpr = match (expr as SynchronizedExpr) {
            case Some(v) => v
            case None => throw Exception("Not SynchronizedExpr")
        }
        var mutex = synchronizedExpr.structuredMutex
        var blockExpr = synchronizedExpr.block
        var mutexExpr = match (mutex as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var blockExpr0 = match (blockExpr as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var blockExpr0Decl = match (blockExpr0 as Decl) {
            case Some(v) => v
            case None => throw Exception("Not Decl")
        }
        var blockExpr0VarDecl = match (blockExpr0Decl as VarDecl) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not VarDecl")
        }
        var blockExpr1 = match (blockExpr as Block) {
            case Some(v) => v.nodes[1]
            case None => throw Exception("Not Block")
        }
        var blockExpr1Expr = match (blockExpr1 as IncOrDecExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not IncOrDecExpr")
        }
        var blockExpr1ExprValue = match (blockExpr1Expr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var blockExpr2 = match (blockExpr as Block) {
            case Some(v) => v.nodes[2]
            case None => throw Exception("Not Block")
        }
        var blockExpr2Expr = match (blockExpr2 as BinaryExpr) {
            case Some(v) => v.rightExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var blockExpr2ExprValue = match (blockExpr2Expr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var blockExpr3 = match (blockExpr as Block) {
            case Some(v) => v.nodes[3]
            case None => throw Exception("Not Block")
        }
        var blockExpr3Expr = match (blockExpr3 as UnaryExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not UnaryExpr")
        }
        var blockExpr3ExprValue = match (blockExpr3Expr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var blockExpr4 = match (blockExpr as Block) {
            case Some(v) => v.nodes[4]
            case None => throw Exception("Not Block")
        }
        var blockExpr4Value = match (blockExpr4 as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (mutexExpr != "mtx" || blockExpr0VarDecl != "a" || blockExpr1ExprValue != "a" || blockExpr2ExprValue != "b" ||
            blockExpr3ExprValue != "b" || blockExpr4Value != "4") {
            return 1
        }
        return 0
    }
    return 8
}
