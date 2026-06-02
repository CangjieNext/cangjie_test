/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a17_01

  @Level:         1

  @Assertion: 6.2.4.1(17)
              Example 1: In the following example, functions with the same name f
              but different parameter types are declared in I1 and I2.
              One function named f with parameter type Unit and
              one with parameter type Int32 must be implemented in class C.
              interface I1 {
                func f(): Unit
              }
              interface I2 {
                func f(a: Int32): Unit
              }
              class C <: I1 & I2 {
                public func f(): Unit {} // The f in I1 needs to be implemented.
                public func f(a: Int32): Unit {} // The f in I2 needs to be implemented.
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {
    func f(): Unit
}
interface I2 {
    func f(a: Int32): Unit
}
class C <: I1 & I2 {
    public func f(): Unit {} // The f in I1 needs to be implemented.
    public func f(a: Int32): Unit {} // The f in I2 needs to be implemented.
}

main() {
    let c = C()
    Assert.isTrue(c.f() is Unit)
    Assert.isTrue(c.f(1i32) is Unit)
}