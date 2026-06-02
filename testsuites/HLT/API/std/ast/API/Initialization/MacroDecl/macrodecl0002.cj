/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*
import std.unittest.*
import std.unittest.testmacro.*

main(): Int64 {
    let tok1 = quote(public macro M(): Tokens {Tokens()})
    let e1 = @AssertThrows[ASTException](MacroDecl(tok1))
    @Assert(e1.message, "Cannot construct the 'MacroDecl' node.")

    let tok2 = quote(public macro M(a: Tokens): Token {Tokens()})
    let e2 = @AssertThrows[ASTException](MacroDecl(tok2))
    @Assert(e2.message, "Cannot construct the 'MacroDecl' node.")

    let tok3 = quote(internal macro M(input1: Tokens, input2: Tokens): Tokens {input1 + input2})
    let e3 = @AssertThrows[ASTException](MacroDecl(tok3))
    @Assert(e3.message, "Cannot construct the 'MacroDecl' node.")

    0
}
