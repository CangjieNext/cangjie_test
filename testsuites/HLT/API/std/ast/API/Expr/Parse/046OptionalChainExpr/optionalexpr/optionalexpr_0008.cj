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

let opTokens = quote(a?{b}?{c}?{d})
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
    let flag = (opExpr is TrailingClosureExpr) && (opExprTra is OptionalExpr)
    if (!flag) {
        return 1
    }
    let trailExpr1 = match (opExpr as TrailingClosureExpr) {
        case Some(v) => v
        case None => throw Exception("Not TrailingClosureExpr")
    }
    let flag1 = (trailExpr1.expr is OptionalExpr)
    if (!flag1) {
        return 2
    }
    let field_d = match (trailExpr1.lambdaExpr as LambdaExpr) {
        case Some(v) => v.nodes[0]
        case None => throw Exception("Not LambdaExpr")
    }
    let field_dValue = match (field_d as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (field_dValue.value != "d") {
        return 3
    }
    let trailExpr2 = match (trailExpr1.expr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let trailExpr22 = match (trailExpr2 as TrailingClosureExpr) {
        case Some(v) => v
        case None => throw Exception("Not TrailingClosureExpr")
    }
    let identifier_c = match (trailExpr22.lambdaExpr as LambdaExpr) {
        case Some(v) => v.nodes[0]
        case None => throw Exception("Not LambdaExpr")
    }
    let identifier_cValue = match (identifier_c as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_cValue.value != "c") {
        return 4
    }
    let trailExpr3 = match (trailExpr22.expr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let trailExpr32 = match (trailExpr3 as TrailingClosureExpr) {
        case Some(v) => v
        case None => throw Exception("Not TrailingClosureExpr")
    }
    let identifier_b = match (trailExpr32.lambdaExpr as LambdaExpr) {
        case Some(v) => v.nodes[0]
        case None => throw Exception("Not LambdaExpr")
    }
    let identifier_bValue = match (identifier_b as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_bValue.value != "b") {
        return 5
    }
    let identifier_a = match (trailExpr32.expr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let identifier_aValue = match (identifier_a as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_aValue != "a") {
        return 6
    }
    return 0
}
