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
    var input: Tokens = quote(a()+b())
    let expr = parseExpr(input)
    if (expr is BinaryExpr) {
        var binaryExpr = match (expr as BinaryExpr) {
            case Some(v) => v
            case None => throw Exception("Not BinaryExpr")
        }

        var lExpr = binaryExpr.leftExpr
        var rExpr = binaryExpr.rightExpr
        var optExpr = binaryExpr.op.value

        var lexpr = match (lExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var lval = match (lexpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var llval = match (lExpr as CallExpr) {
            case Some(v) => v.lParen.value
            case None => throw Exception("Not CallExpr")
        }
        var lrval = match (lExpr as CallExpr) {
            case Some(v) => v.rParen.value
            case None => throw Exception("Not CallExpr")
        }

        var rexpr = match (rExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var rval = match (rexpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var rlval = match (rExpr as CallExpr) {
            case Some(v) => v.lParen.value
            case None => throw Exception("Not CallExpr")
        }
        var rrval = match (rExpr as CallExpr) {
            case Some(v) => v.rParen.value
            case None => throw Exception("Not CallExpr")
        }

        if (lval != "a" || rval != "b" || rlval != "(" || rrval != ")" || llval != "(" || lrval != ")" || optExpr != "+") {
            return 1
        }

        return 0
    }
    return 3
}
