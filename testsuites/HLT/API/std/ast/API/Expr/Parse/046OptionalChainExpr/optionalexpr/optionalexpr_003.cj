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

let opTokens = quote(a?.b?(c))
let opExpr = parseExpr(opTokens)
let opExprMem = match (opExpr as CallExpr) {
    case Some(v) => v.callFunc
    case None => throw Exception("Not CallExpr")
}
let opExpr2 = match (opExprMem as OptionalExpr) {
    case Some(v) => v.baseExpr
    case None => throw Exception("Not OptionalExpr")
}

main(): Int64 {
    var flag = (opExpr is CallExpr) && (opExprMem is OptionalExpr)
    if (!flag) {
        return 1
    }
    var callExpr1 = match (opExpr as CallExpr) {
        case Some(v) => v
        case None => throw Exception("Not CallExpr")
    }
    var flag1 = (callExpr1.callFunc is OptionalExpr)
    if (!flag1) {
        return 2
    }
    let argExpr = match (callExpr1.arguments[0] as Argument) {
        case Some(v) => v.expr
        case None => throw Exception("Not Argument")
    }
    var identifier_c = match (argExpr as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (identifier_c != "c") {
        return 3
    }
    let memberAccess2 = match (callExpr1.callFunc as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let memberAccess3 = match (memberAccess2 as MemberAccess) {
        case Some(v) => v
        case None => throw Exception("Not MemberAccess")
    }
    let field1 = memberAccess3.field
    if (field1.value != "b") {
        return 4
    }
    let identifierExpr = match (memberAccess3.baseExpr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let identifierExprValue = match (identifierExpr as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (identifierExprValue.value != "a") {
        return 5
    }
    return 0
}
