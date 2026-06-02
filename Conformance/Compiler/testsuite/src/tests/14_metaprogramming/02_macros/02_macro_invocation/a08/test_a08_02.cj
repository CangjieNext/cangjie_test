/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a08_02

  @Level:         1

  @Assertion:    14.2.2(8) The parentheses can be escaped using \ and are not counted in the matching rule.

  @Description:  Negative check of unbalanced parentheses expression with escaped parentheses
   
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

main(): Unit {
    @stub(\())
}
