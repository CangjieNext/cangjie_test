/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %enableEH %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %set_stdx_path %run_opt %output %run_args 2>&1 | compare %f
internal import std.ast.*

main() : Int64 {
    let tokens = quote( perform Eff() )
    let aa = PerformExpr(tokens)
    aa.dump()
    let bb = PerformExpr()
    bb.keyword = aa.keyword
    bb.expr = aa.expr
    bb.dump()

    return 0
}

// ASSERT: scan PerformExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "perform"
// ASSERT: scan kind: PERFORM
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Eff"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan PerformExpr {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "perform"
// ASSERT: scan kind: PERFORM
// ASSERT: scan -expr: CallExpr {
// ASSERT: scan -callFunc: RefExpr {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Eff"
// ASSERT: scan kind: IDENTIFIER
