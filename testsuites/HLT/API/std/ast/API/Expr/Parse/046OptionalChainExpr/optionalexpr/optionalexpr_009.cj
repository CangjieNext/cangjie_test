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

let opTokens = quote(a?(b)?.c)
let opExpr = parseExpr(opTokens)
let opExprMem = match (opExpr as MemberAccess) {
    case Some(v) => v.baseExpr
    case None => throw Exception("Not MemberAccess")
}
let opExpr2 = match (opExprMem as OptionalExpr) {
    case Some(v) => v.baseExpr
    case None => throw Exception("Not OptionalExpr")
}

main(): Int64 {
    let flag = (opExpr is MemberAccess) && (opExprMem is OptionalExpr)
    if (!flag) {
        return 1
    }
    let memberAccess1 = match (opExpr as MemberAccess) {
        case Some(v) => v
        case None => throw Exception("Not MemberAccess")
    }
    let flag1 = (memberAccess1.baseExpr is OptionalExpr)
    if (!flag1) {
        return 2
    }
    let field_c = memberAccess1.field
    if (field_c.value != "c") {
        return 3
    }
    let callExpr2 = match (memberAccess1.baseExpr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let callExpr22 = match (callExpr2 as CallExpr) {
        case Some(v) => v
        case None => throw Exception("Not CallExpr")
    }
    let identifier_b = match (callExpr22.arguments[0] as Argument) {
        case Some(v) => v.expr
        case None => throw Exception("Not Argument")
    }
    let identifier_b2 = match (identifier_b as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_b2.value != "b") {
        return 4
    }
    let identifier_a = match (callExpr22.callFunc as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let identifier_aValue = match (identifier_a as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_aValue != "a") {
        return 5
    }
    return 0
}
