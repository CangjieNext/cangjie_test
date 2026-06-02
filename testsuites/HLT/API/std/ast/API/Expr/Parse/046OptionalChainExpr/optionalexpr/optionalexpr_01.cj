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

let opTokens = quote(a?.b)
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
    let baseExpr1 = memberAccess1.baseExpr
    var flag1 = (baseExpr1 is OptionalExpr)
    if (!flag1) {
        return 2
    }
    let field = memberAccess1.field
    if (field.value != "b") {
        return 3
    }
    let baseExpr3 = match (baseExpr1 as OptionalExpr) {
        case Some(v) => v
        case None => throw Exception("Not OptionalExpr")
    }
    let ref = match (baseExpr3.baseExpr as RefExpr) {
        case Some(v) => v
        case None => throw Exception("Not RefExpr")
    }
    let identifier1 = ref.identifier
    if (identifier1.value != "a") {
        return 4
    }
    return 0
}
