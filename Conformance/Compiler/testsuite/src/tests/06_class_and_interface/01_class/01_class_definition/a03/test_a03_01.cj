/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a03_01

  @Level:         1

  @Assertion: 6.1.1(3)
              Classes can be only defined at the top level of a file.

  @Description: Check that classes are correctly defined at the top level of a file

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class OrdinaryClass {
  func foo() {
    return this
  }
  init(x: Int32) {
    mem = x;
  }

  var mem: Int32
}

open class InheritableClass {
  static let cnst = "CONST"
  var non_cnst : String

  InheritableClass(s : String) {
    non_cnst = s
  }
}

abstract class AbstractClass {
  public func abstract_foo() : Float32
}

open class GenericClass<T> {
  var generic_mem : T

  init(x : T) {
    generic_mem = x
  }
}

class ChildClass <: InheritableClass {
  public var child : Int32
  ChildClass(a: Int32, s : String)  {
    super(s)
    child = a
  }
}

class GenericClassWithConstraints<T, U> <: AbstractClass {
  func notAConstructor() {}
  public func abstract_foo() {
    return 1.5f32
  }
}

main() {
  var ordinaryClass = OrdinaryClass(12)
  var inheritableClass = InheritableClass("dsfafasf")
  var genericClass = GenericClass<String>("String")
  var childClass = ChildClass(1, "")
  var genericClassWithConstraints = GenericClassWithConstraints<ChildClass, InheritableClass>()

  Assert.isTrue(ordinaryClass is OrdinaryClass)
  Assert.isTrue(inheritableClass is InheritableClass)
  Assert.isTrue(genericClass is GenericClass<String>)
  Assert.isTrue(childClass is ChildClass)
  Assert.isTrue(genericClassWithConstraints is GenericClassWithConstraints<ChildClass, InheritableClass>)
}
