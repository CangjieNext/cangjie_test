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
    var input: Tokens = quote(a=f(1){ i => i * i })
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
        var trailingClosureExpr = match (rExpr as TrailingClosureExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not TrailingClosureExpr")
        }
        var callExpr = match (trailingClosureExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var rExprValue = match (callExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (lExprValue != "a" || rExprValue != "f" || optValue != "=") {
            return 1
        }
        return 0
    }
    return 3
}
