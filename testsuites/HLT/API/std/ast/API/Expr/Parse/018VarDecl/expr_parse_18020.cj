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
    var input: Tokens = quote(var a = [1,2,3,4])
    let expr = parseDecl(input)
    if (expr is VarDecl) {
        var b = match (expr as VarDecl) {
            case Some(v) => v
            case None => throw Exception("Not VarDecl")
        }

        var varValue = b.keyword.value
        var aValue = b.identifier.value

        if (varValue != "var" || aValue != "a") {
            return 1
        }

        var nodesArray = match (b.expr as ArrayLiteral) {
            case Some(v) => v.elements
            case None => throw Exception("Not ArrayLiteral")
        }

        var value = match (nodesArray[1] as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        if (value != "2") {
            return 2
        }
        return 0
    }
    return 5
}
