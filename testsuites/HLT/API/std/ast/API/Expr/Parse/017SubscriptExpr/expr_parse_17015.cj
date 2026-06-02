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
    var input: Tokens = quote(if (true) {a} else {b}[if (true) {a} else {b}])
    let expr = parseExpr(input)
    if (expr is SubscriptExpr) {
        var subscriptExpr = match (expr as SubscriptExpr) {
            case Some(v) => v
            case None => throw Exception("Not SubscriptExpr")
        }
        var subscriptbaseExpr = subscriptExpr.baseExpr
        var subscriptIndexExpr = subscriptExpr.indexList[0]
        var subscriptbaseIf = match (subscriptbaseExpr as IfExpr) {
            case Some(v) => v.ifBlock
            case None => throw Exception("Not IfExpr")
        }
        var subscriptbaseIfExpr = match (subscriptbaseIf as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var subscriptbaseIfExprValue = match (subscriptbaseIfExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var subscriptIndexelse = match (subscriptIndexExpr as IfExpr) {
            case Some(v) => v.elseExpr
            case None => throw Exception("Not IfExpr")
        }
        var subscriptIndexelseExpr = match (subscriptIndexelse as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var subscriptIndexelseExprValue = match (subscriptIndexelseExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (subscriptbaseIfExprValue != "a" || subscriptIndexelseExprValue != "b") {
            return 1
        }
        return 0
    }
    return 5
}
