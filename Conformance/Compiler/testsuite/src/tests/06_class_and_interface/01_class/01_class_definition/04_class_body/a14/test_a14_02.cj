/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a14_02

  @Level:         1

  @Assertion: 6.1.1.4(14)
              All the preceding are members of a class, for details, see section Class Members.

  @Description: Check that functions defined in the class body are members of the class, i.e:
                1. non-private functions can be accessed outside the class 
                   through a class instance for instance functions and through the class type
                   for static functions
                2. all functions can be accessed directly by name inside the class
                3. functions can access private members of the class

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
  private static let priv_static_var = "S"

  private static func f1() {
    let x = priv_static_var
    Assert.equals("S", x)
    return 1
  }
  
  private static func f2<T>(y: Int64) {
    let x = priv_static_var
    Assert.equals("S", x)
    return 2
  }

  protected static func f3() {
    let x = priv_static_var
    Assert.equals("S", x)
    return 3
  }

  protected static func f4<U, V>() {
    let x = priv_static_var
    Assert.equals("S", x)
    return 4
  }

  static func f5(p: (Int64, Int64)) {
    let x = priv_static_var
    Assert.equals("S", x)
    return 5
  }

  static func f6<T>() {
    let x = priv_static_var
    Assert.equals("S", x)
    return 6
  }

  private func f7() {
    let x = priv_static_var
    Assert.equals("S", x)
    return 7
  }
  
  private func f8<T>() {
    let x = priv_static_var
    Assert.equals("S", x)
    return 8
  }

  protected func f9() {
    let x = priv_static_var
    Assert.equals("S", x)
    return 9
  }

  protected func f10<U, V>() {
    let x = priv_static_var
    Assert.equals("S", x)
    return 10
  }

  func f11(a: Bool, b: Bool) {
    let x = priv_static_var
    Assert.equals("S", x)
    return 11
  }

  func f12<T>() {
    let x = priv_static_var
    Assert.equals("S", x)
    return 12
  }

  func check() {
    Assert.equals(1, f1())
    Assert.equals(2, f2<Unit>(7))
    Assert.equals(3, f3())
    Assert.equals(4, f4<String, String>())
    Assert.equals(5, f5((1, 2)))
    Assert.equals(6, f6<Rune>())
    Assert.equals(7, f7())
    Assert.equals(8, f8<Int64>())
    Assert.equals(9, f9())
    Assert.equals(10, f10<Bool, Bool>())
    Assert.equals(11, f11(false, false))
    Assert.equals(12, f12<(Bool, Bool)>())
  }

  static func check_private() {
    Assert.equals(1, Test.f1())
    Assert.equals(2, Test.f2<String>(12))

    let obj = Test()
    Assert.equals(7, obj.f7())
    Assert.equals(8, obj.f8<Any>())
  }
}

main() {
  Assert.equals(3, Test.f3())
  Assert.equals(4, Test.f4<Unit, String>())
  Assert.equals(5, Test.f5((0, 0)))
  Assert.equals(6, Test.f6<Any>())

  let test = Test()
  Assert.equals(9, test.f9())
  Assert.equals(10, test.f10<Object, Option<Object>>())
  Assert.equals(11, test.f11(true, false))
  Assert.equals(12, test.f12<Nothing>())

  Test.check_private()

  test.check()
}
