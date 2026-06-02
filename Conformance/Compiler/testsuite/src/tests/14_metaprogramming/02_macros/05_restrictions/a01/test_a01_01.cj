/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_05_a01_01

  @Level:         1

  @Assertion:    14.2.5(1) - Macros conditionally support recursive calls to themselves.
                 For details, see the preceding section.

  @Description:  Check that macros conditionally support recursive calls to themselves

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import utils.assert.Assert
import aux_macros_01.*

main(): Unit {
    let r = @first(1, 2, 3, 4)
    Assert.equals(1, r)
}
