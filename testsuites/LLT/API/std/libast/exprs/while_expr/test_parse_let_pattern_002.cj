// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main(): Int64 {
    let input = quote(
        while (let Some(v) <- a || true) {
            return v
        }
    )
    let whileExpr = (parseExpr(input) as WhileExpr).getOrThrow()
    let cond = whileExpr.condition
    cond.toTokens().dump()
    return 0
}
/* SCAN-IN
description: let, token_id: 91, token_literal_value: let, fileID: 1, line: 8, column: 16
description: identifier, token_id: 137, token_literal_value: Some, fileID: 1, line: 8, column: 20
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 8, column: 24
description: identifier, token_id: 137, token_literal_value: v, fileID: 1, line: 8, column: 25
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 8, column: 26
description: backarrow, token_id: 45, token_literal_value: <-, fileID: 1, line: 8, column: 28
description: identifier, token_id: 137, token_literal_value: a, fileID: 1, line: 8, column: 31
description: or, token_id: 17, token_literal_value: ||, fileID: 1, line: 8, column: 33
description: bool_literal, token_id: 151, token_literal_value: true, fileID: 1, line: 8, column: 36
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
