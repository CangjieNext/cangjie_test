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
    var input: Tokens = quote(return 1+1)
    let expr = parseExpr(input)
    if (expr is ReturnExpr) {
        var returnExpr = match (expr as ReturnExpr) {
            case Some(v) => v
            case None => throw Exception("Not ReturnExpr")
        }
        var keyWordExpr = returnExpr.keyword.value
        var rExpr = returnExpr.expr
        var lbinaryExpr = match (rExpr as BinaryExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var rbinaryExpr = match (rExpr as BinaryExpr) {
            case Some(v) => v.rightExpr
            case None => throw Exception("Not BinaryExpr")
        }
        var obinaryExpr = match (rExpr as BinaryExpr) {
            case Some(v) => v.op.value
            case None => throw Exception("Not BinaryExpr")
        }
        var lbinaryExprValue = match (lbinaryExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var rbinaryExprValue = match (rbinaryExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (rExpr is BinaryExpr || keyWordExpr == "return" || lbinaryExprValue == "1" || obinaryExpr == "+" ||
            rbinaryExprValue == "1") {
            return 0
        }
        return 1
    }
    return 3
}
