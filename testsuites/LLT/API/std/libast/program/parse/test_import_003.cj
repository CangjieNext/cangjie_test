/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

import std.ast.{ImportContent, ImportKind, Token, TokenKind}

main() {
    let importContent = ImportContent()
    importContent.importKind = ImportKind.Multi
    importContent.orgName = Token(IDENTIFIER, "ORG")
    importContent.orgSeparator = Token(DOUBLE_COLON)
    importContent.orgName = Token(IDENTIFIER, "ORG")
    importContent.toTokens() |> println
    importContent.dump()
    importContent.importKind = ImportKind.Alias
    importContent.dump()
}
// ASSERT: scan ORG ::
// ASSERT: scan -importKind: Multi
// ASSERT: scan -orgName: Token {
// ASSERT: scan value: "ORG"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -orgSepartaor: Token {
// ASSERT: scan value: "::"
// ASSERT: scan kind: DOUBLE_COLON
// ASSERT: scan -importKind: Alias
// ASSERT: scan -orgName: Token {
// ASSERT: scan value: "ORG"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -orgSepartaor: Token {
// ASSERT: scan value: "::"
// ASSERT: scan kind: DOUBLE_COLON
