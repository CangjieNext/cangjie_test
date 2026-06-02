/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a03_01

  @Level:         1

  @Assertion:    14.2.4(3) The Tokens result returned by the inner macro is combined with other Tokens and sent to the
                 outer macro for invoking.  
 
  @Description:  Check that Tokens from inner macro is combined with outer macro Tokens
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import utils.assert.Assert
import aux_macros_01.*

main(): Unit {
    let r = @isTokens @Inner(0)
    Assert.isTrue(r)

    let t = @Outer @Inner(66)
    Assert.equals(70, t)
}
