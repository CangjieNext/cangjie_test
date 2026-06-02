/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex description: illegal, token_id: [0-9]*, token_literal_value: , fileID: 0, line: 0, column: 0

import std.ast.*

main() {
    var tk = Token()
    tk.dump()
    if (tk.kind != TokenKind.ILLEGAL) {
        return 1
    }
    return 0
}
