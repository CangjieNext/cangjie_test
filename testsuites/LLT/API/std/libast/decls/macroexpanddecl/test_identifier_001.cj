// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.ast.*
import std.unittest.*
import std.unittest.testmacro.*

let tok = quote(
@p1.M1
class A{}
)

@Test
func test1() {
    let decl = MacroExpandDecl(tok)
    @Assert(decl.fullIdentifier.toTokens().toString(), "p1.M1")
    @Assert(decl.identifier.toTokens().toString(), "M1")

    decl.identifier = Token(IDENTIFIER, "MMMM")
    @Assert(decl.fullIdentifier.toTokens().toString(), "p1.MMMM")
    @Assert(decl.identifier.toTokens().toString(), "MMMM")

    decl.fullIdentifier = Token(IDENTIFIER, "p2.NNNNN")
    @Assert(decl.fullIdentifier.toTokens().toString(), "p2.NNNNN")
    @Assert(decl.identifier.toTokens().toString(), "NNNNN")
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */