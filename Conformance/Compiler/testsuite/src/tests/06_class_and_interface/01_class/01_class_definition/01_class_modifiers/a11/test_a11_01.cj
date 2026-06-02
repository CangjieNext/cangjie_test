/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a11_01

  @Level:         1

  @Assertion: 6.1.1.1(11)
              An abstract subclass of an abstract class is not required to implement abstract functions in its superclass.

  @Description: Check that abstract subclasses of an abstract class can leave all of the abstract functions of their superclas undefined

  @Mode: compileonly

  @Negative: no

  @Structure: single

*/

public struct S {}

public enum E {
  A | B | C
}

public interface I {
  func implementation(): Unit
}

public abstract class Super {
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
  //public func varray_f(): VArray<Int32, $10>
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
  //public func f_varray(p: VArray<Int32, $10>): Unit
  public func f_class(p: Super): Unit
  public func f_interface(p: I): Unit
  public func f_array(p: Array<Int32>): Unit

  public open func non_abstract() {
    return 1
  }
}

abstract class JustAbstractChild <: Super {
  func foo() {
    return true
  }

  let x = 5
}

abstract class GenericAbstractChild<T, U, V> <: Super {
  let x: U

  init(_x: U) {
    x = _x
  }
}

abstract class ChildThatAlsoImplementsAnInterface <: Super & I {
  public func implementation() {
    print("Implementation")
  }
}

abstract class GenericInterfaceImplementation<T> <: Super & I {
  public func implementation() {
    print("Another one")
  }
}

abstract class OpenChild <: Super {}

abstract class OpenGenericChild<T> <: Super where T <: Equatable<T> {
  func foo(x: T) {
    return x == m
  }
  let m: T

  OpenGenericChild(_m: T) {
    m = _m
  }
}

public abstract class PublicChild <: Super {
  init() {
    print("1")
  }
}

public abstract class PublicGenericChild<T> <: Super {
  func foobar() {
    return ""
  }
}

public abstract class AllModifiers <: Super {
  let x = 10
  let y = 2e-3
  let z = "0"
}

public abstract class GenericModifiers<U, V> <: Super {
  func foo() {}
}

abstract class OverridingClass <: Super {
  override public func non_abstract() {
    return 0
  }
}

abstract class OverridingGenericClass<T> <: Super {
  override public func non_abstract() {
    return -10
  }
}

abstract class AddsItsOwnAbstractFunctions <: Super {
  public func my_func(): Unit
}

abstract class GenericWithAbstractFunctions<T> <: Super {
  public func generic_func(x: T): T
}

main() {
}
