/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a27_01

  @Level:         1

  @Assertion:    14.2.2(27) 3. Macro invocations in quoted code returned from a macro are invoced as soon as they are
                 incorporated back into the source code. For example, a macro can act in a recursive manner, by 
                 emitting a macro invocation to itself.  

  @Description:  Check that macros are invoked as soon as they are incorporated back into the source code
   
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros_01.*

main(): Unit {
    Assert.equals(10, @rec(1+2+3+4))
}
