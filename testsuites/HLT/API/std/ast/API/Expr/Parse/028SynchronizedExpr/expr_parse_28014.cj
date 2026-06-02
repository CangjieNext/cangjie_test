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
            synchronized(mtx2) {}
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
        var blockExprMutex = match (blockExpr0 as SynchronizedExpr) {
            case Some(v) => v.structuredMutex
            case None => throw Exception("Not SynchronizedExpr")
        }
        var blockExprMutexValue = match (blockExprMutex as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var blockExprBody = match (blockExpr0 as SynchronizedExpr) {
            case Some(v) => v.block
            case None => throw Exception("Not SynchronizedExpr")
        }
        var blockExprBodysize = match (blockExprBody as Block) {
            case Some(v) => v.nodes.size
            case None => throw Exception("Not Block")
        }
        if (mutexExpr != "mtx" || blockExprMutexValue != "mtx2" || blockExprBodysize != 0) {
            return 1
        }
        return 0
    }
    return 5
}
