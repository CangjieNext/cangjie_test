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
    var input: Tokens = quote(a.b=1)
    let expr = parseExpr(input)
    if (expr is AssignExpr) {
        var assignExpr = match (expr as AssignExpr) {
            case Some(v) => v
            case None => throw Exception("Not AssignExpr")
        }
        var lExpr = assignExpr.leftExpr
        var rExpr = assignExpr.rightExpr
        var optValue = assignExpr.assign.value
        var memberAccessbase = match (lExpr as MemberAccess) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not MemberAccess")
        }
        var memberAccessbaseValue = match (memberAccessbase as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var memberAccessfieldValue = match (lExpr as MemberAccess) {
            case Some(v) => v.field.value
            case None => throw Exception("Not MemberAccess")
        }
        var memberAccessdot = match (lExpr as MemberAccess) {
            case Some(v) => v.dot.value
            case None => throw Exception("Not MemberAccess")
        }
        var rExprValue = match (rExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (memberAccessbaseValue != "a" || memberAccessfieldValue != "b" || memberAccessdot != "." || rExprValue != "1" ||
            optValue != "=") {
            return 1
        }
        return 0
    }
    return 3
}
