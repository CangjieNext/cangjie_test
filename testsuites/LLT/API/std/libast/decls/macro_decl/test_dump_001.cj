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
        public macro M(input: Tokens, attrs: Tokens) : Tokens {
            parseDecl(input) as Funcdecl
            return input + attrs
        }
    )
    let md = parseDecl(input) as MacroDecl
    var macroDecl = match (md) {
        case Some(v) => v
        case None => throw Exception()
    }

    let output = quote($macroDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 1
    }
    // Test identifier.
    if (macroDecl.keyword.value != "macro") {
        return 2
    }
    // Test return type.
    let ty = macroDecl.declType
    if (!(ty is RefType)) {
        return 3
    }

    // Test modifiers.
    let modifiers = macroDecl.modifiers
    if (modifiers.size != 1) {
        return 4
    }

    macroDecl.dump()
    return 0
}

// ASSERT: scan MacroDecl {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "macro"
// ASSERT: scan kind: MACRO
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "M"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "input"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Tokens"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 1, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "attrs"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Tokens"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -declType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Tokens"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, AsExpr {
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "parseDecl"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "input"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "as"
// ASSERT: scan kind: AS
// ASSERT: scan -shiftType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Funcdecl"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 1, ReturnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "return"
// ASSERT: scan kind: RETURN
// ASSERT: scan -expr: BinaryExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "input"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: "+"
// ASSERT: scan kind: ADD
// ASSERT: scan -rightExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "attrs"
// ASSERT: scan kind: IDENTIFIER
