// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*

main() {
    let input = quote(
        if (let (None, Some(Some(b))) <- value) {
        }
    )
    let expr = (parseExpr(input) as IfExpr).getOrThrow()
    let cond = expr.condition
    cond.toTokens().dump()
    return 0
}

/* SCAN-IN
description: let, token_id: 91, token_literal_value: let, fileID: 1, line: 8, column: 13
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 8, column: 17
description: identifier, token_id: 137, token_literal_value: None, fileID: 1, line: 8, column: 18
description: comma, token_id: 1, token_literal_value: ,, fileID: 1, line: 8, column: 22
description: identifier, token_id: 137, token_literal_value: Some, fileID: 1, line: 8, column: 24
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 8, column: 28
description: identifier, token_id: 137, token_literal_value: Some, fileID: 1, line: 8, column: 29
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 8, column: 33
description: identifier, token_id: 137, token_literal_value: b, fileID: 1, line: 8, column: 34
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 8, column: 35
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 8, column: 36
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 8, column: 37
description: backarrow, token_id: 45, token_literal_value: <-, fileID: 1, line: 8, column: 39
description: identifier, token_id: 137, token_literal_value: value, fileID: 1, line: 8, column: 42
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
