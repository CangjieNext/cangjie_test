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

let opTokens = quote(a?.b?{c})
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
    let trailExpr1 = match (opExpr as TrailingClosureExpr) {
        case Some(v) => v
        case None => throw Exception("Not TrailingClosureExpr")
    }
    var flag1 = (trailExpr1.expr is OptionalExpr)
    if (!flag1) {
        return 2
    }
    let arg = match (trailExpr1.lambdaExpr as LambdaExpr) {
        case Some(v) => v.nodes[0]
        case None => throw Exception("Not LambdaExpr")
    }
    var identifier_c = match (arg as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_c != "c") {
        return 3
    }
    let memberAccess2 = match (trailExpr1.expr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let memberAccess3 = match (memberAccess2 as MemberAccess) {
        case Some(v) => v
        case None => throw Exception("Not MemberAccess")
    }
    let field1 = memberAccess3.field.value
    if (field1 != "b") {
        return 4
    }
    let identifier = match (memberAccess3.baseExpr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let identifierValue = match (identifier as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (identifierValue.value != "a") {
        return 5
    }
    return 0
}
