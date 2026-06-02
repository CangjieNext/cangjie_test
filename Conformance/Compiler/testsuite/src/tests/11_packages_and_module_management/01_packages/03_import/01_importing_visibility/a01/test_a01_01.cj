/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_01_a01_01

  @Level:         1

  @Assertion:    11.1.3.1(1) The content imported in a source file of a package 
                 is visible to all source files of the same package.
  
  @Description:  Check that content imported in a source file of a package 
                 is visible to all source files of the same package.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a01_01.cj aux_test_a01_02.cj

*/
package p1

import utils.assert.Assert

main() {
    Assert.equals(2023, currentYear)
    return 0
}