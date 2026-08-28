/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*

main(): Int64 {
    let input = quote(
       VArray<Int64, \$5>({i => i})
    )
    let varray = (parseExpr(input) as VArrayExpr).getOrThrow()
    var varrayArgs = varray.arguments
    if (varrayArgs.size != 1) {
        return 1
    }
    varrayArgs[0].toTokens().dump()
    return 0
}

// ASSERT: scan description: l_curl, token_id: 6, token_literal_value: {
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: i
// ASSERT: scan description: double_arrow, token_id: 46, token_literal_value: =>
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: i
// ASSERT: scan description: newline, token_id: 143, token_literal_value: \\n
// ASSERT: scan description: r_curl, token_id: 7, token_literal_value: }