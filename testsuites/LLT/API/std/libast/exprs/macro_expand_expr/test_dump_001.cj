/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

internal import std.ast.MacroExpandExpr

main() {
    let expr = MacroExpandExpr()
    expr.dump()
    let macroExpandExpr = MacroExpandExpr(quote(@M class A {}))
    macroExpandExpr.toTokens() |> println
    macroExpandExpr.dump()
}

// ASSERT: scan MacroExpandExpr {
// ASSERT: scan @M
// ASSERT: scan class A {
// ASSERT: scan MacroExpandExpr {
// ASSERT: scan -packageIdentifier: Token {
// ASSERT: scan value: "M"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "M"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -macroInputs:0: Token {
// ASSERT: scan value: "class"
// ASSERT: scan kind: CLASS
// ASSERT: scan -macroInputs:1: Token {
// ASSERT: scan value: "A"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -macroInputs:2: Token {
// ASSERT: scan value: "{"
// ASSERT: scan kind: LCURL
// ASSERT: scan -macroInputs:3: Token {
// ASSERT: scan value: "}"
// ASSERT: scan kind: RCURL
