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
    var input: Tokens = quote([1+2,a+b])
    let expr = parseExpr(input)
    if (expr is ArrayLiteral) {
        var b = match (expr as ArrayLiteral) {
            case Some(v) => v
            case None => throw Exception("Not ArrayLiteral")
        }
        var Expr0 = match (b.elements[0] as BinaryExpr) {
            case Some(v) => v
            case None => throw Exception("Not BinaryExpr")
        }
        var lValue1 = match (Expr0.leftExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var lValue2 = match (Expr0.rightExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        if (lValue1 != "1" || lValue2 != "2") {
            return 1
        }

        var Expr1 = match (b.elements[1] as BinaryExpr) {
            case Some(v) => v
            case None => throw Exception("Not BinaryExpr")
        }
        var rValue1 = match (Expr1.leftExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var rValue2 = match (Expr1.rightExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        if (rValue1 != "a" || rValue2 != "b") {
            return 2
        }

        return 0
    }
    return 5
}
