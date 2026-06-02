/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a05_01

  @Level:         1

  @Assertion: 6.1.2.3(5)
              The following shows an example of member variable declaration.
              open class A {
                var m1: Int32 = 1
              }
              class C {
                var a: Int32 = 10
                let b: Int32 = super.m1 // Error
              }

  @Description: Check that the example work correctly without the erroneous line

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006234

*/

import utils.assert.Assert

open class A {
    var m1: Int32 = 1
}
class C {
    var a: Int32 = 10
}

main() {
    let a = A()
    Assert.equals(1, a.m1)

    let c = C()
    Assert.equals(10, c.a)
}
