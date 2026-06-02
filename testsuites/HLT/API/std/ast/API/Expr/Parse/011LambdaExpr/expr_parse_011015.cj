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
    var input: Tokens = quote({a:Int32=>if (true) {a} else {b}})
    let expr = parseExpr(input)
    if (expr is LambdaExpr) {
        var b = match (expr as LambdaExpr) {
            case Some(v) => v
            case None => throw Exception("Not LambdaExpr")
        }
        var lValue = b.lBrace.value
        var rValue = b.rBrace.value
        var dValue = b.doubleArrow.value
        if (lValue != "{" || rValue != "}" || dValue != "=>") {
            return 1
        }

        var funcExpr = match (b.funcParams[0] as FuncParam) {
            case Some(v) => v
            case None => throw Exception("Not FuncParam")
        }

        var aValue = funcExpr.identifier.value
        var conValue = funcExpr.colon.value
        var typeExpr = funcExpr.paramType
        var typeValue = match (typeExpr as PrimitiveType) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not PrimitiveType")
        }
        if (aValue != "a" || conValue != ":" || typeValue != "Int32") {
            return 2
        }

        var nodesArray = b.nodes

        var b0 = match (nodesArray[0] as IfExpr) {
            case Some(v) => v
            case None => throw Exception("Not IfExpr")
        }
        var ifValue = b0.keywordI.value
        var rValue0 = b0.rParen.value
        var lValue0 = b0.lParen.value
        var trueExpr = b0.condition

        var trueValue = match (trueExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        if (rValue0 != ")" || lValue0 != "(" || ifValue != "if" || trueValue != "true") {
            return 3
        }

        var ifblockExpr = b0.ifBlock

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

        var elseValue = b0.keywordE.value
        if (blValue != "{" || brValue != "}" || bValue != "a" || elseValue != "else") {
            return 4
        }

        var elseExpr = b0.elseExpr
        var elseblockExpr = match (elseExpr as Block) {
            case Some(v) => v
            case None => throw Exception("Not Block")
        }

        var elseblValue = elseblockExpr.lBrace.value
        var elsebrValue = elseblockExpr.rBrace.value

        var elsebValueNodes = elseblockExpr.nodes
        var elsebValue = ""
        for (i in elsebValueNodes) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            elsebValue = elsebValue + value
        }

        if (elseblValue != "{" || elsebrValue != "}" || elsebValue != "b") {
            return 5
        }

        return 0
    }
    return 10
}
