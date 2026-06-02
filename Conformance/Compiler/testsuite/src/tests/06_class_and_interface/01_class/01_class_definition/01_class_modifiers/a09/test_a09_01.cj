/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a09_01

  @Level:         1

  @Assertion: 6.1.1.1(9)
              Private abstract functions cannot be declared in abstract classes.

  @Description: Check that non-private functions can be abstract

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class A {
  public var x: Int32
  A(_x: Int32) {
    x = _x
  }
}

enum Week {
  MONDAY |
  TUESDAY|
  WEDNESDAY |
  MORE
}

func global_func(): Int32 {
  return 500
}

abstract class AbstractExample {
  // Test different modifiers
  protected func prot_foo(): Int32
  public func pub_foo(): Int32
  public open func pub_open_foo(): Int32
  protected open func prot_open_foo(): Int32

  // Test different signatures
  // 1. No paramters
  public func void_f_void(): Unit
  public func int_f_void(): Int32
  public func float_f_void(): Float64
  public func bool_f_void(): Bool
  public func class_f_void(): A
  public func tuple_f_void(): (Int32, Int32)
  public func range_f_void(): Range<Int64>
  public func func_f_void(): ()->Int32
  public func string_f_void(): String
  public func enum_f_void(): Week

  // 2. One parameter
  public func int_f_int(x: Int32): Int32
  public func float_f_float(x: Float64): Float64
  public func int_f_bool(x: Bool): Int32
  public func bool_f_class(x: A): Bool
  public func tuple_f_tuple(x: (Int32, Int32)): (Int32, Int32)
  public func int_f_range(x: Range<Int64>): Int64
  public func int_f_func(x: ()->Int32): Int32
  public func string_f_string(x: String): String
  public func bool_f_enum(x: Week): Bool

  // 3. Many paramteres
  public func int_f_int_x_10(a: Int32, b: Int32, c: Int32, d: Int32, e: Int32, f: Int32, g:Int32, h: Int32, i: Int32, j: Int32): Int32
  public func bool_f_class_float_string(x: A, y: Float32, z: String): Bool
}

class TestClass <: AbstractExample {
  protected func prot_foo(): Int32 {
    return 1
  }
  
  public func pub_foo(): Int32 {
    return 2
  }

  public func pub_open_foo(): Int32 {
    return 3
  }

  protected func prot_open_foo(): Int32 {
    return 4
  }

  public func void_f_void() {}

  public func int_f_void() {
    return 42i32
  }

  public func float_f_void() {
    return 0.5f64
  }

  public func bool_f_void() {
    return false
  }

  public func class_f_void() {
    return A(10)
  }

  public func tuple_f_void() {
    return (10i32, 10i32)
  }

  public func range_f_void() {
    return 0..10:1
  }

  public func func_f_void() {
    return global_func
  }

  public func string_f_void() {
    return "String"
  }

  public func enum_f_void() {
    return MONDAY
  }

  public func int_f_int(x: Int32): Int32 {
    return x + 1
  }

  public func float_f_float(x: Float64): Float64 {
    return x / 2.0f64
  }

  public func int_f_bool(x: Bool): Int32 {
    return 15
  }

  public func bool_f_class(x: A): Bool {
    return (x.x > 10)
  }

  public func tuple_f_tuple(x: (Int32, Int32)): (Int32, Int32) {
    return (x[1], x[0])
  }

  public func int_f_range(x: Range<Int64>): Int64 {
    var sum: Int64 = 0
    for (number in x) {
      sum = sum + number
    }
    return sum
  }

  public func int_f_func(x: ()->Int32): Int32 {
    return x()
  }

  public func string_f_string(x: String): String {
    return x
  }

  public func bool_f_enum(x: Week): Bool {
    return true
  }

  public func int_f_int_x_10(a: Int32, b: Int32, c: Int32, d: Int32, e: Int32, f: Int32, g:Int32, h: Int32, i: Int32, j: Int32): Int32 {
    return a + b +c + d + e + f + g + h + i + j
  }

  public func bool_f_class_float_string(x: A, y: Float32, z: String): Bool {
    return z == ""
  }
}

main() {
  let tst = TestClass()

  Assert.equals(1, tst.prot_foo())
  Assert.equals(2, tst.pub_foo())
  Assert.equals(3, tst.pub_open_foo())
  Assert.equals(4, tst.prot_open_foo())

  tst.void_f_void()

  Assert.equals(42, tst.int_f_void())
  Assert.equals(0.5f64, tst.float_f_void()) // don't need approxEquals here, 0.5 has an exact representation
  Assert.isFalse(tst.bool_f_void())
  Assert.equals(10, tst.class_f_void().x)
  Assert.equals(10i32, tst.tuple_f_void()[0])
  Assert.equals(10i32, tst.tuple_f_void()[1])
  Assert.equals(0..10:1, tst.range_f_void())
  Assert.equals(500, tst.func_f_void()())
  Assert.equals("String", tst.string_f_void())

  match(tst.enum_f_void()) {
    case MONDAY => Assert.isTrue(true)
    case _ => Assert.isTrue(false)
  }

  Assert.equals(2, tst.int_f_int(1))
  Assert.equals(0.25f64, tst.float_f_float(0.5f64))
  Assert.equals(15, tst.int_f_bool(false))
  Assert.isTrue(tst.bool_f_class(A(12)))
  Assert.equals(2i32, tst.tuple_f_tuple((1i32, 2i32))[0])
  Assert.equals(1i32, tst.tuple_f_tuple((1i32, 2i32))[1])
  Assert.equals(45, tst.int_f_range(1..10:1))
  Assert.equals(500, tst.int_f_func(global_func))
  Assert.equals("1", tst.string_f_string("1"))
  Assert.isTrue(tst.bool_f_enum(WEDNESDAY))
  Assert.equals(100, tst.int_f_int_x_10(10, 10, 10, 10, 10, 10, 10, 10, 10, 10))
  Assert.isFalse(tst.bool_f_class_float_string(A(0), 0.5f32, "faf"))
}
