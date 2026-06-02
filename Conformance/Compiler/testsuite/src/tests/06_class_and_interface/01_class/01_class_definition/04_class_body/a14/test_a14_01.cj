/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a14_01

  @Level:         1

  @Assertion: 6.1.1.4(14)
              All the preceding are members of a class, for details, see section Class Members.

  @Description: Check that variables declared in the class body are members of the class, i.e:
                1. non-private variables can be accessed outside the class 
                   through a class instance for instance variables and through the class type
                   for static variables
                2. all variables can be accessed directly by name inside the class

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
  private static var a = 1
  private static let b = 2
  protected static var c = 3
  protected static let d = 4
  static var e = 5
  static let f = 6

  private var g = 7
  private let h = 8
  protected var i = 9
  protected let j = 10
  var k = 11
  let l = 12

  func check() {
    Assert.equals(1, a)
    Assert.equals(2, b)
    Assert.equals(3, c)
    Assert.equals(4, d)
    Assert.equals(5, e)
    Assert.equals(6, f)
    Assert.equals(7, g)
    Assert.equals(8, h)
    Assert.equals(9, i)
    Assert.equals(10, j)
    Assert.equals(11, k)
    Assert.equals(12, l)
  }

  static func check_private() {
    Assert.equals(1, Test.a)
    Assert.equals(2, Test.b)

    let obj = Test()
    Assert.equals(7, obj.g)
    Assert.equals(8, obj.h)
  }
}

main() {
  Assert.equals(3, Test.c)
  Assert.equals(4, Test.d)
  Assert.equals(5, Test.e)
  Assert.equals(6, Test.f)

  let test = Test()
  Assert.equals(9, test.i)
  Assert.equals(10, test.j)
  Assert.equals(11, test.k)
  Assert.equals(12, test.l)

  Test.check_private()

  test.check()
}
