/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_01_a02_01

  @Level:         1

  @Assertion: 6.2.3.1(2)
              Examples are as follows.
              interface I1 {
                func f1(): Unit
                static func f2(): Unit
              }
              interface I2 <: I1 {
                func f1(): Unit // ok
                static func f2(): Unit // ok
              }
              interface I3 <: I1 {
                override func f1(): Unit // ok
                redef static func f2(): Unit // ok
              }
              interface I4 <: I1 {
                func f1(): Unit {} // ok
                static func f2(): Unit {} // ok
              }
              interface I5 <: I1 {
                override func f1(): Unit {} // ok
                redef static func f2(): Unit {} // ok
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {
    func f1(): Unit
    static func f2(): Unit
}
interface I2 <: I1 {
    func f1(): Unit // ok
    static func f2(): Unit // ok
}
interface I3 <: I1 {
    override func f1(): Unit // ok
    redef static func f2(): Unit // ok
}
interface I4 <: I1 {
    func f1(): Unit {} // ok
    static func f2(): Unit {} // ok
}
interface I5 <: I1 {
    override func f1(): Unit {} // ok
    redef static func f2(): Unit {} // ok
}

class TypeChecker<T> {}

main() {
    let i1 = TypeChecker<I1>()
    Assert.isTrue(i1 is TypeChecker<I1>)

    let i2 = TypeChecker<I2>()
    Assert.isTrue(i2 is TypeChecker<I2>)

    let i3 = TypeChecker<I3>()
    Assert.isTrue(i3 is TypeChecker<I3>)

    let i4 = TypeChecker<I4>()
    Assert.isTrue(i4 is TypeChecker<I4>)

    let i5 = TypeChecker<I5>()
    Assert.isTrue(i5 is TypeChecker<I5>)
}