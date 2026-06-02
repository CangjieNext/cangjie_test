/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a02_01

  @Level:         1

  @Assertion: 6.2.3(2)
              interface I1<T> {}
              interface I2 {}
              interface I3<U> <: I1<U> {} // inherit a generic interface.
              interface I4<V> <: I1<Int32> & I2 {} // inherit multiple interfaces.

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1<T> {}
interface I2 {}
interface I3<U> <: I1<U> {} // inherit a generic interface.
interface I4<V> <: I1<Int32> & I2 {} // inherit multiple interfaces.

class TypeChecker1<T, U> where T <: I1<U> {}
class TypeChecker2<T> where T <: I2 {}

main() {
    let case1 = TypeChecker1<I3<Bool>, Bool>()
    Assert.isTrue(case1 is TypeChecker1<I3<Bool>, Bool>)

    let case2 = TypeChecker1<I4<Rune>, Int32>()
    Assert.isTrue(case2 is TypeChecker1<I4<Rune>, Int32>)

    let case3 = TypeChecker2<I4<String>>()
    Assert.isTrue(case3 is TypeChecker2<I4<String>>)
}