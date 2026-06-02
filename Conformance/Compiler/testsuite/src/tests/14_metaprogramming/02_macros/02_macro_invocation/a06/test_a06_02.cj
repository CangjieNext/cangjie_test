/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a06_02

  @Level:         1

  @Assertion:    14.2.2(6) The value can be any valid tokens, but cannot be empty.

  @Description:  Check that attributes cannot be empty
   
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

  @Issue:        0006068

*/

import std.ast.*
import aux_macros.*

main(): Unit {
    @stub[](.)
}
