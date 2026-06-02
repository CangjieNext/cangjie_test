/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a02_01

  @Level:         1

  @Assertion:    14.2.4(2) If  the  macro  invocation  expression  contains  macro  invocation,  for  example,
                 @Outer @Inner(22+3),  the inner macro is executed first, and then the outer macro is executed.
 
  @Description:  Check example
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import utils.assert.Assert
import aux_macros_01.*

main(): Unit {
    //  Check example
    let r =  @Outer @Inner(22+3)
    Assert.equals(25, r)

    // Check that the inner macro is executed first
    let t = @OuterDbg @InnerDbg(55)
    Assert.isTrue(t)
}
