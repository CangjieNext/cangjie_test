/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a05_01

  @Level:         1

  @Assertion: 6.1.2.1(5)
              The keyword func is not allowed before the primary constructor name.

  @Description: Check that a member with the same name as the class,
                without class parameters and with the func keyword
                is treated as a function and not as a constructor

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var constructor_counter = 0

class A {
  func A() {
    constructor_counter++
  }
}

class B {
  public func B() {
    constructor_counter++
  }
}

class C {
  protected func C() {
    constructor_counter++
  }
}

class D {
  private func D() {
    constructor_counter++
  }

  func check_private() {
    D()
  }
}

class E {
  func E(x: Int64) {
    constructor_counter++
  }
}

class F {
  public func F(b!: String = "1") {
    constructor_counter++
  }
}

class G {
  protected func G(a!: Int64) {
    constructor_counter++
  }
}

class H {
  private func H(a: Int64) {
    constructor_counter++
  }

  func check_private() {
    H(10)
  }
}

main() {
  Assert.equals(0, constructor_counter)

  var case1 = A()
  Assert.equals(0, constructor_counter)

  var case2 = B()
  Assert.equals(0, constructor_counter)

  var case3 = C()
  Assert.equals(0, constructor_counter)

  var case4 = D()
  Assert.equals(0, constructor_counter)

  var case5 = E()
  Assert.equals(0, constructor_counter)

  var case6 = F()
  Assert.equals(0, constructor_counter)

  var case7 = G()
  Assert.equals(0, constructor_counter)

  var case8 = H()
  Assert.equals(0, constructor_counter)

  case1.A()
  Assert.equals(1, constructor_counter)
  
  case2.B()
  Assert.equals(2, constructor_counter)

  case3.C()
  Assert.equals(3, constructor_counter)

  case4.check_private()
  Assert.equals(4, constructor_counter)

  case5.E(1)
  Assert.equals(5, constructor_counter)

  case6.F()
  Assert.equals(6, constructor_counter)

  case7.G(a: 10)
  Assert.equals(7, constructor_counter)

  case8.check_private()
  Assert.equals(8, constructor_counter)  
}
