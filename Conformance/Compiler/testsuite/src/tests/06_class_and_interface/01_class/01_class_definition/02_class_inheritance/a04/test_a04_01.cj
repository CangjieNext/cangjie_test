/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a04_01

  @Level:         1

  @Assertion: 6.1.1.2(4)
              In the following example, C2 is declared to be a sub-class of class C1, i.e., C2 inherits C1.
              open class C1 {}
              class C2 <: C1 {}

  @Description: Check the correct execution of the example

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class C1 {}
class C2 <: C1 {}

main() {
  var x = C2()
  Assert.isTrue(x is C2)
  Assert.isTrue(x is C1)
}
