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
    let tok_01 = cangjieLex("''")[0]
    let tok_02 = cangjieLex("'abc'")[0]
    let tok_03 = cangjieLex("'仓颉\\n'")[0]

    tok_01.dump()
    tok_02.dump()
    tok_03.dump()
    if  (tok_01.kind == SINGLE_QUOTED_STRING_LITERAL && tok_02.kind == SINGLE_QUOTED_STRING_LITERAL
    && tok_03.kind == SINGLE_QUOTED_STRING_LITERAL && tok_01.value == ""
    && tok_02.value == "abc" && tok_03.value == "仓颉\\n") {
        return 0
    } else {
        return 1
    }
}

// ASSERT: regex description: single_quoted_string_literal, token_id: [0-9]+, token_literal_value: , fileID: 0, line: 1, column: 1
// ASSERT: regex description: single_quoted_string_literal, token_id: [0-9]+, token_literal_value: abc, fileID: 0, line: 1, column: 1
// ASSERT: regex description: single_quoted_string_literal, token_id: [0-9]+, token_literal_value: 仓颉\\n, fileID: 0, line: 1, column: 1