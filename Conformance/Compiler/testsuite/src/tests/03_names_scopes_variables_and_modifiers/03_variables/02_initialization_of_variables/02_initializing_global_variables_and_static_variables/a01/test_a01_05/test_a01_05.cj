/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_02_02_a01_05

  @Level:         1

  @Assertion:    3.3.2.2(1) Variables defined at the top-level are called global variables.

  @Description:  Check that public global variable is visible in another package.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a01_05.cj

  @Issue:        0006065

*/

import utils.assert.Assert
import p2.*

main() {
    let lRange: Range<Int32> = 1..10:1
    Assert.equals(gInt, 0)
    Assert.equals(gTuple[1], 2.2)
    Assert.isTrue(gBool)
    Assert.isTrue(gRange == lRange)
}
