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
    var input: Tokens = quote([[1,2], [4,5]])
    let expr = parseExpr(input)
    if (expr is ArrayLiteral) {
        var b = match (expr as ArrayLiteral) {
            case Some(v) => v
            case None => throw Exception("Not ArrayLiteral")
        }
        var Expr0 = match (b.elements[0] as ArrayLiteral) {
            case Some(v) => v
            case None => throw Exception("Not ArrayLiteral")
        }
        var lValue = match (Expr0.elements[0] as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        var Expr1 = match (b.elements[1] as ArrayLiteral) {
            case Some(v) => v
            case None => throw Exception("Not ArrayLiteral")
        }
        var rValue = match (Expr1.elements[1] as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        if (lValue != "1" || rValue != "5") {
            return 1
        }

        return 0
    }
    return 5
}
