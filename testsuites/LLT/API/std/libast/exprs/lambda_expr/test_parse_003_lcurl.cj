// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*

main() {
    let input = quote(
        A({ elmtId, isInitialRender =>
                                Column { this.observeComponentCreation() }})
    )
    let expr = parseExpr(input).toTokens()
    expr.dump()
}

/* SCAN
description: identifier, token_id: 137, token_literal_value: A, fileID: 1, line: 8, column: 9
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 8, column: 10
description: l_curl, token_id: 6, token_literal_value: {, fileID: 1, line: 8, column: 11
description: identifier, token_id: 137, token_literal_value: elmtId, fileID: 1, line: 8, column: 13
description: comma, token_id: 1, token_literal_value: ,, fileID: 1, line: 8, column: 19
description: identifier, token_id: 137, token_literal_value: isInitialRender, fileID: 1, line: 8, column: 21
description: double_arrow, token_id: 46, token_literal_value: =>, fileID: 1, line: 8, column: 37
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 8, column: 38
description: identifier, token_id: 137, token_literal_value: Column, fileID: 1, line: 9, column: 33
description: l_curl, token_id: 6, token_literal_value: {, fileID: 1, line: 9, column: 40
description: this, token_id: 96, token_literal_value: this, fileID: 1, line: 9, column: 42
description: dot, token_id: 0, token_literal_value: ., fileID: 1, line: 9, column: 46
description: identifier, token_id: 137, token_literal_value: observeComponentCreation, fileID: 1, line: 9, column: 47
description: l_paren, token_id: 2, token_literal_value: (, fileID: 1, line: 9, column: 71
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 9, column: 72
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 9, column: 73
description: r_curl, token_id: 7, token_literal_value: }, fileID: 1, line: 9, column: 74
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 9, column: 75
description: r_curl, token_id: 7, token_literal_value: }, fileID: 1, line: 9, column: 75
description: r_paren, token_id: 3, token_literal_value: ), fileID: 1, line: 9, column: 76
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
