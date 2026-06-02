/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a31_01

  @Level:         1

  @Assertion: 6.1.2.4(31)
              open class C1 {
                protected func f() {}
                var a = f() // f can be accessed in the current class.
              }
              class C2 <: C1 {
                var a = f() // You can access f in C2.
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006267

*/

import utils.assert.Assert

open class C1 {
    protected func f() {}
}
class C2 <: C1 {
  init() {
    a = f() // f can be accessed in the current class.
  }
    var a = () // You can access f in C2.
}

main() {
    Assert.isTrue(C2().a is Unit)
}
