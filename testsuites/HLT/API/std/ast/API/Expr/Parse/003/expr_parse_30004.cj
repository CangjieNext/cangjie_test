/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var input: Tokens = quote(!(1))
    let expr = parseExpr(input)
    if (expr is UnaryExpr) {
        var b = match (expr as UnaryExpr) {
            case Some(v) => v
            case None => throw Exception("Not UnaryExpr")
        }

        var unaryExpr = b.expr
        var optVaule = b.op.value

        var parenExpr = match (unaryExpr as ParenExpr) {
            case Some(v) => v.parenthesizedExpr
            case None => throw Exception("Not ParenExpr")
        }

        var value = match (parenExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        var lparen = match (unaryExpr as ParenExpr) {
            case Some(v) => v.lParen.value
            case None => throw Exception("Not ParenExpr")
        }

        var rparen = match (unaryExpr as ParenExpr) {
            case Some(v) => v.rParen.value
            case None => throw Exception("Not ParenExpr")
        }

        if (value != "1" || optVaule != "!" || lparen != "(" || rparen != ")") {
            return 1
        }
        return 0
    }
    return 3
}
