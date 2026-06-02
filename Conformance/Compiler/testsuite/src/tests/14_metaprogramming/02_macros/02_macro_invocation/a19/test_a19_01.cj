/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a19_01

  @Level:         1

  @Assertion:    14.2.2(19) Macros are visible only during compilation. 

  @Description:  Check that macro visible during compilation
   
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import utils.assert.Assert
import std.ast.*
import aux_macros_01.*
import aux_macros_02.*
import aux_macros_03.*

main(): Unit {
    var a: Int32
    @callGenMacro(a = 6)
    Assert.equals(6, a)
}
