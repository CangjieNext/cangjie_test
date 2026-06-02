/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a13_01

  @Level:         1

  @Assertion: 6.1.1.4(13)
              propertyDefinition indicates the definition of an properties.

  @Description: Check that properties defined in the class body work as properties:
                they can be accessed by name from object/class type, invoking get function
                and mutable properties can be rewritten, invoking set function

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006159

  @Comment: This assertion references the syntax description for the class body:
            classBody
            : r'{'
            classMemberDeclaration*
            classPrimaryInit?
            classMemberDeclaration*
            '}'
            ;
            classMemberDeclaration
            : classInit
            | staticInit
            | variableDeclaration
            | functionDefinition
            | operatorFunctionDefinition
            | macroExpression
            | propertyDefinition
            ;
*/

import utils.assert.Assert

class Test {
  static mut prop smp: Int64 {
    get() {
      get_counter++
      x
    }
    set(v) {
      set_counter++
      x = v
    }
  }

  static prop sip: Int64 {
    get() {
      get_counter++
      10
    }
  }

  static var x = 1

  static var get_counter = 0
  static var set_counter = 0

  mut prop imp: String {
    get() {
      get_counter++
      y
    }
    set(v) {
      set_counter++
      y = v
    }
  }

  prop iip: Rune {
    get() {
      get_counter++
      r'a'
    }
  }

  var y = ""
}

class GTest<T> {
  GTest(x: T) {
    a = x
  }

  public static mut prop smp: Int64 {
    get() {
      get_counter++
      1
    }
    set(v) {
      set_counter++
      accum += v
    }
  }

  protected static prop sip: Int64 {
    get() {
      get_counter++
      2
    }
  }

  static var accum = 0

  mut prop imp: Int64 {
    get() {
      get_counter++
      3
    }
    set(v) {
      set_counter++
      accum += v
    }
  }

  prop iip: T {
    get() {
      get_counter++
      a
    }
  }

  var a: T

  static var get_counter = 0
  static var set_counter = 0

}

main() {
  Assert.equals(0, Test.set_counter)
  Assert.equals(0, Test.get_counter)

  // Check static properties
  // Read a property, get counter increases
  var smp = Test.smp
  Assert.equals(1, smp)
  Assert.equals(0, Test.set_counter)
  Assert.equals(1, Test.get_counter)
  // Write a property, set counter increases
  Test.smp = 2
  Assert.equals(1, Test.set_counter)
  Assert.equals(1, Test.get_counter)
  // Read a new property value, get counter increases
  smp = Test.smp
  Assert.equals(2, smp)
  Assert.equals(1, Test.set_counter)
  Assert.equals(2, Test.get_counter)
  // Write direclty to the underlying variable, set counter does not increases
  // Read property, value changes, get counter increases
  Test.x = 3
  smp = Test.smp
  Assert.equals(3, smp)
  Assert.equals(1, Test.set_counter)
  Assert.equals(3, Test.get_counter)
  // Read the underlying variable, get counter does not increase
  smp = Test.x
  Assert.equals(3, smp)
  Assert.equals(1, Test.set_counter)
  Assert.equals(3, Test.get_counter)
  // Read immutable property, get counter increases
  let sip = Test.sip
  Assert.equals(10, sip)
  Assert.equals(1, Test.set_counter)
  Assert.equals(4, Test.get_counter)

  Test.set_counter = 0
  Test.get_counter = 0

  // Check instance properties
  // Read a property, get counter increases
  let t1 = Test()
  var imp = t1.imp
  Assert.equals("", imp)
  Assert.equals(0, Test.set_counter)
  Assert.equals(1, Test.get_counter)
  // Write a property, set counter increases
  t1.imp = "s"
  Assert.equals(1, Test.set_counter)
  Assert.equals(1, Test.get_counter)
  // Read a new property value, get counter increases
  imp = t1.imp
  Assert.equals("s", imp)
  Assert.equals(1, Test.set_counter)
  Assert.equals(2, Test.get_counter)
  // Write direclty to the underlying variable, set counter does not increases
  // Read property, value changes, get counter increases
  t1.y = "st"
  imp = t1.imp
  Assert.equals("st", imp)
  Assert.equals(1, Test.set_counter)
  Assert.equals(3, Test.get_counter)
  // Read the underlying variable, get counter does not increase
  imp = t1.y
  Assert.equals("st", imp)
  Assert.equals(1, Test.set_counter)
  Assert.equals(3, Test.get_counter)
  // Read immutable property, get counter increases
  let iip = t1.iip
  Assert.equals(r'a', iip)
  Assert.equals(1, Test.set_counter)
  Assert.equals(4, Test.get_counter)

  // Check static properties of a generic class
  Assert.equals(0, GTest<Bool>.set_counter)
  Assert.equals(0, GTest<Bool>.get_counter)
  // Read a property, get counter increases
  var gsmp = GTest<Bool>.smp
  Assert.equals(1, gsmp)
  Assert.equals(0, GTest<Bool>.set_counter)
  Assert.equals(1, GTest<Bool>.get_counter)
  // Write a property, set counter increases
  GTest<Bool>.smp = 2
  Assert.equals(1, GTest<Bool>.set_counter)
  Assert.equals(1, GTest<Bool>.get_counter)
  Assert.equals(2, GTest<Bool>.accum)
  // Read a property, get counter increases
  gsmp = GTest<Bool>.smp
  Assert.equals(1, gsmp)
  Assert.equals(1, GTest<Bool>.set_counter)
  Assert.equals(2, GTest<Bool>.get_counter)
  // Read immutable property, get counter increases
  let gsip = GTest<Bool>.sip
  Assert.equals(2, gsip)
  Assert.equals(1, GTest<Bool>.set_counter)
  Assert.equals(3, GTest<Bool>.get_counter)

  // Check instance properties of a generic class
  let t2 = GTest<Rune>(r'x')
  Assert.equals(1, GTest<Rune>.set_counter)
  Assert.equals(3, GTest<Rune>.get_counter)
  // Read a property, get counter increases
  var gimp = t2.imp
  Assert.equals(3, gimp)
  Assert.equals(1, GTest<Rune>.set_counter)
  Assert.equals(4, GTest<Rune>.get_counter)
  // Write a property, set counter increases
  t2.imp = 12
  Assert.equals(2, GTest<Rune>.set_counter)
  Assert.equals(4, GTest<Rune>.get_counter)
  Assert.equals(14, GTest<Rune>.accum)
  // Read a property, get counter increases
  gimp = t2.imp
  Assert.equals(3, gimp)
  Assert.equals(2, GTest<Rune>.set_counter)
  Assert.equals(5, GTest<Rune>.get_counter)
  // Read immutable property, get counter increases
  let giip = t2.iip
  Assert.equals(r'x', giip)
  Assert.equals(2, GTest<Rune>.set_counter)
  Assert.equals(6, GTest<Rune>.get_counter)
}
