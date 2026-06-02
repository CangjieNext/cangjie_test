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
    var input: Tokens = quote(a?[b]=1)
    let expr = parseExpr(input)
    let expr2 = match (expr as AssignExpr) {
        case Some(v) => v.leftExpr
        case None => throw Exception("Not AssignExpr")
    }
    let expr3 = match (expr2 as SubscriptExpr) {
        case Some(v) => v
        case None => throw Exception("Not SubscriptExpr")
    }
    if ((expr is AssignExpr) && (expr3.baseExpr is OptionalExpr)) {
        var bExpr = match (expr3.indexList[0] as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (bExpr != "b") {
            return 1
        }
        let expr4 = match (expr as AssignExpr) {
            case Some(v) => v.rightExpr
            case None => throw Exception("Not AssignExpr")
        }
        let expr4Expr = match (expr4 as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (expr4Expr != "1") {
            return 2
        }
        return 0
    }
    return 3
}
