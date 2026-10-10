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
    let tokens = quote(1;1+1;;

    ;2-2-3+2)
    let (a, b) = parseExprFragment(tokens, startFrom: 0)
    a.dump()
    println(b)
    let (c, d) = parseExprFragment(tokens, startFrom: b)
    c.dump()
    println(d)
    let (e, f) = parseExprFragment(tokens, startFrom: d)
    e.dump()
    println(f)
    return 0;
}

// ASSERT: scan LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan 2
// ASSERT: scan BinaryExpr {
// ASSERT: scan -leftExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -op: Token {
// ASSERT: scan value: "+"
// ASSERT: scan kind: ADD
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "1"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan 10
// ASSERT: scan BinaryExpr {
// ASSERT: scan -leftExpr: BinaryExpr {
// ASSERT: scan -leftExpr: BinaryExpr {
// ASSERT: scan -leftExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "2"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -op: Token {
// ASSERT: scan value: "-"
// ASSERT: scan kind: SUB
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "2"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -op: Token {
// ASSERT: scan value: "-"
// ASSERT: scan kind: SUB
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "3"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan -op: Token {
// ASSERT: scan value: "+"
// ASSERT: scan kind: ADD
// ASSERT: scan -rightExpr: LitConstExpr {
// ASSERT: scan -literal: Token {
// ASSERT: scan value: "2"
// ASSERT: scan kind: INTEGER_LITERAL
// ASSERT: scan 17