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

// main() {
//     var input: Tokens = quote(a[..b])
//     let expr = parseExpr(input)
//     if (expr.isSubscriptExpr()) {
//         var b = expr.asSubscriptExpr ()
//         if (b.getBaseExpr().asRefExpr().getIdentifier().value != "a") {
//             return 1
//         }
//         if (b.getIndexExprs()[0].asRangeExpr().getStopExpr().asRefExpr().getIdentifier().value != "b") {
//             return 2
//         }
//         if (b.isTupleAccess()) {
//             return 3
//         }
//         return 0
//     }
//     return 5
// }

main() {
    var input: Tokens = quote(a[..b])
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
        var subscriptIndexRangeExpr = match (subscriptIndexExpr as RangeExpr) {
            case Some(v) => v.end
            case None => throw Exception("Not RangeExpr")
        }
        var subscriptIndexRangeExprValue = match (subscriptIndexRangeExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (subscriptbaseExprValue != "a" || subscriptIndexRangeExprValue != "b") {
            return 1
        }
        return 0
    }
    return 5
}
