/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a03_01

  @Level:         1

  @Assertion: 6.1.2(3)
              A static member is a member that can be accessed without instantiating a class object.

  @Description: Check that members of a class modified with static
                can be accessed without instantiating a class object

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

class SimpleClass {
  static var a = 1
  static let b = 2
  protected static var c = 3
  protected static let d = 4
  public static var e = 5
  public static let f = 6
  private static var g = 7
  private static var h = 8

  static func f1() {
    return 9
  }
  static protected func f2(x: Int64, y: Float64) {
    return 10
  }
  static public func f3() {
    return 11
  }
  static private func f4(x: Bool) {
    return 12
  }
  static func f5<T>(x: Rune) {
    return 13
  }
  static protected func f6<T>() {
    return 14
  }
  static public func f7<U, V>() {
    return 15
  }
  static private func f8<A, B, C>() {
    return 16
  }

  static mut prop pa: Int64 {
    get() {
      17
    }
    set(v) {}
  }

  static prop pb: Int64 {
    get() {
      18
    }
  }
  public mut static prop pc: Int64 {
    get() {
      19
    }
    set(v) {}
  }

  public static prop pd: Int64 {
    get() {
      20
    }
  }
  protected static mut prop pe: Int64 {
    get() {
      21
    }
    set(v) {}
  }

  protected static prop pf: Int64 {
    get() {
      22
    }
  }
  private static mut prop pg: Int64 {
    get() {
      23
    }
    set(v) {}
  }

  private static prop ph: Int64 {
    get() {
      24
    }
  }

  static func privateVerify() {
    Assert.equals(7, SimpleClass.g)
    Assert.equals(8, SimpleClass.h)
    Assert.equals(12, SimpleClass.f4(true))
    Assert.equals(16, SimpleClass.f8<Rune, Bool, Rune>())
    Assert.equals(23, SimpleClass.pg)
    Assert.equals(24, SimpleClass.ph)
  }
}

class GenericClass<T> {
  static var a = 25
  static let b = 26
  protected static var c = 27
  protected static let d = 28
  public static var e = 29
  public static let f = 30
  private static var g = 31
  private static var h = 32

  static func f1() {
    return 33
  }
  static protected func f2(x: Int64, y: Float64) {
    return 34
  }
  static public func f3() {
    return 35
  }
  static private func f4(x: Bool) {
    return 36
  }
  static func f5<T>(x: Rune) {
    return 37
  }
  static protected func f6<T>() {
    return 38
  }
  static public func f7<U, V>() {
    return 39
  }
  static private func f8<A, B, C>() {
    return 40
  }

  static mut prop pa: Int64 {
    get() {
      41
    }
    set(v) {}
  }

  static prop pb: Int64 {
    get() {
      42
    }
  }
  public static mut prop pc: Int64 {
    get() {
      43
    }
    set(v) {}
  }

  public static prop pd: Int64 {
    get() {
      44
    }
  }
  protected static mut prop pe: Int64 {
    get() {
      45
    }
    set(v) {}
  }

  protected static prop pf: Int64 {
    get() {
      46
    }
  }
  private static mut prop pg: Int64 {
    get() {
      47
    }
    set(v) {}
  }

  private static prop ph: Int64 {
    get() {
      48
    }
  }

  static func privateVerify() {
    Assert.equals(31, GenericClass<T>.g)
    Assert.equals(32, GenericClass<T>.h)
    Assert.equals(36, GenericClass<T>.f4(true))
    Assert.equals(40, GenericClass<T>.f8<Rune, Bool, Rune>())
    Assert.equals(47, GenericClass<T>.pg)
    Assert.equals(48, GenericClass<T>.ph)
  }
}

open class OpenClass {
  static var a = 49
  static let b = 50
  protected static var c = 51
  protected static let d = 52
  public static var e = 53
  public static let f = 54
  private static var g = 55
  private static var h = 56

  static func f1() {
    return 57
  }
  static protected func f2(x: Int64, y: Float64) {
    return 58
  }
  static public func f3() {
    return 59
  }
  static private func f4(x: Bool) {
    return 60
  }
  static func f5<T>(x: Rune) {
    return 61
  }
  static protected func f6<T>() {
    return 62
  }
  static public func f7<U, V>() {
    return 63
  }
  static private func f8<A, B, C>() {
    return 64
  }

  static mut prop pa: Int64 {
    get() {
      65
    }
    set(v) {}
  }

  static prop pb: Int64 {
    get() {
      66
    }
  }
  public static mut prop pc: Int64 {
    get() {
      67
    }
    set(v) {}
  }

  public static prop pd: Int64 {
    get() {
      68
    }
  }
  protected static mut prop pe: Int64 {
    get() {
      69
    }
    set(v) {}
  }

  protected static prop pf: Int64 {
    get() {
      70
    }
  }
  private static mut prop pg: Int64 {
    get() {
      71
    }
    set(v) {}
  }

  private static prop ph: Int64 {
    get() {
      72
    }
  }

  static func privateVerify() {
    Assert.equals(55, OpenClass.g)
    Assert.equals(56, OpenClass.h)
    Assert.equals(60, OpenClass.f4(true))
    Assert.equals(64, OpenClass.f8<Rune, Bool, Rune>())
    Assert.equals(71, OpenClass.pg)
    Assert.equals(72, OpenClass.ph)
  }
}

abstract class AbstractClass {
  static var a = 73
  static let b = 74
  protected static var c = 75
  protected static let d = 76
  public static var e = 77
  public static let f = 78
  private static var g = 79
  private static var h = 80

  static func f1() {
    return 81
  }
  static protected func f2(x: Int64, y: Float64) {
    return 82
  }
  static public func f3() {
    return 83
  }
  static private func f4(x: Bool) {
    return 84
  }
  static func f5<T>(x: Rune) {
    return 85
  }
  static protected func f6<T>() {
    return 86
  }
  static public func f7<U, V>() {
    return 87
  }
  static private func f8<A, B, C>() {
    return 88
  }

  static mut prop pa: Int64 {
    get() {
      89
    }
    set(v) {}
  }

  static prop pb: Int64 {
    get() {
      90
    }
  }
  public static mut prop pc: Int64 {
    get() {
      91
    }
    set(v) {}
  }

  public static prop pd: Int64 {
    get() {
      92
    }
  }
  protected static mut prop pe: Int64 {
    get() {
      93
    }
    set(v) {}
  }

  protected static prop pf: Int64 {
    get() {
      94
    }
  }
  private static mut prop pg: Int64 {
    get() {
      95
    }
    set(v) {}
  }

  private static prop ph: Int64 {
    get() {
      96
    }
  }

  static func privateVerify() {
    Assert.equals(79, AbstractClass.g)
    Assert.equals(80, AbstractClass.h)
    Assert.equals(84, AbstractClass.f4(true))
    Assert.equals(88, AbstractClass.f8<Rune, Bool, Rune>())
    Assert.equals(95, AbstractClass.pg)
    Assert.equals(96, AbstractClass.ph)
  }
}

main() {
  // Check simple class without generics or modifiers
  Assert.equals(1, SimpleClass.a)
  Assert.equals(2, SimpleClass.b)
  Assert.equals(3, SimpleClass.c)
  Assert.equals(4, SimpleClass.d)
  Assert.equals(5, SimpleClass.e)
  Assert.equals(6, SimpleClass.f)

  Assert.equals(9,  SimpleClass.f1())
  Assert.equals(10, SimpleClass.f2(1, 0.1))
  Assert.equals(11, SimpleClass.f3())
  Assert.equals(13, SimpleClass.f5<Unit>(r'a'))
  Assert.equals(14, SimpleClass.f6<Object>())
  Assert.equals(15, SimpleClass.f7<Int64, Int32>())

  Assert.equals(17, SimpleClass.pa)
  Assert.equals(18, SimpleClass.pb)
  Assert.equals(19, SimpleClass.pc)
  Assert.equals(20, SimpleClass.pd)
  Assert.equals(21, SimpleClass.pe)
  Assert.equals(22, SimpleClass.pf)

  SimpleClass.privateVerify()

  // Check generic class without generics or modifiers
  Assert.equals(25, GenericClass<(Int32, Rune)>.a)
  Assert.equals(26, GenericClass<(Int32, Int32)>.b)
  Assert.equals(27, GenericClass<Int32>.c)
  Assert.equals(28, GenericClass<Object>.d)
  Assert.equals(29, GenericClass<Rune>.e)
  Assert.equals(30, GenericClass<SimpleClass>.f)

  Assert.equals(33, GenericClass<(Int32, Rune)>.f1())
  Assert.equals(34, GenericClass<Any>.f2(1, 0.1))
  Assert.equals(35, GenericClass<(Int32, Rune)>.f3())
  Assert.equals(37, GenericClass<String>.f5<Unit>(r'a'))
  Assert.equals(38, GenericClass<(Int32, Rune)>.f6<Object>())
  Assert.equals(39, GenericClass<Float64>.f7<Int64, Int32>())

  Assert.equals(41, GenericClass<(Int32, Rune)>.pa)
  Assert.equals(42, GenericClass<Int8>.pb)
  Assert.equals(43, GenericClass<Bool>.pc)
  Assert.equals(44, GenericClass<()->String>.pd)
  Assert.equals(45, GenericClass<(Int32, Rune)>.pe)
  Assert.equals(46, GenericClass<Float32>.pf)

  GenericClass<Array<Int64>>.privateVerify()

  // Check simple class with the open modifier
  Assert.equals(49, OpenClass.a)
  Assert.equals(50, OpenClass.b)
  Assert.equals(51, OpenClass.c)
  Assert.equals(52, OpenClass.d)
  Assert.equals(53, OpenClass.e)
  Assert.equals(54, OpenClass.f)

  Assert.equals(57, OpenClass.f1())
  Assert.equals(58, OpenClass.f2(1, 0.1))
  Assert.equals(59, OpenClass.f3())
  Assert.equals(61, OpenClass.f5<Unit>(r'a'))
  Assert.equals(62, OpenClass.f6<Object>())
  Assert.equals(63, OpenClass.f7<Int64, Int32>())

  Assert.equals(65, OpenClass.pa)
  Assert.equals(66, OpenClass.pb)
  Assert.equals(67, OpenClass.pc)
  Assert.equals(68, OpenClass.pd)
  Assert.equals(69, OpenClass.pe)
  Assert.equals(70, OpenClass.pf)

  OpenClass.privateVerify()

  // Check simple class with the abstract modifier
  Assert.equals(73, AbstractClass.a)
  Assert.equals(74, AbstractClass.b)
  Assert.equals(75, AbstractClass.c)
  Assert.equals(76, AbstractClass.d)
  Assert.equals(77, AbstractClass.e)
  Assert.equals(78, AbstractClass.f)

  Assert.equals(81, AbstractClass.f1())
  Assert.equals(82, AbstractClass.f2(1, 0.1))
  Assert.equals(83, AbstractClass.f3())
  Assert.equals(85, AbstractClass.f5<Unit>(r'a'))
  Assert.equals(86, AbstractClass.f6<Object>())
  Assert.equals(87, AbstractClass.f7<Int64, Int32>())

  Assert.equals(89, AbstractClass.pa)
  Assert.equals(90, AbstractClass.pb)
  Assert.equals(91, AbstractClass.pc)
  Assert.equals(92, AbstractClass.pd)
  Assert.equals(93, AbstractClass.pe)
  Assert.equals(94, AbstractClass.pf)

  AbstractClass.privateVerify()
}
