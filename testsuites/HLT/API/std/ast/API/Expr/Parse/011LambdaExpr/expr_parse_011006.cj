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
    var input: Tokens = quote({=>b})
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

        var nodesArray = b.nodes
        var bValue = ""
        for (i in nodesArray) {
            var value = match (i as RefExpr) {
                case Some(v) => v.identifier.value
                case None => throw Exception("Not RefExpr")
            }
            bValue = bValue + value
        }
        if (bValue != "b") {
            return 3
        }
    }
    return 0
}
