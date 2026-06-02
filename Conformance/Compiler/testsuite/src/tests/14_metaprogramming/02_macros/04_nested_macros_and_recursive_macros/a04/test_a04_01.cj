/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a04_01

  @Level:         1

  @Assertion:    14.2.4(4) The inner and outer macros can be different macros or the same macro.  
 
  @Description:  Check that inner and outer macros can be different macros or the same macro
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import utils.assert.Assert
import aux_macros_01.*

main(): Unit {
    // Different 
    let r = @Outer @Inner(4)
    Assert.equals(8, r)

    // Same
    let t = @Outer @Outer(4)
    Assert.equals(12, t)
}
