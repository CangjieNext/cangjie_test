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
    var input: Tokens = quote(if(true){a}else if(false){b})
    let expr = parseExpr(input)
    if (expr is IfExpr) {
        var b = match (expr as IfExpr) {
            case Some(v) => v
            case None => throw Exception("Not IfExpr")
        }
        var ifValue = b.keywordI.value
        var rValue = b.rParen.value
        var lValue = b.lParen.value
        var trueExpr = b.condition

        var trueValue = match (trueExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        var ifblockExpr = b.ifBlock

        var blockExpr = match (ifblockExpr as Block) {
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
        if (rValue != ")" || lValue != "(" || ifValue != "if" || trueValue != "true") {
            return 1
        }
        var elseValue = b.keywordE.value
        if (blValue != "{" || brValue != "}" || bValue != "a" || elseValue != "else") {
            return 2
        }

        var elseExpr = b.elseExpr
        var b1 = match (elseExpr as IfExpr) {
            case Some(v) => v
            case None => throw Exception("Not IfExpr")
        }
        var ifValue1 = b1.keywordI.value
        var rValue1 = b1.rParen.value
        var lValue1 = b1.lParen.value
        var falseExpr = b1.condition

        var falseValue = match (falseExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        var elseblock = b1.ifBlock

        var elseblockExpr1 = match (elseblock as Block) {
            case Some(v) => v
            case None => throw Exception("Not Block")
        }

        var blValue1 = elseblockExpr1.lBrace.value
        var brValue1 = elseblockExpr1.rBrace.value
        var bValueNodes1 = elseblockExpr1.nodes
        var bValue1 = ""
        for (i in bValueNodes1) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            bValue1 = bValue1 + value
        }
        if (rValue1 != ")" || lValue1 != "(" || ifValue1 != "if" || falseValue != "false") {
            return 3
        }

        print(bValue1)
        if (blValue1 != "{" || brValue1 != "}" || bValue1 != "b") {
            return 4
        }
    }
    return 0
}
