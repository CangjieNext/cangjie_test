/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a10_01

  @Level:         1

  @Assertion:    14.2.4(10) When a macro definition body contains a macro invocation, if the macro invocation 
                 appears in the context of the returned token sequence, the two macros can be different macros
                 or the same macro (i.e. recursion is supported). 

  @Description:  Check that macro definition supports macro invocation and recursion

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

  @Issue:        0006253

*/

import utils.assert.Assert
import aux_macros_01.*

main(): Unit {
    let t = @M1(0)
    Assert.equals("It`s cool in space", t)
}
