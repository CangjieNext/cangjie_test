/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a07_01

  @Level:         1

  @Assertion:    11.1.3.6(7) When other packages import declarations in the current package,
                 the re-exported content in the current package is automatically imported into 
                 other packages without manual import.
  
  @Description:  Check that foo1 was re-exported with `public import` and automatically imported from pkga2

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a07_02.cj

*/

package pkg1

import pkga2.foo2
import pkga2
import utils.assert.Assert

main() {
    Assert.equals("func from pa1 pkg", pkga2.foo1())  //foo1 was re-exported and automatically imported 
    Assert.equals("func from pa2 pkg", foo2())
}