/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: define_001.cj
// EXEC: %compiler %cmp_macro define_001.cj
// EXEC: %run_macro %compiler %cmp_opt %f | compare %f

import define.*
import std.ast.*

public class Example {
    public Example(
        @M public let a: String,
        @M public let b!: String,
        @M public let c!: String = ""
    ) {}

    public func foo(
        @M a: Int64,
        @M b!: Int64,
        @M c!: Float64 = 1.0
    ) {
    }
}

main() {
    let e1 = Example("", b: "")
    let e2 = Example("", b: "", c: "")
    0
}

// ASSERT: scan constructor funcParam:
// ASSERT: scan FuncParam {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "String"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan constructor funcParam:
// ASSERT: scan FuncParam {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -not: Token {
// ASSERT: scan value: "!"
// ASSERT: scan kind: NOT
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "String"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan constructor funcParam:
// ASSERT: scan FuncParam {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "c"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -not: Token {
// ASSERT: scan value: "!"
// ASSERT: scan kind: NOT
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "String"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: ""
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan constructor funcParam:
// ASSERT: scan FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan constructor funcParam:
// ASSERT: scan FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -not: Token {
// ASSERT: scan value: "!"
// ASSERT: scan kind: NOT
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan constructor funcParam:
// ASSERT: scan FuncParam {
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
// ASSERT: scan value: "Float64"
// ASSERT: scan kind: FLOAT64
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1.0"
// ASSERT: scan kind: FLOAT_LITERAL
