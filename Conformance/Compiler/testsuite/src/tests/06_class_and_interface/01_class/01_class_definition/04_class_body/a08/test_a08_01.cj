/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a08_01

  @Level:         1

  @Assertion: 6.1.1.4(8)
              init indicates the definition of the init constructor.

  @Description: Check that init constructor in the class body works as an init constructor:
                it should be called during creation of an object and it should initialize instance variables

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006152

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

var init_counter = 0

class SimpleInit {
  init() {
    init_counter++
  }
}

class GenericInit<T> {
  init() {
    init_counter++
    x = 30
  }
  let x: Int64
}

class InitWithParams {
  init(x: String, y: Bool) {
    init_counter++
    a = x
    b = y
  }
  let a: String
  var b = false
}

class ManyInits {
  init() {
    init_counter++
    x = 1
  }
  init(_x: Int64) {
    init_counter++
    x = _x
  }
  init(a: Bool) {
    init_counter++
    if (a) {
      x = 10
    } else {
      x = 12
    }
  }
  init(p1: Rune, p2: String) {
    init_counter++
    x = 20
  }

  var x: Int64
}

main() {
  Assert.equals(0, init_counter)
  
  var a = SimpleInit()
  Assert.equals(1, init_counter)

  var b = GenericInit<Unit>()
  Assert.equals(2, init_counter)
  Assert.equals(30, b.x)

  var c = InitWithParams("S", true)
  Assert.equals(3, init_counter)
  Assert.equals("S", c.a)
  Assert.equals(true, c.b)

  var d1 = ManyInits()
  Assert.equals(4, init_counter)
  Assert.equals(1, d1.x)

  var d2 = ManyInits(500)
  Assert.equals(5, init_counter)
  Assert.equals(500, d2.x)

  var d3 = ManyInits(false)
  Assert.equals(6, init_counter)
  Assert.equals(12, d3.x)

  var d4 = ManyInits(r'f', "")
  Assert.equals(7, init_counter)
  Assert.equals(20, d4.x)
}
