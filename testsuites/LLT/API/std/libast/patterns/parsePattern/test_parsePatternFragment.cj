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
    let tokens = quote(Year(n) RED _)
    let (a, b) = parsePatternFragment(tokens, startFrom: 0)
    a.dump()
    println(b)
    let (c, d) = parsePatternFragment(tokens, startFrom: b)
    c.dump()
    println(d)
    let (e, f) = parsePatternFragment(tokens, startFrom: d)
    e.dump()
    println(f)
    return 0;
}

// ASSERT: scan EnumPattern {
// ASSERT: scan -constructor: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Year"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -patterns: 0, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "n"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan 4
// ASSERT: scan VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "RED"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan 5
// ASSERT: scan WildcardPattern {
// ASSERT: scan -wildcard: Token {
// ASSERT: scan value: "_"
// ASSERT: scan kind: WILDCARD
// ASSERT: scan 6