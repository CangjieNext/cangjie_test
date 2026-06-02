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
    var input: Tokens = quote(if (true) {a} else {b}--)
    let expr = parseExpr(input)
    if (expr is IncOrDecExpr) {
        var b = match (expr as IncOrDecExpr) {
            case Some(v) => v
            case None => throw Exception("Not IncOrDecExpr")
        }
        var ifExpr = match (b.expr as IfExpr) {
            case Some(v) => v
            case None => throw Exception("Not IfExpr")
        }
        var tValue = match (ifExpr.condition as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        var ifblockExpr = ifExpr.ifBlock

        var blockExpr = match (ifblockExpr as Block) {
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

        var elseExpr = ifExpr.elseExpr
        var elseblockExpr = match (elseExpr as Block) {
            case Some(v) => v
            case None => throw Exception("Not Block")
        }

        var elsebValueNodes = elseblockExpr.nodes
        var elsebValue = ""
        for (i in elsebValueNodes) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            elsebValue = elsebValue + value
        }

        if (tValue != "true" || bValue != "a" || elsebValue != "b") {
            return 1
        }

        var opValue = b.op.value
        if (opValue != "--") {
            return 2
        }
        return 0
    }
    return 5
}
