/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a14_04

  @Level:         1

  @Assertion: 6.1.1.4(14)
              All the preceding are members of a class, for details, see section Class Members.

  @Description: Check that operators defined in the class body are members of the class, i.e:
                operators can access private members of the class

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: All the preceding are: 
            static initializer
            primary constructor
            constructors
            member variables
            member functions and member operator functions
            member properties
            macro expressions

*/

import utils.assert.Assert

class Test {
  private static let priv_static_var = true

  operator func +(rhs: Test) {
    let x = priv_static_var
    Assert.equals(true, x)
    return 1
  }

  operator func -(rhs: Test) {
    let x = priv_static_var
    Assert.equals(true, x)
    return 2
  }

  operator func *(rhs: Test) {
    let x = priv_static_var
    Assert.equals(true, x)
    return 3
  }

  operator func /(rhs: Test) {
    let x = priv_static_var
    Assert.equals(true, x)
    return 4
  }

  operator func %(rhs: Test) {
    let x = priv_static_var
    Assert.equals(true, x)
    return 5
  }

  operator func **(rhs: Test) {
    let x = priv_static_var
    Assert.equals(true, x)
    return 6
  }

  operator func -() {
    let x = priv_static_var
    Assert.equals(true, x)
    return 7
  }

  operator func !() {
    let x = priv_static_var
    Assert.equals(true, x)
    return 8
  }

  operator func ()() {
    let x = priv_static_var
    Assert.equals(true, x)
    return 9
  }

  operator func [](idx: Int64) {
    let x = priv_static_var
    Assert.equals(true, x)
    return 10
  }
}

main() {
  let lhs = Test()
  let rhs = Test()

  Assert.equals(1, lhs + rhs)
  Assert.equals(2, lhs - rhs)
  Assert.equals(3, lhs * rhs)
  Assert.equals(4, lhs / rhs)
  Assert.equals(5, lhs % rhs)
  Assert.equals(6, lhs ** rhs)
  Assert.equals(7, -lhs)
  Assert.equals(8, !rhs)
  Assert.equals(9, lhs())
  Assert.equals(10, rhs[1])
}
