/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %use_ast %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
func test_packageHeader() {
    let _packageHeader = PackageHeader()
    // _packageHeader.accessible = Token(ILLEGAL)
    _packageHeader.keywordM = Token(MACRO)
    _packageHeader.keywordP = Token(PACKAGE)
    _packageHeader.prefixPaths = Tokens([Token(IDENTIFIER, "pkg1"), Token(IDENTIFIER, "pkg2")])
    _packageHeader.prefixDots = Tokens([Token(DOT), Token(DOT)])
    _packageHeader.packageIdentifier = Token(IDENTIFIER, "pkga")
    @AssertThrows[ASTException](_packageHeader.orgSeparator = Token(DOUBLE_COLON))
    _packageHeader.orgName = Token(IDENTIFIER, "orgName")
    // _packageHeader.orgSeparator = Token(DOUBLE_COLON)
    @Assert(_packageHeader.toTokens().toString(), "macro package orgName :: pkg1.pkg2.pkga\n")

    @Assert(_packageHeader.accessible.value, "public")
    @Assert(_packageHeader.keywordM.value, "macro")
    @Assert(_packageHeader.keywordP.value, "package")
    @Assert(_packageHeader.prefixPaths.toString(), "pkg1 pkg2")
    @Assert(_packageHeader.prefixDots.toString(), "..")
    @Assert(_packageHeader.packageIdentifier.value, "pkga")
    @Assert(_packageHeader.orgName.value, "orgName")
    @Assert(_packageHeader.orgSeparator.value, "::")
    @AssertThrows[ASTException](_packageHeader.keywordM = Token(IDENTIFIER, "macro"))
    @AssertThrows[ASTException](_packageHeader.keywordP = Token(IDENTIFIER, "package"))
}
