/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_04_a01_01

  @Level:         1

  @Assertion:    11.1.4(1) A package may consist of multiple source files. 
 
  @Description:  Check that package may consist of multiple source files.

  @Mode:         run 

  @Negative:     no  

  @Structure:    complex-main

  @Dependencies: aux_test_a01_01.cj aux_test_a01_02.cj
 
*/

import pkg.*
import utils.assert.Assert

main() {
    Assert.equals(3.14, PI)
    Assert.equals(9.8, G)
    return 0
}