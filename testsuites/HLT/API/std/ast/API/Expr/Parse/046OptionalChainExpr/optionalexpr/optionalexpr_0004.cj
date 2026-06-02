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

let opTokens = quote(a?.b.c?[d])
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
    var flag = (opExpr is SubscriptExpr) && (opExprTra is OptionalExpr)
    if (!flag) {
        return 1
    }
    let subscriptExpr1 = match (opExpr as SubscriptExpr) {
        case Some(v) => v
        case None => throw Exception("Not SubscriptExpr")
    }
    var flag1 = (subscriptExpr1.baseExpr is OptionalExpr)
    if (!flag1) {
        return 2
    }
    let field1 = match (subscriptExpr1.indexList[0] as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (field1.value != "d") {
        return 3
    }
    let memberAccess2 = match (subscriptExpr1.baseExpr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let memberAccess2Expr = match (memberAccess2 as MemberAccess) {
        case Some(v) => v
        case None => throw Exception("Not MemberAccess")
    }
    let field2 = memberAccess2Expr.field
    if (field2.value != "c") {
        return 4
    }
    let memberAccess3 = match (memberAccess2Expr.baseExpr as MemberAccess) {
        case Some(v) => v
        case None => throw Exception("Not MemberAccess")
    }
    let field3 = memberAccess3.field
    if (field3.value != "b") {
        return 5
    }
    let ref = match (memberAccess3.baseExpr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let refValue = match (ref as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (refValue != "a") {
        return 6
    }
    return 0
}
