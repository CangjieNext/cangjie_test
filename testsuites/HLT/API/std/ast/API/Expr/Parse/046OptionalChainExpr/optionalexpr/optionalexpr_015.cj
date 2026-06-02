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

let opTokens = quote(a?{b}?(c))
let opExpr = parseExpr(opTokens)
let opExprTra = match (opExpr as CallExpr) {
    case Some(v) => v.callFunc
    case None => throw Exception("Not CallExpr")
}
let opExpr2 = match (opExprTra as OptionalExpr) {
    case Some(v) => v.baseExpr
    case None => throw Exception("Not OptionalExpr")
}

main(): Int64 {
    let flag = (opExpr is CallExpr) && (opExprTra is OptionalExpr)
    if (!flag) {
        return 1
    }
    let callExpr1 = match (opExpr as CallExpr) {
        case Some(v) => v
        case None => throw Exception("Not CallExpr")
    }
    let flag1 = (callExpr1.callFunc is OptionalExpr)
    if (!flag1) {
        return 2
    }
    let field_c = match (callExpr1.arguments[0] as Argument) {
        case Some(v) => v.expr
        case None => throw Exception("Not Argument")
    }
    let field_c2 = match (field_c as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (field_c2.value != "c") {
        return 3
    }
    let trailExpr2 = match (callExpr1.callFunc as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let trailExpr22 = match (trailExpr2 as TrailingClosureExpr) {
        case Some(v) => v
        case None => throw Exception("Not TrailingClosureExpr")
    }
    let identifier_b = match (trailExpr22.lambdaExpr as LambdaExpr) {
        case Some(v) => v.nodes[0]
        case None => throw Exception("Not LambdaExpr")
    }
    let identifier_b2 = match (identifier_b as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_b2.value != "b") {
        return 4
    }
    let identifier_a = match (trailExpr22.expr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let identifier_a2 = match (identifier_a as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_a2 != "a") {
        return 5
    }
    return 0
}
