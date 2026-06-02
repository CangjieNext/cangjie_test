/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

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
/* SCAN
ORG :: 
-importKind: Multi
-orgName: Token {
  value: "ORG"
  kind: IDENTIFIER
  pos: 18: 29
}
-orgSepartaor: Token {
  value: "::"
  kind: DOUBLE_COLON
  pos: 17: 34
}
-importKind: Alias
-orgName: Token {
  value: "ORG"
  kind: IDENTIFIER
  pos: 18: 29
}
-orgSepartaor: Token {
  value: "::"
  kind: DOUBLE_COLON
  pos: 17: 34
}
*/