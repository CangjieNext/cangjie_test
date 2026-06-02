/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a42_01

  @Level:         1

  @Assertion: 6.1.2.1(42)
              A constructor is invoked to create an instance object of the containing class.

  @Description: Check that the correct constructor is invoked during instantiation of a class

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var const_id = 0

class A {
  init() {
    const_id = 1
  }

  init(x: String) {
    const_id = 2
  }

  init(a!: Int64, b!: Int64) {
    const_id = 3
  }
}

class B<T> {
  init(x: T, y: T) {
    const_id = 4
  }

  init() {
    const_id = 5
  }

  init(x: Int64, y: Int64, z: Int64) {
    const_id = 6
  }
}

main() {
  let case1 = A()
  Assert.equals(1, const_id)
  Assert.isTrue(case1 is A)

  let case2 = A("str")
  Assert.equals(2, const_id)
  Assert.isTrue(case2 is A)

  let case3 = A(a: 1, b: 2)
  Assert.equals(3, const_id)
  Assert.isTrue(case3 is A)

  let case4 = B<Bool>(true, false)
  Assert.equals(4, const_id)
  Assert.isTrue(case4 is B<Bool>)

  let case5 = B<Unit>()
  Assert.equals(5, const_id)
  Assert.isTrue(case5 is B<Unit>)

  let case6 = B<Rune>(1, 2, 3)
  Assert.equals(6, const_id)
  Assert.isTrue(case6 is B<Rune>)
}