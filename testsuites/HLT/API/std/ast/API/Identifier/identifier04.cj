/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output 
// RUN-EXEC: %run %run_opt %output %run_args 2>&1| compare %f 
// ASSERT: scan description: var, token_id: 92, token_literal_value: var, fileID: 1, line: 25, column: 33
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: a, fileID: 1, line: 25, column: 37
// ASSERT: scan description: assign, token_id: 30, token_literal_value: =, fileID: 1, line: 25, column: 39
// ASSERT: scan description: l_curl, token_id: 6, token_literal_value: {, fileID: 1, line: 25, column: 41
// ASSERT: scan description: wildcard, token_id: 61, token_literal_value: _, fileID: 1, line: 25, column: 42
// ASSERT: scan description: double_arrow, token_id: 46, token_literal_value: =>, fileID: 1, line: 25, column: 44
// ASSERT: scan description: return, token_id: 108, token_literal_value: return, fileID: 1, line: 25, column: 47
// ASSERT: scan description: integer_literal, token_id: 139, token_literal_value: 1, fileID: 1, line: 25, column: 54
// ASSERT: scan description: r_curl, token_id: 7, token_literal_value: }, fileID: 1, line: 25, column: 55

import std.ast.*

main(): Int64 {
    let assignExprToken = quote(var a = {_ => return 1})
    assignExprToken.dump()
    return 0
}

