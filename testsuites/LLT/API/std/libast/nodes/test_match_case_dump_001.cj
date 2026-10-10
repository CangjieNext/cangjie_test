/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

internal import std.ast.{MatchExpr, Tokens}

main() {
    let expr = MatchExpr(quote(
        match (x) {
            case 1 | 2 => 0
            case _ => 1
        }
    ))
    let matchCase = expr.matchCases[0]
    matchCase.bitOrs = Tokens()
    matchCase.toTokens() |> println
    matchCase.dump()
}

// ASSERT: scan case 1 | 2 => 0
// ASSERT: scan MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, ConstPattern {
// ASSERT: scan -litConstExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -patterns: 1, ConstPattern {
// ASSERT: scan -litConstExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "2"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "0"
// ASSERT: scan kind: INTEGER_LITERAL
