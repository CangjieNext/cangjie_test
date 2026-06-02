/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a32_01

  @Level:         1

  @Assertion: 6.1.2.1(32)
              A class can define one primary constructor.

  @Description: Check that a class can define one primary constructor

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var last_constructor = ""

// No parameters
class A {
  A() {
    last_constructor = "A"
  }
}

// Parameters
class B {
  B(x: Int64) {
    last_constructor = "B"
  }
}

// Generic no parameters
class C<T> {
  C() {
    last_constructor = "C"
  }
}

// Generic parameters
class D<T> {
  D(x: T) {
    last_constructor = "D"
  }
}

// Abstract no parameters
abstract class E {
  E() {
    last_constructor = "E"
  }
}

// Abstract parameters
abstract class F {
  F(a: Bool, b: String) {
    last_constructor = "F"
  }
}

// Open no parameters
open class G <: E {
  G() {
    Assert.equals("E", last_constructor)
    last_constructor = "G"
  }
}

// Open parameters
open class H <: F {
  H(a: Int64) {
    super(false, "")
    Assert.equals("F", last_constructor)
    last_constructor = "H"
  }
}

main() {
  let case1 = A()
  Assert.equals("A", last_constructor)

  let case2 = B(1)
  Assert.equals("B", last_constructor)

  let case3 = C<Bool>()
  Assert.equals("C", last_constructor)

  let case4 = D<String>("1")
  Assert.equals("D", last_constructor)

  let case5 = G()
  Assert.equals("G", last_constructor)

  let case6 = H(10)
  Assert.equals("H", last_constructor)
}