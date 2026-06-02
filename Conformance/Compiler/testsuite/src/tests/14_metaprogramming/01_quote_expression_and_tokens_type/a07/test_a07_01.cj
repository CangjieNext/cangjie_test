/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a07_01

  @Level:         1

  @Assertion:   14.1(7)   In the preceding syntax definition, quoteToken indicates any valid token supported by
                the compiler, except tokens that are not parsed by Lexer, such as comments and terminators.

  @Description: Check that comments are skipped in quote expression
  
  @Mode:        run

  @Negative:    no

  @Structure:    complex-main

  @Dependencies: aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

main(): Unit {
    var r1 = @CompileTest1()
    var r2 = @CompileTest2()

    Assert.equals(88, r1)
    Assert.equals(77, r2)
}
