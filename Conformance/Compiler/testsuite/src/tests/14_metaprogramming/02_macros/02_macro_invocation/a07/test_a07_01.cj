/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_02_a07_01

  @Level:         1

  @Assertion:    14.2.2(7) - Unmatched parentheses are not allowed in macro invocation expression parameters, 
                 for example, @ABC(we have two ((and one)).

  @Description:  Check example
   
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: ../aux_macros.cj

*/

import std.ast.*
import aux_macros.*

main(): Unit {
    @ABC(we have two ((and one))
}
