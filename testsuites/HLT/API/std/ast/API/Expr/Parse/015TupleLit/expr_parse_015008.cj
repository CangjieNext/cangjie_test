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
    var input: Tokens = quote((-b,!a))
    let expr = parseExpr(input)
    if (expr is TupleLiteral) {
        var tupleLit = match (expr as TupleLiteral) {
            case Some(v) => v
            case None => throw Exception("Not TupleLiteral")
        }
        var tupleLit0 = tupleLit.elements[0]
        var tupleLit1 = tupleLit.elements[1]
        var tupleLit0UnaryExpr = match (tupleLit0 as UnaryExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not UnaryExpr")
        }
        var tupleLit0UnaryExprValue = match (tupleLit0UnaryExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var tupleLit1UnaryExpr = match (tupleLit1 as UnaryExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not UnaryExpr")
        }
        var tupleLit1UnaryExprValue = match (tupleLit1UnaryExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (tupleLit0UnaryExprValue != "b" || tupleLit1UnaryExprValue != "a") {
            return 1
        }
        return 0
    }
    return 5
}
