/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a05_01

  @Level:         1

  @Assertion: 6.1.1.1(5)
              /* The following class is declared with modifier `open`, indicating that it can be inherited.*/
              open class C1 {
                func foo(): Unit {
                  return
                }
              }
              class C2 <: C1 {}

  @Description: Check that the example is working

  @Mode: run

  @Negative: no

  @Structure: single
*/

import utils.assert.Assert

/* The following class is declared with modifier `open`, indicating that it can be inherited.*/
open class C1 {
  func foo(): Unit {
    return
  }
}
class C2 <: C1 {}

main() {
  var c2 = C2()
  Assert.isTrue(c2 is C1)
  Assert.isTrue(c2 is C2)
}
