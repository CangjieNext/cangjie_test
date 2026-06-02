/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a10_01

  @Level:         1

  @Assertion: 6.1.1.3(10)
              For example:
              interface I1 {}
              class C1 <: I1 & I1 {} // error
              interface I2<T> {}
              class C2 <: I2<Int32> & I2<Int32> {} // error
              class C3<T> <: I2<T> & I2<Int32> {} // ok

  @Description: Check the positive case from the example

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1 {}
interface I2<T> {}
class C3<T> <: I2<T> & I2<Int32> {} // ok

main() {
  var c3 = C3<Rune>()
  Assert.isTrue(c3 is C3<Rune>)
  Assert.isTrue(c3 is I2<Rune>)
  Assert.isTrue(c3 is I2<Int32>)
}
