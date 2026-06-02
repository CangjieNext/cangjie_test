/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a16_02

  @Level:         1

  @Assertion:    14.2.4(16) - Macro definitions can use macro invocations; recursion (direct or indirect) is allowed
                 without restriction inside of quote expressions, but is disallowed outside of  quote expressions,
                 directly in the macro definition body.

  @Description:  Check that macro recursion is allowed inside of quote expressions

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_03.cj

  @Issue:        0006253

*/

import utils.assert.Assert
import aux_macros_03.*

main(): Unit {
    let r = @M1("def")
    Assert.equals("def_macro", r)
}
