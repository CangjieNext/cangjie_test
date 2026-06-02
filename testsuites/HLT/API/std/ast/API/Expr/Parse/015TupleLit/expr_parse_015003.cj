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
    var input: Tokens = quote((a,b,c))
    let expr = parseExpr(input)
    if (expr is TupleLiteral) {
        var tupleLit = match (expr as TupleLiteral) {
            case Some(v) => v
            case None => throw Exception("Not TupleLiteral")
        }
        var tupleLit0 = tupleLit.elements[0]
        var tupleLit1 = tupleLit.elements[1]
        var tupleLit2 = tupleLit.elements[2]
        var tupleLit0Value = match (tupleLit0 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var tupleLit1Value = match (tupleLit1 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var tupleLit2Value = match (tupleLit2 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (tupleLit0Value != "a" || tupleLit1Value != "b" || tupleLit2Value != "c") {
            return 1
        }
        return 0
    }
    return 4
}
