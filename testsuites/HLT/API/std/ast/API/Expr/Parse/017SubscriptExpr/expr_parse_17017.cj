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
    var input: Tokens = quote(a(){=>1}[b(){=>2}])
    let expr = parseExpr(input)
    if (expr is SubscriptExpr) {
        var subscriptExpr = match (expr as SubscriptExpr) {
            case Some(v) => v
            case None => throw Exception("Not SubscriptExpr")
        }
        var subscriptbaseExpr = subscriptExpr.baseExpr
        var subscriptIndexExpr = subscriptExpr.indexList[0]
        var subscriptbaseTrailingClosureExpr = match (subscriptbaseExpr as TrailingClosureExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not TrailingClosureExpr")
        }
        var subscriptbaseTrailingClosureExprCall = match (subscriptbaseTrailingClosureExpr as CallExpr) {
            case Some(v) => v.callFunc
            case None => throw Exception("Not CallExpr")
        }
        var subscriptbaseTrailingClosureExprCallValue = match (subscriptbaseTrailingClosureExprCall as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var subscriptIndexTrailingClosureExpr = match (subscriptIndexExpr as TrailingClosureExpr) {
            case Some(v) => v.lambdaExpr
            case None => throw Exception("Not TrailingClosureExpr")
        }
        var subscriptIndexTrailingClosureExprLamdba = match (subscriptIndexTrailingClosureExpr as LambdaExpr) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var subscriptIndexTrailingClosureExprLamdbaValue = match (subscriptIndexTrailingClosureExprLamdba as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (subscriptbaseTrailingClosureExprCallValue != "a" || subscriptIndexTrailingClosureExprLamdbaValue != "2") {
            return 1
        }
        return 0
    }
    return 5
}
