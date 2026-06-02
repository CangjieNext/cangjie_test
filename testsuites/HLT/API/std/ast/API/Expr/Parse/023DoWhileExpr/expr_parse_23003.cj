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

main(): Int64 {
    var input: Tokens = quote(do {a} while (true))
    let expr = parseExpr(input)
    var doWhileExpr = match (expr as DoWhileExpr) {
        case Some(v) => v
        case None => throw Exception("Not DoWhileExpr")
    }
    var condExpr = doWhileExpr.condition
    var bodyExpr = doWhileExpr.block
    var condExprValue = match (condExpr as LitConstExpr) {
        case Some(v) => v.literal.value
        case None => throw Exception("Not LitConstExpr")
    }
    var bodyExprblock = match (bodyExpr as Block) {
        case Some(v) => v.nodes[0]
        case None => throw Exception("Not Block")
    }
    var bodyExprblockValue = match (bodyExprblock as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (condExprValue != "true" || bodyExprblockValue != "a") {
        return 1
    }
    return 0
}
