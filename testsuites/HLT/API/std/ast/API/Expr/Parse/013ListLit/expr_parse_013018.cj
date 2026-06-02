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
    var input: Tokens = quote([(1,2), (4,5)])
    let expr = parseExpr(input)
    if (expr is ArrayLiteral) {
        var arrayliteral = match (expr as ArrayLiteral) {
            case Some(v) => v
            case None => throw Exception("Not ArrayLiteral")
        }
        var arrayliteral0 = arrayliteral.elements[0]
        var arrayliteral1 = arrayliteral.elements[1]
        var arrayliteral0Expr = match (arrayliteral0 as TupleLiteral) {
            case Some(v) => v.elements[0]
            case None => throw Exception("Not TupleLiteral")
        }
        var arrayliteral0ExprValue = match (arrayliteral0Expr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var arrayliteral1Expr = match (arrayliteral1 as TupleLiteral) {
            case Some(v) => v.elements[1]
            case None => throw Exception("Not TupleLiteral")
        }
        var arrayliteral1ExprValue = match (arrayliteral1Expr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (arrayliteral0ExprValue != "1" || arrayliteral1ExprValue != "5") {
            return 1
        }
        return 0
    }
    return 5
}
