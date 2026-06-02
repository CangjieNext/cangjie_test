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
    var input: Tokens = quote(a=!b)
    let expr = parseExpr(input)
    if (expr is AssignExpr) {
        var assignExpr = match (expr as AssignExpr) {
            case Some(v) => v
            case None => throw Exception("Not AssignExpr")
        }
        var lExpr = assignExpr.leftExpr
        var rExpr = assignExpr.rightExpr
        var optValue = assignExpr.assign.value

        var lExprValue = match (lExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var unaryExpr = match (rExpr as UnaryExpr) {
            case Some(v) => v.op.value
            case None => throw Exception("Not UnaryExpr")
        }
        var runaryExpr = match (rExpr as UnaryExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not UnaryExpr")
        }
        var rExprValue = match (runaryExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        if (lExprValue != "a" || rExprValue != "b" || unaryExpr != "!" || optValue != "=") {
            return 1
        }
        return 0
    }
    return 3
}
