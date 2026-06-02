/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a16_01

  @Level:         1

  @Assertion:   14.1(16) In the following example, a1 and a2 are equivalent.
                let a1: Tokens = quote(2 + 3) // ok
                let a2: Tokens = quote(2) + quote(+) + quote(3) // ok

  @Description: Positive check example
  
  @Mode:        run

  @Negative:    no

  @Structure:    complex-main

  @Dependencies: aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

main(): Unit {
    Assert.isTrue(@CompileTest())
}
