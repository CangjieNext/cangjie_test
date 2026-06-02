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
    var input: Tokens = quote(foo{=>1})
    let expr = parseExpr(input)
    if (expr is TrailingClosureExpr) {
        var b = match (expr as TrailingClosureExpr) {
            case Some(v) => v
            case None => throw Exception("Not TrailingClosureExpr")
        }
        var expr1 = b.expr
        var refValue = match (expr1 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (refValue != "foo") {
            return 1
        }

        var numExpr = b.lambdaExpr.nodes[0]
        var num = match (numExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        if (num != "1") {
            return 2
        }
        return 0
    }
    return 4
}
