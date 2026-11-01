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

class TestClass {
    @Frozen
    public prop a: Int64 {
        get() {
            1
        }
    }

    @Frozen
    public func getA() {
        return 1
    }
}

main() {
    let t = TestClass()
    println(t.a)
    println(t.getA())

    let tokens = quote(class TestClass {
    @Frozen
    public prop a: Int64 {
        get() { 1 }
    }

    @Frozen
    public func getA() {
        return 1
    }
})
    let decl = ClassDecl(tokens)
    decl.dump()
    return 0
}

// ASSERT: scan 1
// ASSERT: scan 1
// ASSERT: scan ClassDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "class"
// ASSERT: scan kind: CLASS
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "TestClass"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -body: Body {
// ASSERT: scan -decls: 0, PropDecl {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: Frozen
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "prop"
// ASSERT: scan kind: PROP
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -declType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -getter: FuncDecl {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "get"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -decls: 1, FuncDecl {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: Frozen
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "getA"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, ReturnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "return"
// ASSERT: scan kind: RETURN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
