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
    var input: Tokens = quote((a))
    let expr = parseExpr(input)
    if (expr is ParenExpr) {
        var b = match (expr as ParenExpr) {
            case Some(v) => v
            case None => throw Exception("Not ParenExpr")
        }
        var parenExpr = b.parenthesizedExpr
        var rExpr = b.rParen.value
        var lExpr = b.lParen.value

        var value = match (parenExpr as RefExpr) {
            case Some(v) => v.identifier.value
            case None => throw Exception("Not RefExpr")
        }

        if (value != "a" || rExpr != ")" || lExpr != "(") {
            return 1
        }
        return 0
    }
    return 3
}
