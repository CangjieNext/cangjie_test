// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC-PIPE-1: : %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan Illegal TokenKind, TokenKind should be COMMA

import std.ast.*

main() {
    let expr = RefExpr(quote(a))
    let tokens = expr.toTokens()
    expr.commas = Tokens(Array(2, repeat: Token(DOT)))
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
