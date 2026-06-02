/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %enable_macro %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    var input: Tokens = quote((if (a){b}))
    let expr = parseExpr(input)
    if (expr is ParenExpr) {
        var b = match (expr as ParenExpr) {
            case Some(v) => v
            case None => throw Exception("Not ParenExpr")
        }
        var parenExpr = b.parenthesizedExpr
        var rExpr = b.rParen.value
        var lExpr = b.lParen.value

        var ifExpr = match (parenExpr as IfExpr) {
            case Some(v) => v
            case None => throw Exception("Not IfExpr")
        }

        var ifValue = ifExpr.keywordI.value
        var rValue = ifExpr.rParen.value
        var lValue = ifExpr.lParen.value

        var conExpr = ifExpr.condition
        var conValue = match (conExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        var blockExpr1 = ifExpr.ifBlock

        var blockExpr = match (blockExpr1 as Block) {
            case Some(v) => v
            case None => throw Exception("Not Block")
        }

        var blValue = blockExpr.lBrace.value
        var brValue = blockExpr.rBrace.value
        var bValueNodes = blockExpr.nodes
        var bValue = ""
        for (i in bValueNodes) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            bValue = bValue + value
        }

        if (rExpr != ")" || lExpr != "(" || ifValue != "if" || rValue != ")" || lValue != "(" || conValue != "a") {
            return 1
        }

        if (blValue != "{" || brValue != "}" || bValue != "b") {
            return 2
        }
        return 0
    }
    return 3
}
