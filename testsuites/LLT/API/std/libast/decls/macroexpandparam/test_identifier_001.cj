// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.ast.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
func test2() {
    let _decl = FuncDecl(quote(
            func foo (@M1 a: Int64) {}
        ))
    let decl = (_decl.funcParams[0] as MacroExpandParam).getOrThrow()
    @Assert(decl.fullIdentifier.toTokens().toString().contains("M1"))
    @Assert(decl.identifier.toTokens().toString().contains("M1"))
    decl.identifier = Token(IDENTIFIER, "MMMM")
    @Assert(decl.fullIdentifier.toTokens().toString().contains("MMMM"))
    @Assert(decl.identifier.toTokens().toString().contains("MMMM"))

    decl.fullIdentifier = Token(IDENTIFIER, "NNNNN")
    @Assert(decl.fullIdentifier.toTokens().toString().contains("NNNNN"))
    @Assert(decl.identifier.toTokens().toString().contains("NNNNN"))
    return 0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */