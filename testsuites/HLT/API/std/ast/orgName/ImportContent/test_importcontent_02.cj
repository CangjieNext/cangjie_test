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

@Test
func test_importContent() {
    let importContent = ImportContent()
    importContent.importKind = ImportKind.All
    importContent.prefixPaths = Tokens([Token(IDENTIFIER, "pkg1"), Token(IDENTIFIER, "pkg2")])
    importContent.prefixDots = Tokens([Token(DOT), Token(DOT)])
    importContent.identifier = Token(IDENTIFIER, "*")
    importContent.orgName = Token(IDENTIFIER, "orgName")
    importContent.orgSeparator = Token(DOUBLE_COLON)
    @Assert(importContent.toTokens().toString(), "orgName :: pkg1.pkg2.*")

    @Assert(importContent.prefixPaths.toString(), "pkg1 pkg2")
    @Assert(importContent.prefixDots.toString(), "..")
    @Assert(importContent.identifier.value, "*")
    @Assert(importContent.orgName.value, "orgName")
    @Assert(importContent.orgSeparator.value, "::")
}
