/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    let asexpr = AsExpr(quote((a + c) as b))
    match (asexpr.expr as ParenExpr) {
        case Some(v) => v.parenthesizedExpr = ArrayLiteral(quote([d,e]))
        case None => throw Exception("Not ParenExpr")
    }
    let res = asexpr.toTokens().toString()
    if (res.contains("([d, e]) as b")) {
        return 0
    }
    return 1
}
