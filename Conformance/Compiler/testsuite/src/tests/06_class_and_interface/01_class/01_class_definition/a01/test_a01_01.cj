/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a01_01

  @Level:         1

  @Assertion: 6.1.1(1)
              In the Cangjie programming language, a class is defined using the class keyword.

  @Description: Check that classes are created using the 'class' keyword and that these classes can be instantiated.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class A {
  public let some_var = 1
  public var anotherVar : String = "fjf832vx"
}

class B {
  var a : A = A()
}

class EmptyClass {
}

class StaticClass {
  static let x_X87 = 0.5
}

class BigClass {
  var i : Int32 = 0
  var a : Float64 = 0.5

  static var io38o : String = ""
  static var fna3UHFKHF : String = ""
  static var ooop32 : String = ""

  var someTuple : (Int32, Int32, Int32) = (0, 0, 1)
}

main() {
  var a : A = A()
  var b : B = B()
  var emptyClass : EmptyClass = EmptyClass()
  var staticClass : StaticClass = StaticClass()
  var bc : BigClass = BigClass()

  Assert.isTrue(a is A)
  Assert.isTrue(b is B)
  Assert.isTrue(emptyClass is EmptyClass)
  Assert.isTrue(staticClass is StaticClass)
  Assert.isTrue(bc is BigClass)
}
