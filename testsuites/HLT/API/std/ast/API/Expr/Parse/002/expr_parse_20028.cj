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
    var input: Tokens = quote(1&&a)
    let expr = parseExpr(input)
    if (expr is BinaryExpr) {
        var binaryExpr = match (expr as BinaryExpr) {
            case Some(v) => v
            case None => throw Exception("Not BinaryExpr")
        }
        var lExpr = binaryExpr.leftExpr
        var rExpr = binaryExpr.rightExpr
        var optExpr = binaryExpr.op.value

        var lval = match (lExpr as LitConstExpr) {
            case Some(v) => v.literal.value
            case None => throw Exception("Not LitConstExpr")
        }

        var rval = match (rExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        if (lval != "1" || rval != "a" || optExpr != "&&") {
            return 1
        }
        return 0
    }
    return 3
}
