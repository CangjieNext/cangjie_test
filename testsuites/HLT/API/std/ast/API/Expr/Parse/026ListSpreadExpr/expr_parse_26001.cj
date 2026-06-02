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

main(): Int64 {
    var input: Tokens = quote([list])
    let expr = parseExpr(input)
    var arrayliteral = match (expr as ArrayLiteral) {
        case Some(v) => v.elements[0]
        case None => throw Exception("Not ArrayLiteral")
    }
    var arrayliteralValue = match (arrayliteral as RefExpr) {
        case Some(v) => v.identifier.value
        case None => throw Exception("Not RefExpr")
    }
    if (arrayliteralValue != "list") {
        return 1
    }
    return 0
}
