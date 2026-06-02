/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a11_03

  @Level:         1

  @Assertion: 6.1.1.1(11)
              An abstract subclass of an abstract class is not required to implement abstract functions in its superclass.

  @Description: Check that an abstract subclass can define all abstract functions of its abstract superclass

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

struct S {
  var x: Int16
  init(_x: Int16) {
    x = _x
  }
}

enum E {
  A | B | C
}

interface I {}

abstract class Super <: I {
  public func f(): Unit
  public func int_f(): Int32
  public func char_f(): Rune
  public func bool_f(): Bool
  public func string_f(): String
  public func tuple_f(): (Int32, Float32, Rune, Super)
  public func range_f(): Range<Int64>
  public func func_f(): () -> Int32
  public func struct_f(): S
  public func enum_f(): E
  public func class_f(): Super
  public func interface_f(): I
  public func array_f(): Array<Int32>

  public func f_int(p: Int32): Int32
  public func f_char(p: Rune): Int32
  public func f_bool(p: Bool): Int32
  public func f_string(p: String): Int32
  public func f_tuple(p: (Int32, Float32, Rune, Super)): Int32
  public func f_range(p: Range<Int64>): Int32
  public func f_func(p: () -> Int32): Int32
  public func f_struct(p: S): Int32
  public func f_enum(p: E): Int32
  public func f_class(p: Super): Int32
  public func f_interface(p: I): Int32
  public func f_array(p: Array<Int32>): Int32
}

abstract class Child <: Super {
  public func f() {}

  public func int_f() {
    return 1i32
  }

  public func char_f() {
    return r'a'
  }

  public func bool_f(): Bool {
    return true
  }

  public func string_f(): String {
    return ""
  }

  public func tuple_f(): (Int32, Float32, Rune, Super) {
    return (1i32, 0.5f32, r'a', this)
  }

  public func range_f(): Range<Int64> {
    return 1..10:2
  }

  public func func_f(): () -> Int32 {
    var x = { => return 1i32 }
    return x
  }

  public func struct_f(): S {
    var x = S(17i16)
    return x
  }

  public func enum_f(): E {
    return B
  }

  public func class_f(): Super {
    return this
  }

  public func interface_f(): I {
    return this
  }

  public func array_f(): Array<Int32> {
    return []
  }

  public func f_int(p: Int32) {
    return 1i32
  }

  public func f_char(p: Rune) {
    return 2i32
  }

  public func f_bool(p: Bool) {
    return 3i32
  }

  public func f_string(p: String) {
    return 4i32
  }

  public func f_tuple(p: (Int32, Float32, Rune, Super)) {
    return 5i32
  }

  public func f_range(p: Range<Int64>) {
    return 6i32
  }

  public func f_func(p: () -> Int32) {
    return 7i32
  }

  public func f_struct(p: S) {
    return 8i32
  }

  public func f_enum(p: E) {
    return 9i32
  }

  public func f_class(p: Super) {
    return 11i32
  }

  public func f_interface(p: I) {
    return 12i32
  }

  public func f_array(p: Array<Int32>) {
    return 13i32
  }
}

class Test <: Child {}

main() {
  var tst = Test()

  tst.f()
  Assert.equals(1i32, tst.f_int(15i32))
  Assert.equals(2i32, tst.f_char(r'x'))
  Assert.equals(3i32, tst.f_bool(false))
  Assert.equals(4i32, tst.f_string("string"))
  Assert.equals(5i32, tst.f_tuple((1i32, 1e-3f32, r'a', tst)))
  Assert.equals(6i32, tst.f_range(1..100:10))
  Assert.equals(7i32, tst.f_func({ => return 256i32 }))
  Assert.equals(8i32, tst.f_struct(S(1i16)))
  Assert.equals(9i32, tst.f_enum(A))
  Assert.equals(11i32, tst.f_class(tst))
  Assert.equals(12i32, tst.f_interface(tst))
  Assert.equals(13i32, tst.f_array([1, 2]))

  Assert.equals(1i32, tst.int_f())
  Assert.equals(r'a', tst.char_f())
  Assert.equals(true, tst.bool_f())
  Assert.equals("", tst.string_f())
  Assert.equals(1i32, tst.tuple_f()[0])
  Assert.equals(0.5f32, tst.tuple_f()[1])
  Assert.equals(r'a', tst.tuple_f()[2])
  Assert.isTrue(tst.tuple_f()[3] is Super)
  Assert.equals(1..10:2, tst.range_f())
  Assert.equals(1i32, tst.func_f()())
  Assert.equals(17i16, tst.struct_f().x)
  match(tst.enum_f()) {
    case B => Assert.isTrue(true)
    case _ => Assert.isTrue(false)
  }
  Assert.isTrue(tst.class_f() is Super)
  Assert.isTrue(tst.interface_f() is I)
  Assert.equals([], tst.array_f())
}
