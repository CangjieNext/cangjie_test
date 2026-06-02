/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_01_a03_02

  @Level:         1

  @Assertion:    14.2.1(3) - public must be added before macro, indicating that the package is visible to the outside.

  @Description:  Check that macro is visible in the different module

  @Module:       default
  
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import std.ast.*
import aux_macros_01.*

main(): Unit {
    var r1 = @macroInModule(1)
}
