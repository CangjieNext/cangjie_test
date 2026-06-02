/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a12_01

  @Level:         1

  @Assertion: 6.1.1.2(12)
              When a class extends another class, 
              the class being extended is called the superclass, and the extended class is called a subclass.
              open class C1 {} // C1 is superclass
              class C2 <: C1 {} // C2 is subclass

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class C1 {} // C1 is superclass
class C2 <: C1 {} // C2 is subclass

main() {
  let c2 = C2()
  Assert.isTrue(c2 is C2)
  Assert.isTrue(c2 is C1)
}
