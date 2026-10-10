/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

import std.ast.*

main() {
    let tk = quote(
        macro package ORGA::pkgA.subB.pkg
    )
    let header = PackageHeader(tk)
    header.toTokens().toString() |> println
    header.orgName.dump()
    header.orgSeparator.dump()
    header.dump()
}
// ASSERT: scan macro package ORGA :: pkgA.subB.pkg
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: ORGA
// ASSERT: scan description: double_colon, token_id: 163, token_literal_value: ::
// ASSERT: scan PackageHeader {
// ASSERT: scan -keywordM: Token {
// ASSERT: scan value: "macro"
// ASSERT: scan kind: MACRO
// ASSERT: scan -keywordP: Token {
// ASSERT: scan value: "package"
// ASSERT: scan kind: PACKAGE
// ASSERT: scan -orgName: Token {
// ASSERT: scan value: "ORGA"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -orgSepartaor: Token {
// ASSERT: scan value: "::"
// ASSERT: scan kind: DOUBLE_COLON
// ASSERT: scan prefixPath: 0: Token {
// ASSERT: scan value: "pkgA"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan dot: 0: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan prefixPath: 1: Token {
// ASSERT: scan value: "subB"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan dot: 1: Token {
// ASSERT: scan value: "."
// ASSERT: scan kind: DOT
// ASSERT: scan -packageIdentifier: Token {
// ASSERT: scan value: "pkg"
// ASSERT: scan kind: IDENTIFIER
