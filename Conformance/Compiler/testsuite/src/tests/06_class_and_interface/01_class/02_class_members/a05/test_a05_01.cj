/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a05_01

  @Level:         1

  @Assertion: 6.1.2(5)
              Members are classified into static initializer, constructors, member functions,
              member variables, and member properties based on the member type.

  @Description: Check that all entities mentioned in the assertion can be a class member

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006136

*/

import utils.assert.Assert

var proof_of_call = 0

class A {
  static var a = 1
  static let b = 2

  static func c() {
    return 3
  }

  static mut prop d: Int64 {
    get() {
      4
    }
    set(v) {}
  }

  static prop e: Int64 {
    get() {
      5
    }
  }

  var f = 6
  let g = 7

  func h() {
    return 8
  }

  mut prop i: Int64 {
    get() {
      9
    }
    set(v) {}
  }

  prop j: Int64 {
    get() {
      10
    }
  }

  static private let access_test = 11

  A() {
    proof_of_call++
    Assert.equals(11, access_test)
  }

  init(x: Int64) {
    proof_of_call++
    Assert.equals(11, access_test)
  }

  init(y: String) {
    proof_of_call++
    Assert.equals(11, access_test)
  }

  static init() {
    proof_of_call = 1
    Assert.equals(11, access_test)
  }
}

main() {
  // Check static initializer
  Assert.equals(1, proof_of_call)

  // Check static members
  Assert.equals(1, A.a)
  Assert.equals(2, A.b)
  Assert.equals(3, A.c())
  Assert.equals(4, A.d)
  Assert.equals(5, A.e)

  // Check primary constructor
  let tst = A()
  Assert.equals(2, proof_of_call)

  // Check instance members
  Assert.equals(6, tst.f)
  Assert.equals(7, tst.g)
  Assert.equals(8, tst.h())
  Assert.equals(9, tst.i)
  Assert.equals(10, tst.j)

  // Check init() with an Int64 parameter
  let tmp1 = A(19)
  Assert.equals(3, proof_of_call)

  // Check init() with an String parameter
  let tmp2 = A("SsssSSSss")
  Assert.equals(4, proof_of_call)
}
