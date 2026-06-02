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

let opTokens = quote(a?(b))
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
    var call = match (opExpr as CallExpr) {
        case Some(v) => v
        case None => throw Exception("Not CallExpr")
    }
    var flag1 = (call.callFunc is OptionalExpr)
    if (!flag) {
        return 2
    }
    var arg = match (call.arguments[0] as Argument) {
        case Some(v) => v.expr
        case None => throw Exception("Not Argument")
    }
    var argExpr = match (arg as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (argExpr != "b") {
        return 2
    }
    var callName = match (opExpr2 as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (callName != "a") {
        return 3
    }
    return 0
}
