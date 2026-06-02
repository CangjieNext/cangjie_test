/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(){
    let tok_01 = Token(STRING_LITERAL)
    let tok_02 = Token(STRING_LITERAL, "abc仓颉")
    let tok_03 = Token(STRING_LITERAL, "aa\n")

    tok_01.dump()
    tok_02.dump()
    tok_03.dump()
    if  (tok_01.kind == STRING_LITERAL && tok_02.kind == STRING_LITERAL
    && tok_03.kind == STRING_LITERAL && tok_01.value == ""
    && tok_02.value == "abc仓颉" && tok_03.value == "aa\n") {
        return 0
    } else {
        return 1
    }
}

// ASSERT: regex description: double_quoted_string_literal, token_id: [0-9]+, token_literal_value: , fileID: 1, line: 16, column: 18
// ASSERT: regex description: double_quoted_string_literal, token_id: [0-9]+, token_literal_value: abc仓颉, fileID: 1, line: 17, column: 18
// ASSERT: regex description: double_quoted_string_literal, token_id: [0-9]+, token_literal_value: aa

