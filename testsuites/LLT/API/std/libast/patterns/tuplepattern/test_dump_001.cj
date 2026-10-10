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
internal import std.collection.*

class MyVisitor <: Visitor {
    var num = 0
    public override func visit(curNode: TuplePattern) {
        num++
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        match (d) {
            case ("Bob", age) => "Bob is ${age} years old"
            case ("Alice", age) => "Alice is ${age} years old"
            case (name, 100) => "${name} is 100 years old"
            case (_, _) => "someone"
        }
    )
    let me = (parseExpr(input) as MatchExpr).getOrThrow()
    let flag = compareTokens(input, me.toTokens())
    if (!flag) {
        return 1
    }
    me.traverse(myVisitor)
    if (myVisitor.num != 4) {
        return 2
    }
    me.dump()
    return 0
}

// ASSERT: scan MatchExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "match"
// ASSERT: scan kind: MATCH
// ASSERT: scan -selector: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "d"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -matchCases: 0, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, TuplePattern {
// ASSERT: scan -patterns: 0, ConstPattern {
// ASSERT: scan -litConstExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "Bob"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -patterns: 1, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "age"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "Bob is ${age} years old"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -matchCases: 1, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, TuplePattern {
// ASSERT: scan -patterns: 0, ConstPattern {
// ASSERT: scan -litConstExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "Alice"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -patterns: 1, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "age"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "Alice is ${age} years old"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -matchCases: 2, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, TuplePattern {
// ASSERT: scan -patterns: 0, VarOrEnumPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "name"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -patterns: 1, ConstPattern {
// ASSERT: scan -litConstExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "100"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "${name} is 100 years old"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -matchCases: 3, MatchCase {
// ASSERT: scan -keywordC: Token {
// ASSERT: scan value: "case"
// ASSERT: scan kind: CASE
// ASSERT: scan -patterns: 0, TuplePattern {
// ASSERT: scan -patterns: 0, WildcardPattern {
// ASSERT: scan -wildcard: Token {
// ASSERT: scan value: "_"
// ASSERT: scan kind: WILDCARD
// ASSERT: scan -patterns: 1, WildcardPattern {
// ASSERT: scan -wildcard: Token {
// ASSERT: scan value: "_"
// ASSERT: scan kind: WILDCARD
// ASSERT: scan -arrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "someone"
// ASSERT: scan kind: STRING_LITERAL
