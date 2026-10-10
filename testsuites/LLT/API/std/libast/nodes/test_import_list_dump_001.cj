/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

internal import std.ast.{ImportList, Token}

main() {
    let importList0 = ImportList(quote(import std.ast.*))
    importList0.toTokens() |> println

    let importList1 = ImportList(quote(public import std.ast.*))
    importList1.modifier = Token()
    importList1.dump()
    importList1.toTokens() |> println
}

// ASSERT: scan import std.ast.*
// ASSERT: scan ImportList {
// ASSERT: scan -keywordI: Token {
// ASSERT: scan value: "import"
// ASSERT: scan kind: IMPORT
// ASSERT: scan -importKind: All
// ASSERT: scan prefixPath: 0: Token {
// ASSERT: scan value: "std"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan prefixPath: 1: Token {
// ASSERT: scan value: "ast"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "*"
// ASSERT: scan kind: MUL
// ASSERT: scan import std.ast.*