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
    var input: Tokens = quote(return return a)
    let expr = parseExpr(input)
    if (expr is ReturnExpr) {
        var returnExpr = match (expr as ReturnExpr) {
            case Some(v) => v
            case None => throw Exception("Not ReturnExpr")
        }
        var rExpr = returnExpr.expr
        var keyWordExpr = returnExpr.keyword.value
        var returnExpr2 = match (rExpr as ReturnExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ReturnExpr")
        }
        var keyWordExpr2 = match (rExpr as ReturnExpr) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not ReturnExpr")
        }
        var returnExpr2Value = match (returnExpr2 as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }
        if (keyWordExpr != "return" || keyWordExpr2 != "return" || returnExpr2Value != "a") {
            return 1
        }
        return 0
    }
    return 3
}
