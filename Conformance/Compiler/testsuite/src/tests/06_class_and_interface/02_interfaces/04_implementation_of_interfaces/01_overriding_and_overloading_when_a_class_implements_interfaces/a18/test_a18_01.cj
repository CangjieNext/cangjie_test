/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a18_01

  @Level:         1

  @Assertion: 6.2.4.1(18)
              Example 2: In the following example,
              two default functions f with different parameter types are declared in I1 and I2.
              No implementation of f in C is required.
              interface I1 {
                func f() {}
              }
              interface I2 {
                func f(a: Int32) {}
              }
              class C <: I1 & I2 {
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {
    func f() {}
}
interface I2 {
    func f(a: Int32) {}
}
class C <: I1 & I2 {
}

main() {
    let c = C()
    Assert.isTrue(c.f() is Unit)
    Assert.isTrue(c.f(1i32) is Unit)
}