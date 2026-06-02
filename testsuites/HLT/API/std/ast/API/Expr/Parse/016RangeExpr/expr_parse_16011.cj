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
    //true , a ,b
    var input: Tokens = quote(if (true) {1} else {2}..if (true) {a} else {b}:if (true) {a} else {b})
    let expr = parseExpr(input)
    if (expr is RangeExpr) {
        var b = match (expr as RangeExpr) {
            case Some(v) => v
            case None => throw Exception("Not RangeExpr")
        }
        var startExpr = match (b.start as IfExpr) {
            case Some(v) => v.condition
            case None => throw Exception("Not IfExpr")
        }

        var aValue = match (startExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        var endExpr = match (b.end as IfExpr) {
            case Some(v) => v.ifBlock
            case None => throw Exception("Not IfExpr")
        }

        var blockExpr = match (endExpr as Block) {
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

        var stepExpr = match (b.step as IfExpr) {
            case Some(v) => v.elseExpr
            case None => throw Exception("Not IfExpr")
        }
        var elseblockExpr = match (stepExpr as Block) {
            case Some(v) => v
            case None => throw Exception("Not Block")
        }

        var eValueNodes = elseblockExpr.nodes
        var eValue = ""
        for (i in eValueNodes) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            eValue = eValue + value
        }

        if (aValue != "true" || bValue != "a" || eValue != "b") {
            return 1
        }
        return 0
    }
    return 5
}
