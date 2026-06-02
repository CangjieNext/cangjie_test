/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a07_01

  @Level:         1

  @Assertion: 6.1.1.3(7)
              For example:
              interface I1<T> {}
              interface I2<U> {}
              class C1 <: I1<Int32> & I2<Bool> {}
              class C2<K, V> <: I1<V> & I2<K> {}

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I1<T> {}
interface I2<U> {}
class C1 <: I1<Int32> & I2<Bool> {}
class C2<K, V> <: I1<V> & I2<K> {}

main() {
  let c1 = C1()
  Assert.isTrue(c1 is C1)
  Assert.isTrue(c1 is I1<Int32>)
  Assert.isTrue(c1 is I2<Bool>)

  let c2 = C2<Rune, String>()
  Assert.isTrue(c2 is C2<Rune, String>)
  Assert.isTrue(c2 is I1<String>)
  Assert.isTrue(c2 is I2<Rune>)
}
