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
    var input: Tokens = quote([a,1,b,c])
    let expr = parseExpr(input)
    if (expr is ArrayLiteral) {
        var arrayliteral0 = match (expr as ArrayLiteral) {
            case Some(v) => v.elements[0]
            case None => throw Exception("Not ArrayLiteral")
        }
        var arrayliteral0Value = match (arrayliteral0 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var arrayliteral1 = match (expr as ArrayLiteral) {
            case Some(v) => v.elements[1]
            case None => throw Exception("Not ArrayLiteral")
        }
        var arrayliteral1Value = match (arrayliteral1 as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }
        var arrayliteral2 = match (expr as ArrayLiteral) {
            case Some(v) => v.elements[2]
            case None => throw Exception("Not ArrayLiteral")
        }
        var arrayliteral2Value = match (arrayliteral2 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (arrayliteral0Value != "a" || arrayliteral1Value != "1" || arrayliteral2Value != "b") {
            return 1
        }
        return 0
    }
    return 4
}
