/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a05_01

  @Level:         1

  @Assertion: 6.1.1.3(5)
              For example:
              interface I1 {}
              interface I2 {}
              // Class C1 implementation interface I1
              open class C1 <: I1 {}
              // Class C2 inherits class C1 and implements interface I1, I2.
              class C2 <: C1 & I1 & I2 {}

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006129

*/

import utils.assert.Assert

interface I1 {}
interface I2 {}
// Class C1 implementation interface I1
open class C1 <: I1 {}
// Class C2 inherits class C1 and implements interface I1, I2.
class C2 <: C1 & I1 & I2 {}

main() {
  var c1 = C1()
  Assert.isTrue(c1 is C1)
  Assert.isTrue(c1 is I1)

  var c2 = C2()
  Assert.isTrue(c2 is C2)
  Assert.isTrue(c2 is C1)
  Assert.isTrue(c2 is I1)
  Assert.isTrue(c2 is I2)
}
