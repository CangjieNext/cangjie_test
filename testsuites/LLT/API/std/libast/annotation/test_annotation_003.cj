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
    let tks = quote(
    @!custom[test]
    @Frozen
    var A = 1)
    let vd = VarDecl(tks)
    let annos = vd.annotations
    if (annos[0].identifier.value != "custom" || annos[1].identifier.value != "Frozen") {
        return 2
    }
    if (annos[0].at.kind != TokenKind.AT_EXCL || annos[1].at.kind != TokenKind.AT) {
        return 3
    }

    vd.dump()

    0
}

// ASSERT: scan VarDecl {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: custom
// ASSERT: scan -arguments: 0, Argument {
// ASSERT: scan -expr: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "test"
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
