/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_01_a06_01

  @Level:         1

  @Assertion:    14.2.1(6) For macros without attributes, one token parameter corresponds to the macro input.

  @Description:  Check case of macro with one parameter as input
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

main(): Unit {
    var r1 = @macroWithoutAttrParam0(1)
    var r2 = @macroWithoutAttrParam1(2)

    Assert.equals(1, r1)
    Assert.equals(2, r2)
}
