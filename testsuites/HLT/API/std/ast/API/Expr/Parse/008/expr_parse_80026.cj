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
    var input: Tokens = quote(a[b]=1)
    let expr = parseExpr(input)
    if (expr is AssignExpr) {
        var assignExpr = match (expr as AssignExpr) {
            case Some(v) => v
            case None => throw Exception("Not AssignExpr")
        }
        var lExpr = assignExpr.leftExpr
        var rExpr = assignExpr.rightExpr
        var optValue = assignExpr.assign.value
        var subscriptExprbase = match (lExpr as SubscriptExpr) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not SubscriptExpr")
        }
        var subscriptExprbaseValue = match (subscriptExprbase as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var subscriptExpr = match (lExpr as SubscriptExpr) {
            case Some(v) => v.indexList[0]
            case None => throw Exception("Not SubscriptExpr")
        }
        var lExprValue = match (subscriptExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var subscriptExprlSquare = match (lExpr as SubscriptExpr) {
            case Some(v) => v.lSquare.value
            case None => throw Exception("Not SubscriptExpr")
        }
        var subscriptExprrSquare = match (lExpr as SubscriptExpr) {
            case Some(v) => v.rSquare.value
            case None => throw Exception("Not SubscriptExpr")
        }
        var rExprValue = match (rExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (subscriptExprbaseValue != "a" || subscriptExprlSquare != "[" || subscriptExprrSquare != "]" || lExprValue !=
            "b" || rExprValue != "1" || optValue != "=") {
            return 1
        }
        return 0
    }
    return 3
}
