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
        synchronized(mtx) {}
    )
    let expr = parseExpr(input)
    if (expr is SynchronizedExpr) {
        var synchronizedExpr = match (expr as SynchronizedExpr) {
            case Some(v) => v.structuredMutex
            case None => throw Exception("Not SynchronizedExpr")
        }
        var synchronizedExprValue = match (synchronizedExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var synchronizedExprblock = match (expr as SynchronizedExpr) {
            case Some(v) => v.block
            case None => throw Exception("Not SynchronizedExpr")
        }
        var synchronizedExprblocksize = match (synchronizedExprblock as Block) {
            case Some(v) => v.nodes.size
            case None => throw Exception("Not Block")
        }
        if (synchronizedExprValue != "mtx" || synchronizedExprblocksize != 0) {
            return 1
        }
        return 0
    }
    return 3
}
