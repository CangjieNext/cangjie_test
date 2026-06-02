/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a06_01

  @Level:         1

  @Assertion:    14.2.4(6) A second function insideParentContext returns true only if the inner macro call is nested in
                 the given outer macro call.

  @Description:  Check that the function insideParentContext is available

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
    Assert.isTrue(t)

    let r = @Inner(0)
    Assert.isFalse(r)
}
