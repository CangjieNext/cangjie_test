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
        enum E {
            @API1[11]
            caseA |
            @!API2[11]
            @!API3[11]
            caseB(Int64, Bool)
        }
    )
    let enumDecl = (parseDecl(input) as EnumDecl).getOrThrow()
    if (enumDecl.constructors[1].annotations.size != 2) {
        return 1
    }
    let annos = enumDecl.constructors[1].annotations
    if (annos[0].identifier.value != "API2" || annos[1].identifier.value != "API3") {
        return 2
    }
    if (annos[0].at.kind != TokenKind.AT_EXCL || annos[1].at.kind != TokenKind.AT_EXCL) {
        return 3
    }
    enumDecl.dump()
    0
}

// ASSERT: scan EnumDecl {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "enum"
// ASSERT: scan kind: ENUM
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "E"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -constructors: 0, Constructor {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: API1
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "11"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "caseA"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -constructors: 1, Constructor {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: API2
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "11"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -annotations: 1, Annotation {
// ASSERT: scan -identifier: API3
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "11"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "caseB"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -typeArguments: 0, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Int64"
// ASSERT: scan kind: INT64
// ASSERT: scan -typeArguments: 1, PrimitiveType {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "Bool"
// ASSERT: scan kind: BOOLEAN
