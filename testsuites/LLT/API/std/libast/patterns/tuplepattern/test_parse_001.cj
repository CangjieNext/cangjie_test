/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(): Int64 {
    let pattern = TuplePattern(quote(("Bob", age)))
    pattern.dump()

    if (pattern.lParen.kind == ILLEGAL) {
        return 1
    }

    if (pattern.rParen.kind == ILLEGAL) {
        return 2
    }

    return 0
}

// ASSERT: scan TuplePattern {
// ASSERT: scan -patterns: 0, ConstPattern {
// ASSERT: scan -litConstExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "Bob"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -patterns: 1, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "age"
// ASSERT: scan kind: IDENTIFIER
