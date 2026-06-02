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
    var input: Tokens = quote([{ => 123}, {a => b}])
    let expr = parseExpr(input)
    if (expr is ArrayLiteral) {
        var b = match (expr as ArrayLiteral) {
            case Some(v) => v
            case None => throw Exception("Not ArrayLiteral")
        }
        var lamExpr0 = match (b.elements[0] as LambdaExpr) {
            case Some(v) => v
            case None => throw Exception("Not LambdaExpr")
        }

        var nodesArray0 = lamExpr0.nodes
        var bValue0 = ""
        for (i in nodesArray0) {
            var value = match (i as LitConstExpr) {
                case Some(v) => v.literal.value
                case None => throw Exception("Not LitConstExpr")
            }
            bValue0 = bValue0 + value
        }

        if (bValue0 != "123") {
            return 3
        }

        var lamExpr1 = match (b.elements[1] as LambdaExpr) {
            case Some(v) => v
            case None => throw Exception("Not LambdaExpr")
        }

        var nodesArray1 = lamExpr1.nodes
        var bValue1 = ""
        for (i in nodesArray1) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            bValue1 = bValue1 + value
        }

        if (bValue1 != "b") {
            return 3
        }

        return 0
    }
    return 5
}
