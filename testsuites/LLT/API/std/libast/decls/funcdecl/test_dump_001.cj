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
        public func foo(a: Int32, b: T, c!: Int32 = 42) : Int32 {
            if ( a > 100 ) {
                return 42
            }
            let d = a + c
            return d
        }
    )
    let fd = parseDecl(input) as FuncDecl
    var funcDecl = match (fd) {
        case Some(v) => v
        case None => throw Exception()
    }

    let output = quote($funcDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 1
    }
    // Test identifier.
    if (funcDecl.identifier.value != "foo") {
        return 2
    }
    // Test return type.
    let ty = funcDecl.declType
    // Test modifiers.
    let modifiers = funcDecl.modifiers
    if (modifiers.size != 1) {
        return 3
    }
    if (modifiers[0].keyword.value != "public") {
        return -1
    }
    var newDecl = VarDecl(quote(var e = 1))
    funcDecl.declType = PrimitiveType(quote(Int64))
    funcDecl.block.nodes.add(newDecl, at: 1)
    funcDecl.dump()
    return 0
}

// ASSERT: scan FuncDecl {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "foo"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int32"
// ASSERT: scan kind: INT32
// ASSERT: scan -funcParams: 1, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 2, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "c"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -not: Token {
// ASSERT: scan value: "!"
// ASSERT: scan kind: NOT
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int32"
// ASSERT: scan kind: INT32
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "42"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -declType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, IfExpr {
// ASSERT: scan -keywordI: Token {
// ASSERT: scan value: "if"
// ASSERT: scan kind: IF
// ASSERT: scan -condition: BinaryExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: ">"
// ASSERT: scan kind: GT
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "100"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -ifBlock: Block {
// ASSERT: scan -nodes: 0, ReturnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "return"
// ASSERT: scan kind: RETURN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "42"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -nodes: 1, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "var"
// ASSERT: scan kind: VAR
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "e"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -nodes: 2, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "d"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: BinaryExpr {
// ASSERT: scan -leftExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -op: Token {
// ASSERT: scan value: "+"
// ASSERT: scan kind: ADD
// ASSERT: scan -rightExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "c"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -nodes: 3, ReturnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "return"
// ASSERT: scan kind: RETURN
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "d"
// ASSERT: scan kind: IDENTIFIER
