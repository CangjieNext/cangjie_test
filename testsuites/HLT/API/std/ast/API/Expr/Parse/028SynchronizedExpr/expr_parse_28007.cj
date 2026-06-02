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
            a is b;
            b as A
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
        var blockExpr0Expr = match (blockExpr0 as IsExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not IsExpr")
        }
        var blockExpr0ExprValue = match (blockExpr0Expr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var blockExpr1 = match (blockExpr as Block) {
            case Some(v) => v.nodes[1]
            case None => throw Exception("Not Block")
        }
        var blockExpr1Expr = match (blockExpr1 as AsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not AsExpr")
        }
        var blockExpr1ExprValue = match (blockExpr1Expr as RefType) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefType")
        }
        if (mutexExpr != "mtx" || blockExpr0ExprValue != "a" || blockExpr1ExprValue != "A") {
            return 1
        }
        return 0
    }
    return 4
}
