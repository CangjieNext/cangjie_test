/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a11_02

  @Level:         1

  @Assertion: 6.1.1.1(11)
              An abstract subclass of an abstract class is not required to implement abstract functions in its superclass.

  @Description: Check that abstract subclasses of an abstract class can leave some of the abstract functions of their superclas undefined

  @Mode: compileonly

  @Negative: no

  @Structure: single

*/

struct S {}

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

  public func f_int(p: Int32): Unit
  public func f_char(p: Rune): Unit
  public func f_bool(p: Bool): Unit
  public func f_string(p: String): Unit
  public func f_tuple(p: (Int32, Float32, Rune, Super)): Unit
  public func f_range(p: Range<Int64>): Unit
  public func f_func(p: () -> Int32): Unit
  public func f_struct(p: S): Unit
  public func f_enum(p: E): Unit
  public func f_class(p: Super): Unit
  public func f_interface(p: I): Unit
  public func f_array(p: Array<Int32>): Unit
}

// Classes that define only one function
abstract class F <: Super {
  public func f() {}
}

abstract class INT_F <: Super {
  public func int_f() {
    return 1i32
  }
}

abstract class CHAR_F <: Super {
  public func char_f() {
    return r'a'
  }
}

abstract class BOOL_F <: Super {
  public func bool_f(): Bool {
    return true
  }
}

abstract class STRING_F <: Super {
  public func string_f(): String {
    return ""
  }
}

abstract class TUPLE_F <: Super {
  public func tuple_f(): (Int32, Float32, Rune, Super) {
    return (1i32, 0.5f32, r'a', this)
  }
}

abstract class RANGE_F <: Super {
  public func range_f(): Range<Int64> {
    return 1..10:2
  }
}

abstract class FUNC_F <: Super {
  public func func_f(): () -> Int32 {
    var x = { => return 1i32 }
    return x
  }
}

abstract class STRUCT_F <: Super {
  public func struct_f(): S {
    var x = S()
    return x
  }
}

abstract class ENUM_F <: Super {
  public func enum_f(): E {
    return B
  }
}

abstract class CLASS_F <: Super {
  public func class_f(): Super {
    return this
  }
}

abstract class INTERFACE_F <: Super {
  public func interface_f(): I {
    return this
  }
}

abstract class ARRAY_F <: Super {
  public func array_f(): Array<Int32> {
    return []
  }
}

abstract class F_INT <: Super {
  public func f_int(p: Int32) {}
}

abstract class F_CHAR <: Super {
  public func f_char(p: Rune) {}
}

abstract class F_BOOL <: Super {
  public func f_bool(p: Bool) {}
}

abstract class F_STRING <: Super {
  public func f_string(p: String) {}
}

abstract class F_TUPLE <: Super {
  public func f_tuple(p: (Int32, Float32, Rune, Super)) {}
}

abstract class F_RANGE <: Super {
  public func f_range(p: Range<Int64>) {}
}

abstract class F_FUNC <: Super {
  public func f_func(p: () -> Int32) {}
}

abstract class F_STRUCT <: Super {
  public func f_struct(p: S) {}
}

abstract class F_ENUM <: Super {
  public func f_enum(p: E) {}
}

abstract class F_CLASS <: Super {
  public func f_class(p: Super) {}
}

abstract class F_INTERFACE <: Super {
  public func f_interface(p: I) {}
}

abstract class F_ARRAY <: Super {
  public func f_array(p: Array<Int32>) {}
}

// Classes that define some combination of abstract functions
abstract class SomeClass <: Super {
  public func f_char(p: Rune) {
    print("1")
  }

  public func bool_f(): Bool {
    return false
  }

  public func tuple_f(): (Int32, Float32, Rune, Super) {
    return (0i32, .0f32, r'0', this)
  }
}

abstract class AnotherClass<T> <: Super {
  public func f() {}
  public func int_f() {
    return 5i32
  }
  public func char_f() {
    return r'b'
  }
  public func bool_f() {
    return true
  }
  public func string_f() {
    return "Mmmmm"
  }
  public func tuple_f(): (Int32, Float32, Rune, Super) {
    return (255i32, 1e-10f32, r'4', this)
  }
  public func range_f() {
    return -100..100:100
  }
  public func func_f() {
    return { => return 10i32}
  }
  public func struct_f() {
    return S()
  }
  public func enum_f() {
    return C
  }
  public func class_f() {
    return this
  }
  public func interface_f() {
    return this
  }
  public func array_f() {
    return [1i32]
  }
}


main() {
}
