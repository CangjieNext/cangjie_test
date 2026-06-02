/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan (a is Int64)) ** b

import std.ast.*

main() {
    let expr = BinaryExpr(quote((a) ** b))
    match (expr.leftExpr as ParenExpr) {
        case Some(v) => v.parenthesizedExpr = MacroExpandExpr(quote(@M (a is Int64)))
        case None => throw Exception("Not ParenExpr")
    }
    let res = expr.toTokens().toString()
    print(res)
    return 0
}
