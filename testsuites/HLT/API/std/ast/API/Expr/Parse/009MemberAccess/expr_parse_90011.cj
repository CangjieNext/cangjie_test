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
    var input: Tokens = quote(foo(1){=>a}.b)
    let expr = parseExpr(input)
    if (expr is MemberAccess) {
        var b = match (expr as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }

        var tcExpr = match (b.baseExpr as TrailingClosureExpr) {
            case Some(v) => v
            case None => throw Exception("Not TrailingClosureExpr")
        }

        var callExpr = match (tcExpr.expr as CallExpr) {
            case Some(v) => v
            case None => throw Exception("Not CallExpr")
        }

        var callExpr1 = callExpr.callFunc
        var lValue = callExpr.lParen.value
        var rValue = callExpr.rParen.value
        var argArray = callExpr.arguments

        var baseValue = match (callExpr1 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        var aValue = ""
        for (i in argArray) {
            var value = match (i.expr as LitConstExpr) {
                case Some(v) => v.literal.value
                case None => throw Exception("Not LitConstExpr")
            }
            aValue = aValue + value
        }

        if (baseValue != "foo" || lValue != "(" || rValue != ")" || aValue != "1") {
            return 1
        }

        var lambdaExpr1 = tcExpr.lambdaExpr

        var lambdaExpr = match (lambdaExpr1 as LambdaExpr) {
            case Some(v) => v
            case None => throw Exception("Not LambdaExpr")
        }

        var lBraceValue = lambdaExpr.lBrace.value
        var rBraceValue = lambdaExpr.rBrace.value
        var arrowValue = lambdaExpr.doubleArrow.value

        var nodesArray = lambdaExpr.nodes
        var aValue1 = ""
        for (i in nodesArray) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            aValue1 = aValue1 + value
        }

        if (aValue1 != "a" || lBraceValue != "{" || rBraceValue != "}" || arrowValue != "=>") {
            return 2
        }

        var dotValue = b.dot.value
        if (dotValue != ".") {
            return 3
        }
        var fileValue = b.field.value
        if (fileValue != "b") {
            return 4
        }
        return 0
    }
    return 4
}
