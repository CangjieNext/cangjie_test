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
    var input: Tokens = quote((a(){123}, b(){a => b}))
    let expr = parseExpr(input)
    if (expr is TupleLiteral) {
        var tupleLit = match (expr as TupleLiteral) {
            case Some(v) => v
            case None => throw Exception("Not TupleLiteral")
        }
        var tupleLit0 = tupleLit.elements[0]
        var tupleLit1 = tupleLit.elements[1]
        var tupleLit0conditionExpr = match (tupleLit0 as TrailingClosureExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not TrailingClosureExpr")
        }
        var tupleLit0conditionCallExpr = match (tupleLit0conditionExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var tupleLit0conditionExprValue = match (tupleLit0conditionCallExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var tupleLit1lamdba = match (tupleLit1 as TrailingClosureExpr) {
            case Some(v) => v.lambdaExpr
            case None => throw Exception("Not TrailingClosureExpr")
        }
        var tupleLit1lamdbaExpr = match (tupleLit1lamdba as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not LambdaExpr")
        }
        var tupleLit1lamdbaExprValue = match (tupleLit1lamdbaExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (tupleLit0conditionExprValue != "a" || tupleLit1lamdbaExprValue != "b") {
            return 1
        }
        return 0
    }
    return 5
}
