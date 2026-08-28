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
    // vardecl
    var tks = quote(
    @When[!debug]
    @Frozen
    var A = 1)
    var d = parseDecl(tks)
    d.dump()

    // funcdecl
    tks = quote(
    @When[!test]
    @Frozen
    func A(){
        return 0
    })
    d = parseDecl(tks)
    d.dump()

    // funcdecl
    tks = quote(
    @!aaa["test"]
    @!aaa["11"]
    func A(){
        return 0
    })
    d = parseDecl(tks)
    d.dump()

    // extendDecl
    tks = quote(
    @!aaa["test"]
    @!aaa["11"]
    extend String {
        func foo(){}
    })
    d = parseDecl(tks)
    d.dump()

    // init
    tks = quote(
    struct R {
        let w: Int64

        @!aaa["test"]
        @!aaa["11"]
        public init(w: Int64) { 
            this.w = w
        }
    })
    d = parseDecl(tks)
    d.dump()

    tks = quote(
    struct Rectangle {
        @!aaa["test"]
        @!aaa["11"]
        public Rectangle(let width: Int64, let height: Int64) {}
    }
    )
    d = parseDecl(tks)
    d.dump()

    0
}

// ASSERT: scan VarDecl {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: When
// ASSERT: scan -condition: UnaryExpr {
// ASSERT: scan -op: Token {
// ASSERT: scan value: "!"
// ASSERT: scan kind: NOT
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "debug"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -annotations: 1, Annotation {
// ASSERT: scan -identifier: Frozen
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "var"
// ASSERT: scan kind: VAR
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "A"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan FuncDecl {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: When
// ASSERT: scan -condition: UnaryExpr {
// ASSERT: scan -op: Token {
// ASSERT: scan value: "!"
// ASSERT: scan kind: NOT
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "test"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -annotations: 1, Annotation {
// ASSERT: scan -identifier: Frozen
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "A"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, ReturnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "return"
// ASSERT: scan kind: RETURN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "0"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan FuncDecl {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: aaa
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "test"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -annotations: 1, Annotation {
// ASSERT: scan -identifier: aaa
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "11"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "A"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, ReturnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "return"
// ASSERT: scan kind: RETURN
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "0"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan ExtendDecl {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: aaa
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "test"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -annotations: 1, Annotation {
// ASSERT: scan -identifier: aaa
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "11"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "extend"
// ASSERT: scan kind: EXTEND
// ASSERT: scan -extendType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "String"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -body: Body {
// ASSERT: scan -decls: 0, FuncDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "foo"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -block: Block {
// ASSERT: scan StructDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "struct"
// ASSERT: scan kind: STRUCT
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "R"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -body: Body {
// ASSERT: scan -decls: 0, VarDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "w"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -declType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -decls: 1, FuncDecl {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: aaa
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "test"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -annotations: 1, Annotation {
// ASSERT: scan -identifier: aaa
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "11"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "init"
// ASSERT: scan kind: INIT
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "init"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "w"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, AssignExpr {
// ASSERT: scan -leftExpr: MemberAccess {
// ASSERT: scan -baseExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "this"
// ASSERT: scan kind: THIS
// ASSERT: scan -dot: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -field: Token {
// ASSERT: scan value: "w"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -rightExpr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "w"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan StructDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "struct"
// ASSERT: scan kind: STRUCT
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Rectangle"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -body: Body {
// ASSERT: scan -decls: 0, PrimaryCtorDecl {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: aaa
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "test"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -annotations: 1, Annotation {
// ASSERT: scan -identifier: aaa
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "11"
// ASSERT: scan kind: STRING_LITERAL
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Rectangle"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "width"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -funcParams: 1, FuncParam {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "let"
// ASSERT: scan kind: LET
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "height"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -block: Block {
