/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
internal import std.ast.*

main(): Int64 {
    let tokens = quote(
        add!: (Int64, Int64) -> Int64 = {a, b => 10}
    )
    let funParam = FuncParam(tokens)
    funParam.dump()
    return 0
}

// ASSERT: scan FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "add"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -not: Token {
// ASSERT: scan value: "!"
// ASSERT: scan kind: NOT
// ASSERT: scan -colon: Token {
// ASSERT: scan value: ":"
// ASSERT: scan kind: COLON
// ASSERT: scan -paramType: FuncType {
// ASSERT: scan -types: 0, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -types: 1, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -ARROW: Token {
// ASSERT: scan value: "->"
// ASSERT: scan kind: ARROW
// ASSERT: scan -returnType: PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -assign: Token {
// ASSERT: scan value: "="
// ASSERT: scan kind: ASSIGN
// ASSERT: scan -expr: LambdaExpr {
// ASSERT: scan -funcParams: 0, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -paramType:     }
// ASSERT: scan -funcParams: 1, FuncParam {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "b"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -paramType:     }
// ASSERT: scan -doubleArrow: Token {
// ASSERT: scan value: "=>"
// ASSERT: scan kind: DOUBLE_ARROW
// ASSERT: scan -nodes: 0, LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "10"
// ASSERT: scan kind: INTEGER_LITERAL
