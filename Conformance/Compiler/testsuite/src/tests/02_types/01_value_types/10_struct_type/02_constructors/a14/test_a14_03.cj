/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a14_03

  @Level:         1

  @Assertion: 2.1.10.2(14)
              The members in the primary constructor can also be modified by using public or private.
              See Access Modifiers for details

  @Description: Check that member variable parameters in the primary constructor
                modified with 'public' create variables that are visible from outside the package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a14_03_aux.cj

*/

import utils.assert.Assert

import t03.*

main() {
    let tst = A1403Aux(100, "100", np1: r'q', np2: {=> "str"})

    Assert.equals(100, tst.p1)
    Assert.equals("100", tst.p2)
    Assert.equals(r'q', tst.np1)
    Assert.equals("str", tst.np2())
}