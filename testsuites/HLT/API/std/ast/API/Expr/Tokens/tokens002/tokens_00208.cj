/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %use_ast %f -o %output 2>&1 | compare %f

import std.ast.*

main() {
    var tkList = [Token(), Token(TokenKind.IDENTIFIER, "foo"), Token(TokenKind.DOT)]
    var tks = Tokens(tkList)
    tks = tks.concat(Token())
    return 0
}
// ASSERT: scan sema_mismatched_types
