/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    let input = quote(
        match (a) {
            case 1 => 1
            case (a,b) => 1
            case a : Int64 => 1
            case X => 1
            case X | Y => 1
            case Year(y, 0) => y * 365 * 24
            case b => 2
            case _ => 1
            case _ where (a) => 1
        }
    )

    let expr = match (parseExpr(input) as MatchExpr) {
        case Some(v) => v
        case None => throw Exception()
    }
    let flag = compareTokens(input, expr.toTokens())
    if (!flag) {
        return 1
    }
    expr.dump()

    return 0
}

// ASSERT: scan MatchExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "match"
// ASSERT: scan kind: MATCH
// ASSERT: scan -selector: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -matchCases: 0, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, ConstPattern {
// ASSERT: scan -litConstExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -matchCases: 1, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, TuplePattern {
// ASSERT: scan -patterns: 0, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -patterns: 1, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -matchCases: 2, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, TypePattern {
// ASSERT: scan -pattern: VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -patternType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -matchCases: 3, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "X"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -matchCases: 4, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "X"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -patterns: 1, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Y"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -matchCases: 5, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, EnumPattern {
// ASSERT: scan -constructor: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Year"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -patterns: 0, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "y"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -patterns: 1, ConstPattern {
// ASSERT: scan -litConstExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "0"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, BinaryExpr {
// ASSERT: scan -leftExpr: BinaryExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "y"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: "*"
// ASSERT: scan kind: MUL
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "365"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -op: Token {
// ASSERT: scan value: "*"
// ASSERT: scan kind: MUL
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "24"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -matchCases: 6, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "2"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -matchCases: 7, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, WildcardPattern {
// ASSERT: scan -wildcard: Token {
// ASSERT: scan value: "_"
// ASSERT: scan kind: WILDCARD
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -matchCases: 8, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, WildcardPattern {
// ASSERT: scan -wildcard: Token {
// ASSERT: scan value: "_"
// ASSERT: scan kind: WILDCARD
// ASSERT: scan -keywordW: Token {
// ASSERT: scan value: "where"
// ASSERT: scan kind: WHERE
// ASSERT: scan -patternGuard: ParenExpr {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
