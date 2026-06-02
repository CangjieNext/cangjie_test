/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ParseASTException
// ASSERT: scan parsing expr error

import std.ast.*

main(): Int64 {
    var input: Tokens = quote({=>a}--)
    let expr = parseExpr(input)
    if (expr is IncOrDecExpr) {
        var b = match (expr as IncOrDecExpr) {
            case Some(v) => v
            case None => throw Exception("Not IncOrDecExpr")
        }
        var lamExpr = match (b.expr as LambdaExpr) {
            case Some(v) => v
            case None => throw Exception("Not LambdaExpr")
        }
        var nodesArray1 = lamExpr.nodes
        var bValue1 = ""
        for (i in nodesArray1) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            bValue1 = bValue1 + value
        }
        if (bValue1 != "a") {
            return 1
        }

        var opValue = b.op.value
        if (opValue != "--") {
            return 2
        }
        return 0
    }
    return 4
}
