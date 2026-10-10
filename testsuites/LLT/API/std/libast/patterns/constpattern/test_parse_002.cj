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
    let pattern = ConstPattern()
    pattern.litConstExpr = LitConstExpr(quote(1))
    pattern.dump()

    return 0
}

// ASSERT: scan ConstPattern {
// ASSERT: scan -litConstExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
