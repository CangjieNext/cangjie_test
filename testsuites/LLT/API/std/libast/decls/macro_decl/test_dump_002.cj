/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

internal import std.ast.{MacroDecl, Token, ASTException, TokenKind}

main() {
    let decl0 = MacroDecl()
    decl0.colon = Token(COLON)
    try {
        decl0.declType
    } catch (_: ASTException) {
        println("No declType")
    }
    decl0.toTokens() |> println
    decl0.dump()

    let decl1 = MacroDecl(quote(
        public macro foo(input: Tokens) {
            input
        }
    ))
    decl1.colon = Token(COLON).addPosition(0, 0, 0)
    decl1.dump()
    decl1.toTokens() |> println
}

// ASSERT: scan No declType
// ASSERT: scan ()
// ASSERT: scan MacroDecl {
// ASSERT: scan -block: Block {
// ASSERT: scan MacroDecl {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "macro"
// ASSERT: scan kind: MACRO
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "foo"
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
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "input"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan public macro foo(input: Tokens) {
// ASSERT: scan input
