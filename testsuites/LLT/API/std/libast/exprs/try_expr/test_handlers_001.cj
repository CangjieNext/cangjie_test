/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC: %run %set_stdx_path %run_opt %output %run_args | compare %f

internal import std.ast.*
internal import std.collection.*
 
main(): Int64 {
    let tokens = quote( 
        try {
            let lastElement = arrayTest[3]
        } handle(e: Eff) {
            print("exception info:" + e)
        }
    )
    let aa = TryExpr(tokens)
    aa.dump()

    return 0
}

// ASSERT: scan TryExpr {
// ASSERT: scan -keywordT: Token {
// ASSERT: scan value: "try"
// ASSERT: scan kind: TRY
// ASSERT: scan -tryBlock: Block {
// ASSERT: scan -nodes: 0, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "lastElement"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: SubscriptExpr {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "arrayTest"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -indexList: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "3"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -keywordsH: 0, Token {
// ASSERT: scan value: "handle"
// ASSERT: scan kind: HANDLE
// ASSERT: scan -commandPattern: 0, CommandTypePattern {
// ASSERT: scan -pattern: VarPattern {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "e"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -types: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Eff"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -handleBlocks: 0, Block {
// ASSERT: scan -nodes: 0, CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "print"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: BinaryExpr {
// ASSERT: scan -leftExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "exception info:"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -op: Token {
// ASSERT: scan value: "+"
// ASSERT: scan kind: ADD
// ASSERT: scan -rightExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "e"
// ASSERT: scan kind: IDENTIFIER
