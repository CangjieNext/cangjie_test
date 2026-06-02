/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_a14_01

  @Level:         1

  @Assertion:    11.1.3(14) All top-level definitions or declarations are 
                 accessible from any file in the package by default.

  @Description:  Check that all top-level definitions or declarations are accessible
                 from any file in the package by default.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a14_01.cj

*/

package p1

import utils.assert.Assert

main() {
    Assert.equals(2023, currentYear)
    return 0
}
