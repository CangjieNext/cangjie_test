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
    var input: Tokens = quote(do {(b)} while ((A)))
    let expr = parseExpr(input)
    if (expr is DoWhileExpr) {
        var doWhileExpr = match (expr as DoWhileExpr) {
            case Some(v) => v
            case None => throw Exception("Not DoWhileExpr")
        }
        var condExpr = doWhileExpr.condition
        var bodyExpr = doWhileExpr.block
        var condExprParenExpr = match (condExpr as ParenExpr) {
            case Some(v) => v.parenthesizedExpr
            case None => throw Exception("Not ParenExpr")
        }
        var condExprParenExprValue = match (condExprParenExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var bodyExprblock = match (bodyExpr as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodyExprblockParenExpr = match (bodyExprblock as ParenExpr) {
            case Some(v) => v.parenthesizedExpr
            case None => throw Exception("Not ParenExpr")
        }
        var bodyExprblockParenExprValue = match (bodyExprblockParenExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (condExprParenExprValue != "A" || bodyExprblockParenExprValue != "b") {
            return 1
        }
        return 0
    }
    return 10
}
