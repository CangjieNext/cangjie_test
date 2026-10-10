/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main() {
    let tk = quote(macro package a)
    let parsed = parseProgram(tk)
    parsed.dump()
}

// ASSERT: scan Program {
// ASSERT: scan -packageHeader: PackageHeader {
// ASSERT: scan -keywordM: Token {
// ASSERT: scan value: "macro"
// ASSERT: scan kind: MACRO
// ASSERT: scan -keywordP: Token {
// ASSERT: scan value: "package"
// ASSERT: scan kind: PACKAGE
// ASSERT: scan -packageIdentifier: Token {
// ASSERT: scan value: "a"
// ASSERT: scan kind: IDENTIFIER
