/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a14_03

  @Level:         1

  @Assertion: 6.1.2.1(14)
              The members in the primary constructor can also be modified by using private, public, and protected.

  @Description: Check that member variable parameters in the primary constructor
                modified with 'public' create variables that are visible from outside the package
                and member variable parameters modified with 'protected' create variables that are
                visible in subclasses outside the package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a14_03_aux.cj

*/

import utils.assert.Assert

import t03.*

class Child <: TestProtected {
  init() {
    super(1, "1", np1: r'a', np2: {=> ""})
  }

  static func test() {
    let tst = TestProtected(200, "200", np1: r'a', np2: {=> "pop"})

    Assert.equals(200, tst.p1)
    Assert.equals("200", tst.p2)
    Assert.equals(r'a', tst.np1)
    Assert.equals("pop", tst.np2())
  }
}

main() {
  let tst = TestPublic(100, "100", np1: r'q', np2: {=> "str"})

  Assert.equals(100, tst.p1)
  Assert.equals("100", tst.p2)
  Assert.equals(r'q', tst.np1)
  Assert.equals("str", tst.np2())

  Child.test()
}