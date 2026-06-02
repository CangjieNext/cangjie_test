/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a14_05

  @Level:         1

  @Assertion: 6.2.4.1(14)
              More examples:
              // case 1
              interface I1 {
                func f(): Unit
              }
              interface I2 {
                func f(): Unit
              }
              class A <: I1 & I2 {
                public func f(): Unit {} // ok
              }
              // case 2
              interface I1 {
                func f(): Unit
              }
              interface I2 {
                func f(): Unit {}
              }
              open class A {
                public open func f(): Unit {} // ok
              }
              class B <: A & I1 & I2 {
                public override func f(): Unit {} // ok
              }
              // case 3
              interface I1 {
                func f(): Unit
              }
              interface I2 {
                func f(): Unit {}
              }
              class A <: I1 & I2 {} // ok, f from I2
              // case 4
              interface I1 {
                func f(): Unit {}
              }
              interface I2 {
                func f(): Unit {}
              }
              class A <: I1 & I2 {} // error
              class B <: I1 & I2 { // ok,
                func f(): Unit {}
              }
              // case 5
              interface I1 {
                func f(a: Int): Unit {}
              }
              interface I2 {
                func f(a: Int): Unit {}
              }
              open class A {
                public open func f(a: Int): Unit {}
              }
              open class B <: A & I1 & I2{ // ok, f from A
              }

  @Description: Check the fifth case from the example

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006418

*/

import utils.assert.Assert

// case 5
interface I1 {
    func f(a: Int): Unit {}
}
interface I2 {
    func f(a: Int): Unit {}
}
open class A {
    public open func f(a: Int): Unit {}
}
open class B <: A & I1 & I2{ // ok, f from A
}

main() {
    let x = B()
    Assert.isTrue(x is A)
    Assert.isTrue(x is B)
    Assert.isTrue(x is I1)
    Assert.isTrue(x is I2)
    Assert.isTrue(x.f(1) is Unit)
}