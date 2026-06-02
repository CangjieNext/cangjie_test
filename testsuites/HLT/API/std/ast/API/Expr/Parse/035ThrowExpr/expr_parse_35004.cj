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
    var input: Tokens = quote(
         throw a is B
    )
    let expr = parseExpr(input)
    if (expr is ThrowExpr) {
        var throwExpr = match (expr as ThrowExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ThrowExpr")
        }
        var throwExprIs = match (throwExpr as IsExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not IsExpr")
        }
        var throwExprIsValue = match (throwExprIs as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (throwExprIsValue != "a") {
            return 1
        }
        return 0
    }
    return 1
}
