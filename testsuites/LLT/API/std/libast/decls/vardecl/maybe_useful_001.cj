/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*

main(): Int64 {
    let opTokens = quote(
        const (a,b) = (1, 2)
    )
    let opExpr = parseDecl(opTokens)
    var a = (opExpr as VarDecl).getOrThrow()
    a.keyword.toTokens().dump()
    a.dump()
    return 0
}

// ASSERT: scan description: const, token_id: 93, token_literal_value: const
// ASSERT: scan VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "const"
// ASSERT: scan kind: CONST
// ASSERT: scan -pattern: TuplePattern {
// ASSERT: scan -patterns: 0, VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -patterns: 1, VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: TupleLiteral {
// ASSERT: scan -elements: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -elements: 1, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "2"
// ASSERT: scan kind: INTEGER_LITERAL
