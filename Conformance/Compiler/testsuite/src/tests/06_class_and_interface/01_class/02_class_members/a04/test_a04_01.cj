/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a04_01

  @Level:         1

  @Assertion: 6.1.2(4)
              A instance member is a member that can be accessed through an object
              only after the class object is instantiated.

  @Description: Check that instance members of a class can be accessed through an object of the class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

class SimpleClass {
  var a = 1
  let b = 2
  protected var c = 3
  protected let d = 4
  public var e = 5
  public let f = 6
  private var g = 7
  private var h = 8

  func f1() {
    return 9
  }
  protected func f2(x: Int64, y: Float64) {
    return 10
  }
  public func f3() {
    return 11
  }
  private func f4(x: Bool) {
    return 12
  }
  func f5<T>(x: Rune) {
    return 13
  }
  protected func f6<T>() {
    return 14
  }
  public func f7<U, V>() {
    return 15
  }
  private func f8<A, B, C>() {
    return 16
  }

  mut prop pa: Int64 {
    get() {
      17
    }
    set(v) {}
  }

  prop pb: Int64 {
    get() {
      18
    }
  }
  public mut prop pc: Int64 {
    get() {
      19
    }
    set(v) {}
  }

  public prop pd: Int64 {
    get() {
      20
    }
  }
  protected mut prop pe: Int64 {
    get() {
      21
    }
    set(v) {}
  }

  protected prop pf: Int64 {
    get() {
      22
    }
  }
  private mut prop pg: Int64 {
    get() {
      23
    }
    set(v) {}
  }

  private prop ph: Int64 {
    get() {
      24
    }
  }

  func private_check() {
    let x = SimpleClass()
    Assert.equals(7, x.g)
    Assert.equals(8, x.h)
    Assert.equals(12, x.f4(true))
    Assert.equals(16, x.f8<Rune, Bool, Rune>())
    Assert.equals(23, x.pg)
    Assert.equals(24, x.ph)
  }
}

class GenericClass<T> {
  var a = 25
  let b = 26
  protected var c = 27
  protected let d = 28
  public var e = 29
  public let f = 30
  private var g = 31
  private var h = 32

  func f1() {
    return 33
  }
  protected func f2(x: Int64, y: Float64) {
    return 34
  }
  public func f3() {
    return 35
  }
  private func f4(x: Bool) {
    return 36
  }
  func f5<T>(x: Rune) {
    return 37
  }
  protected func f6<T>() {
    return 38
  }
  public func f7<U, V>() {
    return 39
  }
  private func f8<A, B, C>() {
    return 40
  }

  mut prop pa: Int64 {
    get() {
      41
    }
    set(v) {}
  }

  prop pb: Int64 {
    get() {
      42
    }
  }
  public mut prop pc: Int64 {
    get() {
      43
    }
    set(v) {}
  }

  public prop pd: Int64 {
    get() {
      44
    }
  }
  protected mut prop pe: Int64 {
    get() {
      45
    }
    set(v) {}
  }

  protected prop pf: Int64 {
    get() {
      46
    }
  }
  private mut prop pg: Int64 {
    get() {
      47
    }
    set(v) {}
  }

  private prop ph: Int64 {
    get() {
      48
    }
  }

  func private_check() {
    let x = GenericClass<T>()
    Assert.equals(31, x.g)
    Assert.equals(32, x.h)
    Assert.equals(36, x.f4(true))
    Assert.equals(40, x.f8<Rune, Bool, Rune>())
    Assert.equals(47, x.pg)
    Assert.equals(48, x.ph)
  }
}

open class OpenClass {
  var a = 49
  let b = 50
  protected var c = 51
  protected let d = 52
  public var e = 53
  public let f = 54
  private var g = 55
  private var h = 56

  func f1() {
    return 57
  }
  protected func f2(x: Int64, y: Float64) {
    return 58
  }
  public func f3() {
    return 59
  }
  private func f4(x: Bool) {
    return 60
  }
  func f5<T>(x: Rune) {
    return 61
  }
  protected func f6<T>() {
    return 62
  }
  public func f7<U, V>() {
    return 63
  }
  private func f8<A, B, C>() {
    return 64
  }

  mut prop pa: Int64 {
    get() {
      65
    }
    set(v) {}
  }

  prop pb: Int64 {
    get() {
      66
    }
  }
  public mut prop pc: Int64 {
    get() {
      67
    }
    set(v) {}
  }

  public prop pd: Int64 {
    get() {
      68
    }
  }
  protected mut prop pe: Int64 {
    get() {
      69
    }
    set(v) {}
  }

  protected prop pf: Int64 {
    get() {
      70
    }
  }
  private mut prop pg: Int64 {
    get() {
      71
    }
    set(v) {}
  }

  private prop ph: Int64 {
    get() {
      72
    }
  }

  func private_check() {
    let x = OpenClass()
    Assert.equals(55, x.g)
    Assert.equals(56, x.h)
    Assert.equals(60, x.f4(true))
    Assert.equals(64, x.f8<Rune, Bool, Rune>())
    Assert.equals(71, x.pg)
    Assert.equals(72, x.ph)
  }
}

main() {
  // Check simple class without generics or modifiers
  let tst1 = SimpleClass()
  Assert.equals(1, tst1.a)
  Assert.equals(2, tst1.b)
  Assert.equals(3, tst1.c)
  Assert.equals(4, tst1.d)
  Assert.equals(5, tst1.e)
  Assert.equals(6, tst1.f)

  Assert.equals(9,  tst1.f1())
  Assert.equals(10, tst1.f2(1, 0.1))
  Assert.equals(11, tst1.f3())
  Assert.equals(13, tst1.f5<Unit>(r'a'))
  Assert.equals(14, tst1.f6<Object>())
  Assert.equals(15, tst1.f7<Int64, Int32>())

  Assert.equals(17, tst1.pa)
  Assert.equals(18, tst1.pb)
  Assert.equals(19, tst1.pc)
  Assert.equals(20, tst1.pd)
  Assert.equals(21, tst1.pe)
  Assert.equals(22, tst1.pf)

  tst1.private_check()

  // Check generic class without generics or modifiers
  let tst2 = GenericClass<String>()
  Assert.equals(25, tst2.a)
  Assert.equals(26, tst2.b)
  Assert.equals(27, tst2.c)
  Assert.equals(28, tst2.d)
  Assert.equals(29, tst2.e)
  Assert.equals(30, tst2.f)

  Assert.equals(33, tst2.f1())
  Assert.equals(34, tst2.f2(1, 0.1))
  Assert.equals(35, tst2.f3())
  Assert.equals(37, tst2.f5<Unit>(r'a'))
  Assert.equals(38, tst2.f6<Object>())
  Assert.equals(39, tst2.f7<Int64, Int32>())

  Assert.equals(41, tst2.pa)
  Assert.equals(42, tst2.pb)
  Assert.equals(43, tst2.pc)
  Assert.equals(44, tst2.pd)
  Assert.equals(45, tst2.pe)
  Assert.equals(46, tst2.pf)

  tst2.private_check()

  // Check simple class with the open modifier
  let tst3 = OpenClass()
  Assert.equals(49, tst3.a)
  Assert.equals(50, tst3.b)
  Assert.equals(51, tst3.c)
  Assert.equals(52, tst3.d)
  Assert.equals(53, tst3.e)
  Assert.equals(54, tst3.f)

  Assert.equals(57, tst3.f1())
  Assert.equals(58, tst3.f2(1, 0.1))
  Assert.equals(59, tst3.f3())
  Assert.equals(61, tst3.f5<Unit>(r'a'))
  Assert.equals(62, tst3.f6<Object>())
  Assert.equals(63, tst3.f7<Int64, Int32>())

  Assert.equals(65, tst3.pa)
  Assert.equals(66, tst3.pb)
  Assert.equals(67, tst3.pc)
  Assert.equals(68, tst3.pd)
  Assert.equals(69, tst3.pe)
  Assert.equals(70, tst3.pf)

  tst3.private_check()
}