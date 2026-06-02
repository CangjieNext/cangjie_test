/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a06_01

  @Level:         1

  @Comment: This assertion is a part of the list with the following heading:
            A primary constructor definition including the following:

  @Assertion: 6.1.2.1(6)
              Parameter list: The primary constructor name is followed by a parameter list.

  @Description: Check that the primary constructor of a class has a parameter list

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var global_indicator = 0

// Empty parameter list
class A {
  A() {
    global_indicator++
  }
}

// Unnamed parameters
class B {
  B(x: Int64, y: String) {
    global_indicator++
  }
}

// Named parameters
class C {
  C(a!: Float64, b!: Rune = r'a') {
    global_indicator++
  }
}

// Unnamed class parameters
class D {
  D(private let m: Int64) {
    global_indicator++
  }
}

// Name class parameters
class E {
  E(public let x!: String = "", protected var p!: Int64) {
    global_indicator++
  }
}

// Almost all parameters
class F {
  F(a: Int64, b!: Int64, var c!: Int64) {
    global_indicator++
  }
}

main() {
  Assert.equals(0, global_indicator)

  var case1 = A()
  Assert.equals(1, global_indicator)

  var case2 = B(15, "")
  Assert.equals(2, global_indicator)

  var case3 = C(a: 12.5, b: r'a')
  Assert.equals(3, global_indicator)

  var case4 = D(98)
  Assert.equals(4, global_indicator)

  var case5 = E(x: "12", p:12)
  Assert.equals(5, global_indicator)

  var case6 = F(90, b:9, c:0)
  Assert.equals(6, global_indicator)
}
