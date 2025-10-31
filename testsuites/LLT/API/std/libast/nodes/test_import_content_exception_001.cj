/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.*

main() {
    var cnt = 0
    try {
        let importContent = ImportContent()
        importContent.orgName = Token(TokenKind.IDENTIFIER, "")
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }
    try {
        let importContent = ImportContent()
        importContent.orgSeparator = Token(TokenKind.DOUBLE_COLON)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }
    try {
        let importContent = ImportContent()
        importContent.orgSeparator = Token(TokenKind.DOT)
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }
    println("cnt = ${cnt}")
}

/* SCAN-IN
orgName should not be empty
orgName should not be empty
Illegal TokenKind, TokenKind should be DOUBLE_COLON
cnt = 3
 */