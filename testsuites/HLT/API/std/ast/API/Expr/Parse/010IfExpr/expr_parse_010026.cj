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
    var input: Tokens = quote(
        if (false) {
             arr[0]
        } else {
             arr[index]
        }
    )
    let expr = parseExpr(input)
    if (expr is IfExpr) {
        var ifExpr = match (expr as IfExpr) {
            case Some(v) => v
            case None => throw Exception("Not Exception")
        }
        var condExpr = ifExpr.condition
        var ifBody = ifExpr.ifBlock
        var elseBody = ifExpr.elseExpr
        var condExprValue = match (condExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var ifBodyExpr = match (ifBody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var ifBodySubscriptExpr = match (ifBodyExpr as SubscriptExpr) {
            case Some(v) => v.baseExpr
            case None => throw Exception("Not SubscriptExpr")
        }
        var ifBodySubscriptExprValue = match (ifBodySubscriptExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var elseBodyExpr = match (elseBody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var elseBodySubscriptExpr = match (elseBodyExpr as SubscriptExpr) {
            case Some(v) => v.indexList[0]
            case None => throw Exception("Not SubscriptExpr")
        }
        var elseBodySubscriptExprValue = match (elseBodySubscriptExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (condExprValue != "false" || ifBodySubscriptExprValue != "arr" || elseBodySubscriptExprValue != "index") {
            return 1
        }
        return 0
    }
    return 4
}
