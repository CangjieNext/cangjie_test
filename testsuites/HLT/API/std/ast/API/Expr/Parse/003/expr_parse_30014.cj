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
    var input: Tokens = quote(-return 1)
    let expr = parseExpr(input)
    if (expr is UnaryExpr) {
        var b = match (expr as UnaryExpr) {
            case Some(v) => v
            case None => throw Exception("Not UnaryExpr")
        }

        var unaryExpr = b.expr
        var optVaule = b.op.value

        var returnExpr = match (unaryExpr as ReturnExpr) {
            case Some(v) => v.expr
            case None => throw Exception("Not ReturnExpr")
        }

        var value = match (returnExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        var keyValue = match (unaryExpr as ReturnExpr) {
            case Some(v) => v.keyword.value
            case None => throw Exception("Not ReturnExpr")
        }

        if (keyValue != "return" || value != "1" || optVaule != "-") {
            return 1
        }
        return 0
    }
    return 3
}
