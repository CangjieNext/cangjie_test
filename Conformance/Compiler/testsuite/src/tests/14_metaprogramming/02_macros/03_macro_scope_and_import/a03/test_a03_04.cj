/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_03_a03_04

  @Level:         1

  @Assertion:    14.2.3(3) Declarations in macro package cannot be external, except macro declarations.
 
  @Description:  Check that the enum declarations cannot be defined as external in package modified with macro
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_04.cj

*/

import std.ast.*
import aux_macros_04.*

main(): Unit {
    let enm = A
    @stub(0)
}
