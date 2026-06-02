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

let opTokens = quote(a?[b]?(c))
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
    let identifier_c = match (callExpr1.arguments[0] as Argument) {
        case Some(v) => v.expr
        case None => throw Exception("Not Argument")
    }
    let identifier_c2 = match (identifier_c as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_c2.value != "c") {
        return 3
    }
    let subscriptExpr2 = match (callExpr1.callFunc as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let subscriptExpr22 = match (subscriptExpr2 as SubscriptExpr) {
        case Some(v) => v
        case None => throw Exception("Not SubscriptExpr")
    }
    let identifier_b = match (subscriptExpr22.indexList[0] as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_b.value != "b") {
        return 4
    }
    let ref_a = match (subscriptExpr22.baseExpr as OptionalExpr) {
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
