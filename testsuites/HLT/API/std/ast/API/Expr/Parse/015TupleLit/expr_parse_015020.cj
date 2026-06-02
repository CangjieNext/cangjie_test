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
    var input: Tokens = quote((a[b],b[0]))
    let expr = parseExpr(input)
    if (expr is TupleLiteral) {
        var tupleLit = match (expr as TupleLiteral) {
            case Some(v) => v
            case None => throw Exception("Not TupleLiteral")
        }
        var tupleLit0 = tupleLit.elements[0]
        var tupleLit1 = tupleLit.elements[1]
        var tupleLit0Expr = match (tupleLit0 as SubscriptExpr) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not SubscriptExpr")
        }
        var tupleLit0ExprValue = match (tupleLit0Expr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var tupleLit1Expr = match (tupleLit1 as SubscriptExpr) {
            case Some(v) => v.indexList[0]
            case None => throw Exception("Not SubscriptExpr")
        }
        var tupleLit1ExprValue = match (tupleLit1Expr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (tupleLit0ExprValue != "a" || tupleLit1ExprValue != "0") {
            return 1
        }
        return 0
    }
    return 5
}
