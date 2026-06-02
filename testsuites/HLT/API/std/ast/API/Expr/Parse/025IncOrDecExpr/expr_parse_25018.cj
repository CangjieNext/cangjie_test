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
    var input: Tokens = quote(while (true) {a}++)
    let expr = parseExpr(input)
    if (expr is IncOrDecExpr) {
        var b = match (expr as IncOrDecExpr) {
            case Some(v) => v
            case None => throw Exception("Not IncOrDecExpr")
        }
        var whileExpr = match (b.expr as WhileExpr) {
            case Some(v) => v
            case None => throw Exception("Not WhileExpr")
        }
        var tValue = match (whileExpr.condition as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        var wblockExpr = whileExpr.block

        var blockExpr = match (wblockExpr as Block) {
            case Some(v) => v
            case None => throw Exception("Not Block")
        }

        var bValueNodes = blockExpr.nodes
        var bValue = ""
        for (i in bValueNodes) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            bValue = bValue + value
        }

        if (tValue != "true" || bValue != "a") {
            return 1
        }

        var opValue = b.op.value
        if (opValue != "++") {
            return 2
        }
        return 0
    }
    return 4
}
