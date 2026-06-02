/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a05_01

  @Level:         1

  @Assertion: 6.2.1.1(5)
              Interfaces only can be defined in the top level.

  @Description: Check that interfaces can be defined at the top level

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {}

interface I2<T> {}

interface I3 {
    func f(): Unit
    func g(x: Int64): String
}

interface I4 <: I1 {}

interface I5<T> <: I2<T> & I1 {}

class TypeChecker<T> {}

main() {
    let decl1 = TypeChecker<I1>()
    Assert.isTrue(decl1 is TypeChecker<I1>)

    let decl2 = TypeChecker<I2<Rune>>()
    Assert.isTrue(decl2 is TypeChecker<I2<Rune>>)

    let decl3 = TypeChecker<I3>()
    Assert.isTrue(decl3 is TypeChecker<I3>)

    let decl4 = TypeChecker<I4>()
    Assert.isTrue(decl4 is TypeChecker<I4>)

    let decl5 = TypeChecker<I5<Bool>>()
    Assert.isTrue(decl5 is TypeChecker<I5<Bool>>)
}