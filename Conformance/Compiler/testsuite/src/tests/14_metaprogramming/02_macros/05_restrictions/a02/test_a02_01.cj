/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_05_a02_01

  @Level:         1

  @Assertion:    14.2.5(2) - Except macro recursive invocations, macro definitions and macro invocations must be 
                 located in different packages. 

  @Description:  Check that macro definitions and macro invocations must be located in different packages

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import utils.assert.Assert
import aux_macros_01.*

main(): Unit {
    let r = @M(176)
    Assert.equals(176, r)
}
