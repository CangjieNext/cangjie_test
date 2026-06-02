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
    var input: Tokens = quote({=>a}.b)
    let expr = parseExpr(input)
    if (expr is MemberAccess) {
        var b = match (expr as MemberAccess) {
            case Some(v) => v
            case None => throw Exception("Not MemberAccess")
        }
        var lambdaExpr1 = b.baseExpr
        var lambdaExpr = match (lambdaExpr1 as LambdaExpr) {
            case Some(v) => v
            case None => throw Exception("Not LambdaExpr")
        }

        var lBraceValue = lambdaExpr.lBrace.value
        var rBraceValue = lambdaExpr.rBrace.value
        var arrowValue = lambdaExpr.doubleArrow.value

        var nodesArray = lambdaExpr.nodes
        var aValue = ""
        for (i in nodesArray) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            aValue = aValue + value
        }

        if (aValue != "a" || lBraceValue != "{" || rBraceValue != "}" || arrowValue != "=>") {
            return 1
        }

        var dotValue = b.dot.value
        if (dotValue != ".") {
            return 2
        }
        var fileValue = b.field.value
        if (fileValue != "b") {
            return 3
        }
        return 0
    }
    return 3
}
