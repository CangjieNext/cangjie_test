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
            ();(1,2,3);[4,5,6];[a,b]
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
        var blockExpr0Expr = match (blockExpr0 as LitConstExpr) {
            case Some(v) => v.literal.kind
            case None => throw Exception("Not LitConstExpr")
        }
        var blockExpr1 = match (blockExpr as Block) {
            case Some(v) => v.nodes[1]
            case None => throw Exception("Not Block")
        }
        var blockExpr1tuple = match (blockExpr1 as TupleLiteral) {
            case Some(v) => v.elements[0]
            case None => throw Exception("Not TupleLiteral")
        }
        var blockExpr1tupleValue = match (blockExpr1tuple as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var blockExpr2 = match (blockExpr as Block) {
            case Some(v) => v.nodes[2]
            case None => throw Exception("Not Block")
        }
        var blockExprarray = match (blockExpr2 as ArrayLiteral) {
            case Some(v) => v.elements[1]
            case None => throw Exception("Not ArrayLiteral")
        }
        var blockExprarrayValue = match (blockExprarray as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var blockExpr3 = match (blockExpr as Block) {
            case Some(v) => v.nodes[3]
            case None => throw Exception("Not Block")
        }
        var blockExpr3array = match (blockExpr3 as ArrayLiteral) {
            case Some(v) => v.elements[1]
            case None => throw Exception("Not ArrayLiteral")
        }
        var blockExpr3arrayValue = match (blockExpr3array as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (mutexExpr != "mtx" || !(blockExpr0 is LitConstExpr) || blockExpr0Expr != TokenKind.UNIT_LITERAL ||
            blockExpr1tupleValue != "1" || blockExprarrayValue != "5" || blockExpr3arrayValue != "b") {
            return 1
        }
        return 0
    }
    return 5
}
