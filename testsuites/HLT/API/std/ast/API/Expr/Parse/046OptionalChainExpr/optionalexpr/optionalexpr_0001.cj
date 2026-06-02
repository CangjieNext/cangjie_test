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

let opTokens = quote(a?.b?.c?.d)
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
    var flag = (opExpr is MemberAccess) && (opExprMem is OptionalExpr)
    if (!flag) {
        return 1
    }
    let memberAccess1 = match (opExpr as MemberAccess) {
        case Some(v) => v
        case None => throw Exception("Not MemberAccess")
    }
    var flag1 = (memberAccess1.baseExpr is OptionalExpr)
    if (!flag1) {
        return 2
    }
    let field1 = memberAccess1.field
    if (field1.value != "d") {
        return 3
    }
    let memberAccess2 = match (memberAccess1.baseExpr as OptionalExpr) {
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
    let memberAccess3 = match (memberAccess2Expr.baseExpr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let memberAccess3Expr = match (memberAccess3 as MemberAccess) {
        case Some(v) => v
        case None => throw Exception("Not MemberAccess")
    }
    let field3 = memberAccess3Expr.field
    if (field3.value != "b") {
        return 5
    }
    let identifierExpr = match (memberAccess3Expr.baseExpr as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    let identifierExprValue = match (identifierExpr as RefExpr) {
        case Some(v) => v.identifier
        case None => throw Exception("Not RefExpr")
    }
    if (identifierExprValue.value != "a") {
        return 6
    }
    return 0
}
