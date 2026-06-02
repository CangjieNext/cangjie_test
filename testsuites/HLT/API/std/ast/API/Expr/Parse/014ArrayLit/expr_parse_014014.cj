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
    var input: Tokens = quote([if (true) {a}, if (false) {b} else {c}])
    let expr = parseExpr(input)
    if (expr is ArrayLiteral) {
        var b = match (expr as ArrayLiteral) {
            case Some(v) => v
            case None => throw Exception("Not ArrayLiteral")
        }
        var Expr0 = match (b.elements[0] as IfExpr) {
            case Some(v) => v
            case None => throw Exception("Not IfExpr")
        }

        var lValue = match (Expr0.condition as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        var ifblockExpr = Expr0.ifBlock

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

        if (lValue != "true" || bValue != "a") {
            return 1
        }

        var Expr1 = match (b.elements[1] as IfExpr) {
            case Some(v) => v
            case None => throw Exception("Not IfExpr")
        }

        var elseExpr = Expr1.elseExpr
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

        if (elsebValue != "c") {
            return 2
        }
        return 0
    }
    return 5
}
