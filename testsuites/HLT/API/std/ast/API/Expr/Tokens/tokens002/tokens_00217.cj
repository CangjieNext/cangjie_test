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
// ASSERT: regex description: identifier, token_id: [0-9]*, token_literal_value: foo, fileID: 1, line: 18, column: 11\ndescription: add, token_id: [0-9]*, token_literal_value: \+, fileID: 1, line: 18, column: 48\ndescription: identifier, token_id: [0-9]*, token_literal_value: bar, fileID: 1, line: 18, column: 71

import std.ast.*

main(): Int64 {
    var tks = Tokens()
    tks = Token(TokenKind.IDENTIFIER, "foo") + Token(TokenKind.ADD) + Token(TokenKind.IDENTIFIER, "bar")
    var itr = tks.iterator()
    while (true) {
        match (itr.next()) {
            case Some(obj) where (itr.seeing(TokenKind.END)) => break
            case Some(obj) => obj.dump()
            case _ => break
        }
    }
    return 0
}

