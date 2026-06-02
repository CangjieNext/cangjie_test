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
    var input: Tokens = quote(return 1 + return a)
    let expr = parseExpr(input)
    if (expr is BinaryExpr) {
        var binaryExpr = match (expr as BinaryExpr) {
            case Some(v) => v
            case None => throw Exception("Not BinaryExpr")
        }

        var lExpr = binaryExpr.leftExpr
        var rExpr = binaryExpr.rightExpr
        var optExpr = binaryExpr.op.value

        var lkeyexpr = match (lExpr as ReturnExpr) {
            case Some(v) => v.keyword
            case None => throw Exception("Not ReturnExpr")
        }
        var lkey = match (lkeyexpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var lvalexpr = match (lExpr as ReturnExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ReturnExpr")
        }
        var lval = match (lkeyexpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        var rkeyexpr = match (lExpr as ReturnExpr) {
            case Some(v) => v.keyword
            case None => throw Exception("Not ReturnExpr")
        }
        var rkey = match (lkeyexpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var rvalexpr = match (lExpr as ReturnExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ReturnExpr")
        }
        var rval = match (lkeyexpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (lval != "1" || rval != "a" || optExpr != "+" || lkey != "return" || rkey != "return") {
            return 1
        }
        return 3
    }
    return 0
}
