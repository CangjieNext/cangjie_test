/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a02_02

  @Level:         1

  @Assertion: 6.1.1.3(2)
              The interfaces implemented by the class are declared by 
              <: I1 & I2 & ... & Ik after the class name or the superclass name if there is one.

  @Description: Check that only interfaces in the interface list are implemented

  @Mode: run

  @Negative: no

  @Structure: single
  
  @Issue: 0006128

*/

import utils.assert.Assert

interface i1 {}
interface i2 {}
interface i3 {}
interface i4 {}
interface i5 {}

class A <: i1 & i3 & i4 {}

main() {
  var a = A()
  Assert.isTrue(a is A)
  Assert.isTrue(a is i1)
  Assert.isTrue(a is i3)
  Assert.isTrue(a is i4)

  Assert.isFalse(a is i2)
  Assert.isFalse(a is i5)
}
