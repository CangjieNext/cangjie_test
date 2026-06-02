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

let opTokens = quote(a?[b])
let opExpr = parseExpr(opTokens)
let opExprMem = match (opExpr as SubscriptExpr) {
    case Some(v) => v.baseExpr
    case None => throw Exception("Not SubscriptExpr")
}
let opExpr2 = match (opExprMem as OptionalExpr) {
    case Some(v) => v.baseExpr
    case None => throw Exception("Not OptionalExpr")
}

main(): Int64 {
    var flag = (opExpr is SubscriptExpr) && (opExprMem is OptionalExpr)
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
    let ref_b = match (subscriptExpr1.indexList[0] as RefExpr) {
        case Some(v) => v
        case None => throw Exception("Not RefExpr")
    }
    var identifier_b = ref_b.identifier
    if (identifier_b.value != "b") {
        return 3
    }
    let opt1 = match (subscriptExpr1.baseExpr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let ref_a = match (opt1 as RefExpr) {
        case Some(v) => v
        case None => throw Exception("Not RefExpr")
    }
    var identifier_a = ref_a.identifier
    if (identifier_a.value != "a") {
        return 4
    }
    return 0
}
