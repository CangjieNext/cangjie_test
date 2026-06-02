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
    var input: Tokens = quote((1,2,3))
    let expr = parseExpr(input)
    var tupleLit = match (expr as TupleLiteral) {
        case Some(v) => v
        case None => throw Exception("Not TupleLiteral")
    }
    var tupleLit0 = tupleLit.elements[0]
    var tupleLit1 = tupleLit.elements[1]
    var tupleLit2 = tupleLit.elements[2]
    var tupleLit0Value = match (tupleLit0 as LitConstExpr) {
        case Some(v) => v.literal.value
        case None => throw Exception("Not LitConstExpr")
    }
    var tupleLit1Value = match (tupleLit1 as LitConstExpr) {
        case Some(v) => v.literal.value
        case None => throw Exception("Not LitConstExpr")
    }
    var tupleLit2Value = match (tupleLit2 as LitConstExpr) {
        case Some(v) => v.literal.value
        case None => throw Exception("Not LitConstExpr")
    }
    if (tupleLit0Value != "1" || tupleLit1Value != "2" || tupleLit2Value != "3") {
        return 1
    }
    return 0
}
