/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a06_01

  @Level:         1

  @Assertion: 6.2.3(6)
              For example:
              interface I1 {}
              interface I2 <: I1 & I1 {} // error
              interface I3<T> {}
              interface I4 <: I3<Int32> & I3<Int32> {} // error
              interface I5<T> <: I3<T> & I3<Int32> {} // ok

  @Description: Check that the example without erroneous lines works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {}
interface I3<T> {}
interface I5<T> <: I3<T> & I3<Int32> {} // ok

class A<T> <: I5<T> {}

main() {
    let x = A<Bool>()
    Assert.isTrue(x is I3<Bool>)
    Assert.isTrue(x is I3<Int32>)
}