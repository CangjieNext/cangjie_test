/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_01_a07_01

  @Level:         1

  @Assertion:    14.2.1(7) For macros with attributes, two token types correspond to the macro attributes and input.

  @Description:  Check case of attribute macro
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros.*

main(): Unit {
    var r1 = @macroWithAttrParam0[Int16](5)
    var r2 = @macroWithAttrParam1[IntNative](22222222222)

    Assert.isTrue(r1 is Int16)
    Assert.isTrue(r2 is IntNative)

    Assert.equals(5, r1)
    Assert.equals(22222222222, r2)
}
