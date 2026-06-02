/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var input: Tokens = quote(a().b())
    let expr = parseExpr(input)
    if (expr is CallExpr) {
        var b = match (expr as CallExpr) {
            case Some(v) => v
            case None => throw Exception("Not CallExpr")
        }
        var callFuncExpr = b.callFunc

        var callrValue1 = b.rParen.value
        var calllValue1 = b.lParen.value

        var memberAccessExpr = match (callFuncExpr as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }

        var baseExpr1 = memberAccessExpr.baseExpr

        var callExpr1 = match (baseExpr1 as CallExpr) {
            case Some(v) => v
            case None => throw Exception("Not CallExpr")
        }
        var callrValue = callExpr1.rParen.value
        var calllValue = callExpr1.lParen.value

        var callFieldFuncExpr = callExpr1.callFunc

        var callFieldValue = match (callFieldFuncExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var dotValue = memberAccessExpr.dot.value
        var fieldValue = memberAccessExpr.field.value

        if (dotValue != "." || callFieldValue != "a" || callrValue != ")" || calllValue != "(") {
            return 1
        }

        if (fieldValue != "b" || callrValue1 != ")" || calllValue1 != "(") {
            return 2
        }
        return 0
    }
    return 3
}
