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
        public enum TimeUnit<T1> <: I1 where T1 <: A {
            Year
            | Month 
            | ...
        }
    )
    let decl = parseDecl(input)
    let enumDecl = match (decl as EnumDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    enumDecl.ellipsis.dump()
    enumDecl.dump()
    0
}

// ASSERT: scan description: ellipsis, token_id: 49, token_literal_value:
// ASSERT: scan EnumDecl {
// ASSERT: scan -modifiers: 0, Modifier {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "public"
// ASSERT: scan kind: PUBLIC
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "enum"
// ASSERT: scan kind: ENUM
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "TimeUnit"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -genericParam: GenericParam {
// ASSERT: scan -parameters: 0, T1: Token {
// ASSERT: scan value: "T1"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -upperBound: Token {
// ASSERT: scan value: "<:"
// ASSERT: scan kind: UPPERBOUND
// ASSERT: scan -superTypes: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "I1"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -genericConstraint: 0, GenericConstraint {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "where"
// ASSERT: scan kind: WHERE
// ASSERT: scan -typeArgument: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T1"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -upperBound: Token {
// ASSERT: scan value: "<:"
// ASSERT: scan kind: UPPERBOUND
// ASSERT: scan -upperBounds: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "A"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -constructors: 0, Constructor {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Year"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -constructors: 1, Constructor {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Month"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -ellipsis: Token {
// ASSERT: scan value: "..."
// ASSERT: scan kind: ELLIPSIS
