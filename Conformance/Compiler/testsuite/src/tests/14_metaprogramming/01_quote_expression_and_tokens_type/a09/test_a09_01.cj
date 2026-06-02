/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a09_01

  @Level:         1

  @Assertion:   14.1(9) In the following example, only the newline character between two assignment expressions 
                is parsed to quoteToken, and other newline characters in the quote expression are ignored.

                // The newline character between assignment expression is preserved, others are ignored.
                quote(

                var a = 3
                var b = 4

                )


  @Description: Checking the newline character between two assignment expressions is parsed to quoteToken
  
  @Mode:        run

  @Negative:    no

  @Structure:    complex-main

  @Dependencies: aux_macros.cj

*/

import std.ast.*
import utils.assert.Assert
import aux_macros.*

main(): Unit {
    var start = @sourceLine()
    @CompileTest1()
    var end = @sourceLine()
    Assert.equals(2, end - start)
}