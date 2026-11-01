/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: %f.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        public operator func ()(a: Int32) : Int32 {
            return a
        }
    )
    var funcDecl1 = FuncDecl(input1)

    let input2 = quote(
        public operator func !(a: Int32) : Int32 {
            return a
        }
    )
    var funcDecl2 = FuncDecl(input2)

    let input3 = quote(
        public func f<T>(a: T): Int32 where T <: I1{
            return 0
        }
    )
    var funcDecl3 = FuncDecl(input3)

    let flag1 = compareTokens(input1, quote($funcDecl1)) // libast offers compareTokens
    if (!flag1) {
        return 1
    }

    let flag2 = compareTokens(input2, quote($funcDecl2)) // libast offers compareTokens
    if (!flag2) {
        return 2
    }

    let flag3 = compareTokens(input3, quote($funcDecl3)) // libast offers compareTokens
    if (!flag3) {
        return 3
    }

    funcDecl1.dump()
    funcDecl2.dump()
    funcDecl3.dump()
    return 0
}

// ASSERT: scan FuncDecl {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -modifiers: 1, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "operator"
// ASSERT: scan kind: OPERATOR
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "()"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan overloadOp: ()  -funcParams: 0, FuncParam {
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
// ASSERT: scan -declType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int32"
// ASSERT: scan kind: INT32
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, ReturnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "return"
// ASSERT: scan kind: RETURN
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan FuncDecl {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -modifiers: 1, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "operator"
// ASSERT: scan kind: OPERATOR
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "!"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan overloadOp: Token {
// ASSERT: scan value: "!"
// ASSERT: scan kind: NOT
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
// ASSERT: scan -declType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int32"
// ASSERT: scan kind: INT32
// ASSERT: scan -block: Block {
// ASSERT: scan -nodes: 0, ReturnExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "return"
// ASSERT: scan kind: RETURN
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan FuncDecl {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "func"
// ASSERT: scan kind: FUNC
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "f"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -genericParam: GenericParam {
// ASSERT: scan -parameters: 0, T: Token {
// ASSERT: scan value: "T"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -declType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int32"
// ASSERT: scan kind: INT32
// ASSERT: scan -genericConstraint: 0, GenericConstraint {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "where"
// ASSERT: scan kind: WHERE
// ASSERT: scan -typeArgument: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -upperBound: Token {
// ASSERT: scan value: "<:"
// ASSERT: scan kind: UPPERBOUND
// ASSERT: scan -upperBounds: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "I1"
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
