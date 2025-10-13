// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f

import std.ast.*

main() {
    var tok: Tokens = Tokens(Token(TokenKind.AT_EXCL))
    tok.dump()
    if (tok.toString() != "@!") {
        return 1
    }
    var tok1 = Token(TokenKind.AT_EXCL, "@!").toTokens()
    tok + tok1
    return 0
}

// ASSERT: regex description: at_exclamation, token_id: [0-9]+, token_literal_value: @!, fileID: 1, line: 8, column: 30

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
