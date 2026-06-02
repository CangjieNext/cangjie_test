/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a35_01

  @Level:         1

  @Assertion: 6.1.2.1(35)
              The constructor is specified using the init keyword and cannot contain the func keyword

  @Description: Check that constructors can be defined using the 'init' keyword

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var last_const = ""

class A {
  // No params
  init() {
    last_const = "A:init()"
  }

  // One param
  init(x: Int64) {
    last_const = "A:init(${x})"
  }

  // Named params
  init(x: String, y!: Bool, z!: Rune) {
    last_const = "A:init(${x}, ${y}, ${z})"
  }

  // Default params
  init(x: Array<Int64>, y!: Int64 = 5) {
    last_const = "A:init(${x}, ${y})"
  }
}

class B<T1, T2> where T1 <: ToString, T2 <: ToString {
  // Generic, no params
  init() {
    last_const = "B:init()"
  }

  // Generic params
  init(x: T1, y: T2) {
    last_const = "B:init(${x}, ${y})"
  }
}

main() {
  let case1 = A()
  Assert.equals("A:init()", last_const)

  let case2 = A(12)
  Assert.equals("A:init(12)", last_const)

  let case3 = A("str", y: false, z: r's')
  Assert.equals("A:init(str, false, s)", last_const)

  let case4 = A([1, 2, 3])
  Assert.equals("A:init([1, 2, 3], 5)", last_const)

  let case5 = B<Int64, Int64>()
  Assert.equals("B:init()", last_const)

  let case6 = B<String, Int64>("abc", 7)
  Assert.equals("B:init(abc, 7)", last_const)
}