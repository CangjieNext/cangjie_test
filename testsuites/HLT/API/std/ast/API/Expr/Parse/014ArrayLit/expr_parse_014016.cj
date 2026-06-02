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
    var input: Tokens = quote([a(){123}, b(){a => b}])
    let expr = parseExpr(input)
    if (expr is ArrayLiteral) {
        var b = match (expr as ArrayLiteral) {
            case Some(v) => v
            case None => throw Exception("Not ArrayLiteral")
        }
        var tc0 = match (b.elements[0] as TrailingClosureExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not TrailingClosureExpr")
        }
        var funcExpr = match (tc0 as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var funcValue = match (funcExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (funcValue != "a") {
            return 1
        }

        var tc1 = match (b.elements[1] as TrailingClosureExpr) {
            case Some(v) => v.lambdaExpr
            case None => throw Exception("Not TrailingClosureExpr")
        }
        var lamExpr1 = match (tc1 as LambdaExpr) {
            case Some(v) => v
            case None => throw Exception("Not LambdaExpr")
        }
        var nodesArray1 = lamExpr1.nodes
        var bValue1 = ""
        for (i in nodesArray1) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            bValue1 = bValue1 + value
        }
        if (bValue1 != "b") {
            return 2
        }
        return 0
    }
    return 5
}
