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
    var input: Tokens = quote(a=foo())
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

        var callExpr = match (rExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var rExprValue = match (callExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var lcallExpr = match (rExpr as CallExpr) {
            case Some(v) => v.lParen.value
            case None => throw Exception("Not CallExpr")
        }
        var rcallExpr = match (rExpr as CallExpr) {
            case Some(v) => v.rParen.value
            case None => throw Exception("Not CallExpr")
        }

        if (lExprValue != "a" || rExprValue != "foo" || optValue != "=" || lcallExpr != "(" || rcallExpr != ")") {
            return 1
        }
        return 0
    }
    return 3
}
