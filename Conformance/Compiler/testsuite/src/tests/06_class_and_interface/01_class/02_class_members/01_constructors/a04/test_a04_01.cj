/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a04_01

  @Level:         1

  @Assertion: 6.1.2.1(4)
              The primary constructor name is the same as the type name.

  @Description: Check that different types of classes can have a primary constructor
                with the same name as the class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

var constructor_counter = 0

class JustAClass {
  JustAClass() {
    constructor_counter++
  }
}

class AGenericClass<T> {
  AGenericClass() {
    constructor_counter++
  }
}

open class InheritableClass {
  InheritableClass() {
    constructor_counter++
  }
}

abstract class AbstractClass <: InheritableClass {
  AbstractClass() {
    constructor_counter++
  }
}

class ChildClass <: AbstractClass {
  ChildClass() {
    constructor_counter++
  }
}

interface I {}
class ImplementingClass <: I {
  ImplementingClass() {
    constructor_counter++
  }
}

class ClassWithInit {
  ClassWithInit() {
    constructor_counter++
  }

  init(x: String) {}
}

class SealedClass {
  SealedClass() {
    constructor_counter++
  }
}

main() {
  Assert.equals(0, constructor_counter)

  let case1 = JustAClass()
  Assert.equals(1, constructor_counter)

  let case2 = AGenericClass<Bool>()
  Assert.equals(2, constructor_counter)

  let case3 = InheritableClass()
  Assert.equals(3, constructor_counter)

  let case4 = ChildClass()
  Assert.equals(6, constructor_counter)

  let case5 = ImplementingClass()
  Assert.equals(7, constructor_counter)

  let case6 = ClassWithInit()
  Assert.equals(8, constructor_counter)

  let case7 = SealedClass()
  Assert.equals(9, constructor_counter)
}
