/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args | compare %f

internal import std.ast.*
internal import std.collection.*

main(): Int64 {
    let quoteExpr = QuoteExpr(quote(quote(a + 1)))
    quoteExpr.exprs[0].dump()
    return 0
}

// ASSERT: scan QuoteToken {
// ASSERT: scan -tokens[0]: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -tokens[1]: Token {
// ASSERT: scan value: "+"
// ASSERT: scan kind: ADD
// ASSERT: scan -tokens[2]: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
