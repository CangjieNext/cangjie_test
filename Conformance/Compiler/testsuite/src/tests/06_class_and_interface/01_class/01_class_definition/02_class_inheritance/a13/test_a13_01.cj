/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a13_01

  @Level:         1

  @Assertion: 6.1.1.2(13)
              A child class inherits all the members of its super class, except private members and constructors.

  @Description: Check that a child class can have access to all non-private non-constructor members of its open superclass.

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

open class A {
  static var s_mutVar = 1
  static let s_immutVar = 2

  protected var prot_mutVar = "1"
  protected let prot_immutVar = "2"

  public var pub_mutVar = 20
  public let pub_immutVar = 30

  static func s_f() {
    return 5
  }
  static func s_genF<T>() {
    return 6
  }

  public func pub_f() {
    return 7
  }
  public func pub_genF<T>() {
    return 8
  }

  protected func prot_f() {
    return 9
  }
  protected func prot_getF<T>() {
    return 10
  }

  static prop s_prop: Int64 {
    get() {
      11
    }
  }

  static mut prop s_mut_prop: Int64 {
    get() {
      12
    }
    set(v) {}
  }

  public prop pub_prop: Int64 {
    get() {
      13
    }
  }

  public mut prop pub_mut_prop: Int64 {
    get() {
      14
    }
    set(v) {}
  }

  protected prop prot_prop: Int64 {
    get() {
      15
    }
  }

  protected mut prop prot_mut_prop: Int64 {
    get() {
      16
    }
    set(v) {}
  }
}

class B <: A {
  func test() {
    Assert.equals(1, s_mutVar)
    Assert.equals(2, s_immutVar)

    Assert.equals("1", prot_mutVar)
    Assert.equals("2", prot_immutVar)

    Assert.equals(20, pub_mutVar)
    Assert.equals(30, pub_immutVar)

    Assert.equals(5, s_f())
    Assert.equals(6, s_genF<Rune>())

    Assert.equals(7, pub_f())
    Assert.equals(8, pub_genF<Rune>())

    Assert.equals(9, prot_f())
    Assert.equals(10, prot_getF<Rune>())

    Assert.equals(11, s_prop)
    Assert.equals(12, s_mut_prop)

    Assert.equals(13, pub_prop)
    Assert.equals(14, pub_mut_prop)

    Assert.equals(15, prot_prop)
    Assert.equals(16, prot_mut_prop)
  }
}

main() {
  var test = B()
  test.test()
}
