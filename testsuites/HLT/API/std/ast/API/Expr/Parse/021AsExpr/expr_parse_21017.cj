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
    var input: Tokens = quote((while (true) {a}) as Unit)
    let expr = parseExpr(input)
    if (expr is AsExpr) {
        var b = match (expr as AsExpr) {
            case Some(v) => v
            case None => throw Exception("Not AsExpr")
        }
        var aExpr = match (b.expr as ParenExpr) {
            case Some(v) => v.parenthesizedExpr
            case None => throw Exception("Not ParenExpr")
        }
        var b0 = match (aExpr as WhileExpr) {
            case Some(v) => v
            case None => throw Exception("Not WhileExpr")
        }

        var blockExpr = match (b0.block as Block) {
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

        var typeExpr = b.shiftType
        var typeValue = match (typeExpr as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }

        if (bValue != "a" || typeValue != "Unit") {
            return 5
        }
        return 0
    }
    return 3
}
