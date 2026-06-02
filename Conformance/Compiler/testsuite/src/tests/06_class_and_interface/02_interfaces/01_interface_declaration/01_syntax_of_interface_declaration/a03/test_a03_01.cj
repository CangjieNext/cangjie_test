/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a03_01

  @Level:         1

  @Assertion: 6.2.1.1(3)
              The following is an example of interface declaration.
              interface I1 {}
              interface I2<T> {}
              interface I3<U> {}
              public interface I4<V> <: I2<V> & I3<Int32> {}

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006313

*/

import utils.assert.Assert

interface I1 {}
interface I2<T> {}
interface I3<U> {}
interface I4<V> <: I2<V> & I3<Int32> {}

class TypeChecker<T> {}

main() {
    let decl1 = TypeChecker<I1>()
    Assert.isTrue(decl1 is TypeChecker<I1>)

    let decl2 = TypeChecker<I2<Rune>>()
    Assert.isTrue(decl2 is TypeChecker<I2<Rune>>)

    let decl3 = TypeChecker<I3<Unit>>()
    Assert.isTrue(decl3 is TypeChecker<I3<Unit>>)

    let decl4 = TypeChecker<I4<Bool>>()
    Assert.isTrue(decl4 is TypeChecker<I4<Bool>>)
}