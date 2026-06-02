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
    var input: Tokens = quote(a.foo(){a => 1})
    let expr = parseExpr(input)
    if (expr is TrailingClosureExpr) {
        var b = match (expr as TrailingClosureExpr) {
            case Some(v) => v
            case None => throw Exception("Not TrailingClosureExpr")
        }
        var callExpr = match (b.expr as CallExpr) {
            case Some(v) => v
            case None => throw Exception("Not CallExpr")
        }
        var memExpr = match (callExpr.callFunc as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }
        var aExpr = memExpr.baseExpr
        var aValue = match (aExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var fooValue = memExpr.field.value
        if (aValue != "a" || fooValue != "foo") {
            return 1
        }

        var aValue1 = b.lambdaExpr.funcParams[0].identifier.value
        var value1 = match (b.lambdaExpr.nodes[0] as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (aValue1 != "a" || value1 != "1") {
            return 2
        }

        return 0
    }
    return 4
}
