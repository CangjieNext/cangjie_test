/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args --no-color  2>&1 | compare %f

import std.ast.*

main(): Int64 {
    let tok = quote(quote(let a = 1 
                    const b = 0))
    let expr = QuoteExpr(tok)
    expr.keyword.dump()
    expr.lParen.dump()
    expr.exprs[0].toTokens().toString() |> println
    expr.rParen.dump()

    if (expr.keyword.value != "quote") {
        return 1
    } else if (expr.exprs.size != 1) {
        return 2
    } else if (expr.lParen.value != "(") {
        return 3
    } else if (expr.rParen.value != ")") {
        return 4
    }
    0
}
// ASSERT: regex description: quote, token_id: [0-9]+, token_literal_value: quote, fileID: 1, line: 16, column: 21
// ASSERT: regex description: l_paren, token_id: [0-9]+, token_literal_value: \(, fileID: 1, line: 16, column: 26
// ASSERT: scan let a = 1
// ASSERT: scan const b = 0
// ASSERT: regex description: r_paren, token_id: [0-9]+, token_literal_value: \), fileID: 1, line: 17, column: 32

