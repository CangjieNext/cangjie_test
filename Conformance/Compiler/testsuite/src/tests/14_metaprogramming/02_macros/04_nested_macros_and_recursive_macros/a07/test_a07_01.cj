/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a07_01

  @Level:         1

  @Assertion:    14.2.4(7) 
                   public macro Inner(input: Tokens): Tokens {
                   assertParentContext("Outer")
                   // ...or...
                   if (insideParentContext("Outer")) {
                   // ... 
                   }
                   }

  @Description:  Check example

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

  @Issue:        0006253

*/

import utils.assert.Assert
import aux_macros_01.*

main(): Unit {
    let t = @Outer @Inner(0)
    Assert.isTrue(t == 0)
}
