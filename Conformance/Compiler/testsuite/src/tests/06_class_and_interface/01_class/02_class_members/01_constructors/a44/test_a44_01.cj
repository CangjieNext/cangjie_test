/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a44_01

  @Level:         1

  @Assertion: 6.1.2.1(44)
              A class may contain multiple constructors
              as long as the constructors satisfy the requirements of function overloading.

  @Description: Check that a class can contain multiple constructors

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var id = 0

class Test<T> {
  // Different number of parameters
  init() {
    id = 1
  }

  init(x1: Int64) {
    id = 2
  }

  init(x1: Int64, x2: Int64) {
    id = 3
  }

  init(x1: Int64, x2: Int64, x3!: Int64) {
    id = 4
  }

  // Different types
  init(x: String) {
    id = 5
  }

  init(x: Rune) {
    id = 6
  }

  init(x: Bool) {
    id = 7
  }

  init(x: Rune, y: String) {
    id = 8
  }

  init(x: String, y: Rune) {
    id = 9
  }

  init(x: String, y: String) {
    id = 10
  }

  init(x: Rune, y: Rune) {
    id = 11
  }

  // Different generic instantiations
  init(x: Array<Int64>) {
    id = 12
  }

  init(x: Array<String>) {
    id = 13
  }

  init(x: Array<Float64>) {
    id = 14
  }

  // Satisfies overloading only in specific instantiations
  init(x: T) {
    id = 15
  }

  init(x: T, y: T) {
    id = 16
  }
}

main() {
  let case1 = Test<Unit>()
  Assert.equals(1, id)

  let case2 = Test<Unit>(1)
  Assert.equals(2, id)

  let case3 = Test<Unit>(1, 1)
  Assert.equals(3, id)

  let case4 = Test<Unit>(1, 1, x3: 1)
  Assert.equals(4, id)

  let case5 = Test<Unit>("")
  Assert.equals(5, id)

  let case6 = Test<Unit>(r'e')
  Assert.equals(6, id)

  let case7 = Test<Unit>(false)
  Assert.equals(7, id)

  let case8 = Test<Float16>(r'1', "1")
  Assert.equals(8, id)

  let case9 = Test<Float16>("1", r'1')
  Assert.equals(9, id)

  let case10 = Test<Float16>("1", "1")
  Assert.equals(10, id)

  let case11 = Test<Float16>(r'1', r'1')
  Assert.equals(11, id)

  let case12 = Test<Unit>([1, 0, 0, 0])
  Assert.equals(12, id)

  let case13 = Test<Unit>(["", "fasf", "eqd"])
  Assert.equals(13, id)

  let case14 = Test<Unit>([0.1, 0.01, 0.001])
  Assert.equals(14, id)

  let case15 = Test<(Int64, String)>((10, "10"))
  Assert.equals(15, id)

  let case16 = Test<(Int64, String)>((1, "one"), (2, "two"))
  Assert.equals(16, id)
}