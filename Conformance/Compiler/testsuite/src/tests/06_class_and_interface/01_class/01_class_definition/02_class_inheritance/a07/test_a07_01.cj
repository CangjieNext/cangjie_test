/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a07_01

  @Level:         1

  @Assertion: 6.1.1.2(7)
              For example, a non-generic class C2 and a generic class C3 inherit a generic class C1:
              open class C1<T> {}
              class C2 <: C1<Int32> {}
              class C3<U> <: C1<U> {} 

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

open class C1<T> {}
class C2 <: C1<Int32> {}
class C3<U> <: C1<U> {} 

main() {
  let c2 = C2()
  Assert.isTrue(c2 is C2)
  Assert.isTrue(c2 is C1<Int32>)

  let c3 = C3<Rune>()
  Assert.isTrue(c3 is C3<Rune>)
  Assert.isTrue(c3 is C1<Rune>)
}
