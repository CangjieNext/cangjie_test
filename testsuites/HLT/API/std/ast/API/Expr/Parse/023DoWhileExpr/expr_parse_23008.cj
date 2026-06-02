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
    var input: Tokens = quote(do {b is Bool} while (a is Bool))
    let expr = parseExpr(input)
    if (expr is DoWhileExpr) {
        var doWhileExpr = match (expr as DoWhileExpr) {
            case Some(v) => v
            case None => throw Exception("Not DoWhileExpr")
        }
        var condExpr = doWhileExpr.condition
        var bodyExpr = doWhileExpr.block
        var condExprIsExprleft = match (condExpr as IsExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not IsExpr")
        }
        var condExprIsExprleftValue = match (condExprIsExprleft as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var condExprIsExprright = match (condExpr as IsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not IsExpr")
        }
        var condExprIsExprrightValue = match (condExprIsExprright as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        var bodyExprblock = match (bodyExpr as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var bodyExprblockIsExprleft = match (bodyExprblock as IsExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not IsExpr")
        }
        var bodyExprblockIsExprleftValue = match (bodyExprblockIsExprleft as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var bodyExprblockIsExprright = match (bodyExprblock as IsExpr) {
            case Some(v) => v.shiftType
            case None => throw Exception("Not IsExpr")
        }
        var bodyExprblockIsExprrightValue = match (bodyExprblockIsExprright as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (condExprIsExprleftValue != "a" || condExprIsExprrightValue != "Bool" || bodyExprblockIsExprleftValue != "b" ||
            bodyExprblockIsExprrightValue != "Bool") {
            return 1
        }
        return 0
    }
    return 10
}
