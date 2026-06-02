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
    var input: Tokens = quote(return a=b)
    let expr = parseExpr(input)
    if (expr is ReturnExpr) {
        var returnExpr = match (expr as ReturnExpr) {
            case Some(v) => v
            case None => throw Exception("Not ReturnExpr")
        }
        var keyWordExpr = returnExpr.keyword.value
        var rExpr = returnExpr.expr
        var lassignExpr = match (rExpr as AssignExpr) {
            case Some(v) => v.leftExpr
            case None => throw Exception("Not AssignExpr")
        }
        var rassignExpr = match (rExpr as AssignExpr) {
            case Some(v) => v.rightExpr
            case None => throw Exception("Not AssignExpr")
        }
        var assignExpr = match (rExpr as AssignExpr) {
            case Some(v) => v.assign.value
            case None => throw Exception("Not AssignExpr")
        }
        var lassignExprValue = match (lassignExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var rassignExprValue = match (rassignExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (rExpr is AssignExpr || keyWordExpr == "return" || lassignExprValue == "a" || rassignExprValue == "b" ||
            assignExpr == "=") {
            return 0
        }
        return 1
    }
    return 3
}
