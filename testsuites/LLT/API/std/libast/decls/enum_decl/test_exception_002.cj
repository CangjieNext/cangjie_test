// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan description: ellipsis, token_id: 49, token_literal_value: ..., fileID: 1, line: 10, column: 21
// ASSERT: scan ASTException: Illegal TokenKind, TokenKind should be ELLIPSIS

import std.ast.*
import std.collection.*

main() {
    let decl = EnumDecl()
    decl.ellipsis = Token(ELLIPSIS)
    decl.ellipsis.dump()
    println(decl.toTokens())
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
