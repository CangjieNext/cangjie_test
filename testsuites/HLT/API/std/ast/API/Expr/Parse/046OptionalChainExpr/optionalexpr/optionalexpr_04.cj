/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.ast.*

let opTokens = quote(a?{b})
let opExpr = parseExpr(opTokens)
let opExprTra = match (opExpr as TrailingClosureExpr) {
    case Some(v) => v.expr
    case None => throw Exception("Not TrailingClosureExpr")
}
let opExpr2 = match (opExprTra as OptionalExpr) {
    case Some(v) => v.baseExpr
    case None => throw Exception("Not OptionalExpr")
}

main(): Int64 {
    var flag = (opExpr is TrailingClosureExpr) && (opExprTra is OptionalExpr)
    if (!flag) {
        return 1
    }
    let opExprTra2 = match (opExpr as TrailingClosureExpr) {
        case Some(v) => v
        case None => throw Exception("Not TrailingClosureExpr")
    }
    var flag1 = (opExprTra2.expr is OptionalExpr)
    if (!flag) {
        return 2
    }
    var arg = match (opExprTra2.lambdaExpr as LambdaExpr) {
        case Some(v) => v.nodes[0]
        case None => throw Exception("Not LambdaExpr")
    }
    var argValue = match (arg as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (argValue != "b") {
        return 2
    }
    var callName = match (opExprTra2.expr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    var callNameValue = match (callName as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (callNameValue != "a") {
        return 3
    }
    return 0
}
