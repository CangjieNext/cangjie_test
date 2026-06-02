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
    var input: Tokens = quote(a[b])
    let expr = parseExpr(input)
    if (expr is SubscriptExpr) {
        var subscriptExpr = match (expr as SubscriptExpr) {
            case Some(v) => v
            case None => throw Exception("Not SubscriptExpr")
        }
        var subscriptbaseExpr = subscriptExpr.baseExpr
        var subscriptIndexExpr = subscriptExpr.indexList[0]
        var subscriptbaseExprValue = match (subscriptbaseExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var subscriptIndexExprValue = match (subscriptIndexExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (subscriptbaseExprValue != "a" || subscriptIndexExprValue != "b") {
            return 1
        }
        return 0
    }
    return 5
}
