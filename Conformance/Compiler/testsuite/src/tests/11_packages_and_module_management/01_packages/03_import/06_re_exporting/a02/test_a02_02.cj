/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a02_02

  @Level:         1

  @Assertion:    11.1.3.6(2) The name imported with public import is equivalent to defining 
                 a new name in this package that is the same with the imported one, namely 
                 public import auxTestA0201.itemName as itemName.

  @Description:  Check that public import auxTestA0201.itemName is equivalent to itemName

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a02_02.cj

 */

package p3

import p2.*
import utils.assert.Assert

main() {
    Assert.equals("p1", auxTestA0201)
}

