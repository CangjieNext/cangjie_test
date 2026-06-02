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
    var input: Tokens = quote(do {-b} while (!a))
    let expr = parseExpr(input)
    if (expr is DoWhileExpr) {
        var doWhileExpr = match (expr as DoWhileExpr) {
            case Some(v) => v
            case None => throw Exception("Not DoWhileExpr")
        }
        var condExpr = doWhileExpr.condition
        var bodyExpr = doWhileExpr.block
        var condExprUnary = match (condExpr as UnaryExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not UnaryExpr")
        }
        var condExprUnaryValue = match (condExprUnary as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var bodyExprblock = match (bodyExpr as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodyExprblockUnary = match (bodyExprblock as UnaryExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not UnaryExpr")
        }
        var bodyExprblockUnaryValue = match (bodyExprblockUnary as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (condExprUnaryValue != "a" || bodyExprblockUnaryValue != "b") {
            return 1
        }
        return 0
    }
    return 3
}
