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
        internal import ORGA::{
            pkgA.subB.pkg,
            pkgB.*,
            pkgC.subD as ACD
        }
    )
    let parsed = parseProgram(tk)
    let importContent = parsed.importLists[0].content
    importContent.orgName.dump()
    importContent.orgSeparator.dump()
    importContent.toTokens().toString() |> println
    importContent.dump()
}
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: ORGA
// ASSERT: scan description: double_colon, token_id: 163, token_literal_value: ::
// ASSERT: scan ORGA :: { pkgA.subB.pkg, pkgB.*, pkgC.subD as ACD }
// ASSERT: scan -importKind: Multi
// ASSERT: scan -orgName: Token {
// ASSERT: scan value: "ORGA"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -orgSepartaor: Token {
// ASSERT: scan value: "::"
// ASSERT: scan kind: DOUBLE_COLON
// ASSERT: scan -leftCurl: Token {
// ASSERT: scan value: "{"
// ASSERT: scan kind: LCURL
// ASSERT: scan -importKind: Single
// ASSERT: scan prefixPath: 0: Token {
// ASSERT: scan value: "pkgA"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan prefixPath: 1: Token {
// ASSERT: scan value: "subB"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "pkg"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -comma: Token {
// ASSERT: scan value: ","
// ASSERT: scan kind: COMMA
// ASSERT: scan -importKind: All
// ASSERT: scan prefixPath: 0: Token {
// ASSERT: scan value: "pkgB"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "*"
// ASSERT: scan kind: MUL
// ASSERT: scan -comma: Token {
// ASSERT: scan value: ","
// ASSERT: scan kind: COMMA
// ASSERT: scan -importKind: Alias
// ASSERT: scan prefixPath: 0: Token {
// ASSERT: scan value: "pkgC"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "subD"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -importAlias 0: Token {
// ASSERT: scan value: "as"
// ASSERT: scan kind: AS
// ASSERT: scan -importAlias 1: Token {
// ASSERT: scan value: "ACD"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -rightCurl: Token {
// ASSERT: scan value: "}"
// ASSERT: scan kind: RCURL
