/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_01_a10_01

  @Level:         1

  @Assertion:    14.2.1(10) They can be defined with = and expression, similar to the standard library function body.

  @Description:  Check that macro can be defined with = and expression
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

  @Issue:        0006165

*/

import std.ast.*
import aux_macros_01.*

main(): Unit {
    var r1 = @foo(1)
    var r2 = @bar(2)
}
