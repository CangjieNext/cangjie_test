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
    var input: Tokens = quote(if(true){a}else{b}.b)
    let expr = parseExpr(input)
    if (expr is MemberAccess) {
        var b1 = match (expr as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }

        var memExpr = b1.baseExpr
        var b = match (memExpr as IfExpr) {
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

        var dotValue = b1.dot.value
        if (dotValue != ".") {
            return 2
        }
        var fileValue = b1.field.value
        if (fileValue != "b") {
            return 3
        }
        return 0
    }
    return 3
}
