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
    var input: Tokens = quote((if (true) {a}, if (false) {b} else {c}))
    let expr = parseExpr(input)
    if (expr is TupleLiteral) {
        var tupleLit = match (expr as TupleLiteral) {
            case Some(v) => v
            case None => throw Exception("Not TupleLiteral")
        }
        var tupleLit0 = tupleLit.elements[0]
        var tupleLit1 = tupleLit.elements[1]
        var tupleLit0conditionExpr = match (tupleLit0 as IfExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not IfExpr")
        }
        var tupleLit0conditionExprValue = match (tupleLit0conditionExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var tupleLit0ifBody = match (tupleLit0 as IfExpr) {
            case Some(v) => v.ifBlock
            case None => throw Exception("Not IfExpr")
        }
        var tupleLit0ifBodyExpr = match (tupleLit0ifBody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var tupleLit0ifBodyExprValue = match (tupleLit0ifBodyExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var tupleLit1elseBody = match (tupleLit1 as IfExpr) {
            case Some(v) => v.elseExpr
            case None => throw Exception("Not IfExpr")
        }
        var tupleLit1elseBodyExpr = match (tupleLit1elseBody as Block) {
            case Some(v) => v.nodes[0]
            case None => throw Exception("Not Block")
        }
        var tupleLit1elseBodyExprValue = match (tupleLit1elseBodyExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (tupleLit0conditionExprValue != "true" || tupleLit0ifBodyExprValue != "a" || tupleLit1elseBodyExprValue != "c") {
            return 1
        }
        return 0
    }
    return 5
}
