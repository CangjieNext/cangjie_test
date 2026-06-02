/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var input: Tokens = quote(a?.b=c)
    let expr = parseExpr(input)
    let expr2 = match (expr as AssignExpr) {
        case Some(v) => v.leftExpr
        case None => throw Exception("Not AssignExpr")
    }
    let expr3 = match (expr2 as MemberAccess) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not MemberAccess")
    }
    if (!(expr3 is OptionalExpr)) {
        return 1
    }
    var b = match (expr3 as OptionalExpr) {
        case Some(v) => v.baseExpr
        case None => throw Exception("Not OptionalExpr")
    }
    var b2 = match (b as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (b2 != "a") {
        return 2
    }
    var expr4 = match (expr as AssignExpr) {
        case Some(v) => v.rightExpr
        case None => throw Exception("Not AssignExpr")
    }
    var expr4Value = match (expr4 as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (expr4Value != "c") {
        return 3
    }
    return 0
}
