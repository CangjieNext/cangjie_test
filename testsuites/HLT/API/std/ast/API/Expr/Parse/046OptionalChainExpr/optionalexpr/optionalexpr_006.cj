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

let opTokens = quote(a?[b]?[c])
let opExpr = parseExpr(opTokens)
let opExprTra = match (opExpr as SubscriptExpr) {
    case Some(v) => v.baseExpr
    case None => throw Exception("Not SubscriptExpr")
}
let opExpr2 = match (opExprTra as OptionalExpr) {
    case Some(v) => v.baseExpr
    case None => throw Exception("Not OptionalExpr")
}

main(): Int64 {
    let flag = (opExpr is SubscriptExpr) && (opExprTra is OptionalExpr)
    if (!flag) {
        return 1
    }
    let subscriptExpr1 = match (opExpr as SubscriptExpr) {
        case Some(v) => v
        case None => throw Exception("Not SubscriptExpr")
    }
    let flag1 = (subscriptExpr1.baseExpr is OptionalExpr)
    if (!flag1) {
        return 2
    }
    let identifier_c = match (subscriptExpr1.indexList[0] as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_c.value != "c") {
        return 3
    }
    let subscriptExpr2 = match (subscriptExpr1.baseExpr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let subscriptExpr2Expr = match (subscriptExpr2 as SubscriptExpr) {
        case Some(v) => v
        case None => throw Exception("Not SubscriptExpr")
    }
    let identifier_b = match (subscriptExpr2Expr.indexList[0] as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_b.value != "b") {
        return 4
    }
    let ref_a = match (subscriptExpr2Expr.baseExpr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let ref_aValue = match (ref_a as RefExpr) {
        case Some(v) => v
        case None => throw Exception("Not RefExpr")
    }
    var identifier_a = ref_aValue.identifier
    if (identifier_a.value != "a") {
        return 5
    }
    return 0
}
