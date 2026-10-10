/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(): Int64 {
    let tokens = quote(Int64 String SomeType)
    let (a, b) = parseTypeFragment(tokens, startFrom: 0)
    a.dump()
    println(b)
    let (c, d) = parseTypeFragment(tokens, startFrom: b)
    c.dump()
    println(d)
    let (e, f) = parseTypeFragment(tokens, startFrom: d)
    e.dump()
    println(f)
    return 0;
}

// ASSERT: scan PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan 1
// ASSERT: scan RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "String"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan 2
// ASSERT: scan RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "SomeType"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan 3