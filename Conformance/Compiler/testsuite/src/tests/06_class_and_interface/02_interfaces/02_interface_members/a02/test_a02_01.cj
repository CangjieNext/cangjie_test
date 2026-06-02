/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_a02_01

  @Level:         1

  @Assertion: 6.2.2(2)
              As shown in the following example, the members of I2
              include the members that are allowed to be inherited in I1.
              interface I1 {
                func f(): Unit
              }
              interface I2 <: I1 {}

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {
    func f(): Unit
}
interface I2 <: I1 {}

class A <: I2 {
    public func f() {}
}

func f(x: I2) {
    Assert.isTrue(x.f() == ())
}

main() {
    f(A())
}