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
    let tok_01 = quote('')[0]
    let tok_02 = quote('abc')[0]
    let tok_03 = quote('abc\r\n')[0]
    let tok_04 = quote('"a"')[0]

    tok_01.dump()
    tok_02.dump()
    tok_03.dump()
    tok_04.dump()

    if  (tok_01.kind == SINGLE_QUOTED_STRING_LITERAL && tok_02.kind == SINGLE_QUOTED_STRING_LITERAL
    && tok_03.kind == SINGLE_QUOTED_STRING_LITERAL && tok_04.kind == SINGLE_QUOTED_STRING_LITERAL 
    && tok_01.value == "" && tok_02.value == "abc" && tok_03.value == "abc\\r\\n"
    && tok_04.value == "\"a\"") {
        return 0
    } else {
        return 1
    }
}

// ASSERT: regex description: single_quoted_string_literal, token_id: [0-9]+, token_literal_value: , fileID: 1, line: 16, column: 24
// ASSERT: regex description: single_quoted_string_literal, token_id: [0-9]+, token_literal_value: abc, fileID: 1, line: 17, column: 24
// ASSERT: regex description: single_quoted_string_literal, token_id: [0-9]+, token_literal_value: abc\\r\\n, fileID: 1, line: 18, column: 24
// ASSERT: regex description: single_quoted_string_literal, token_id: [0-9]+, token_literal_value: "a", fileID: 1, line: 19, column: 24

