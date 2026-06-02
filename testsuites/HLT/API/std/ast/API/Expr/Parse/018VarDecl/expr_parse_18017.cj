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
    var input: Tokens = quote(var a = {=>b})
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

        var nodesArray1 = match (b.expr as LambdaExpr) {
            case Some(v) => v.nodes
            case None => throw Exception("Not LambdaExpr")
        }

        var bValue1 = ""
        for (i in nodesArray1) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            bValue1 = bValue1 + value
        }

        if (bValue1 != "b") {
            return 2
        }
        return 0
    }
    return 5
}
