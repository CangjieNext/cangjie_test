/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a10_01

  @Level:         1

  @Assertion:    14.2.2(10) The square brackets can be escaped using \ and are not counted in the matching rule.

  @Description:  Check escaping of square brackets in macro expression
   
  @Mode:         compileonly

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

main(): Unit {
    @stub[we have two [\[and one]]()
    @stub[[\[\[\[\[]\]\]\]\]]()
    @stub[\[]()
}
