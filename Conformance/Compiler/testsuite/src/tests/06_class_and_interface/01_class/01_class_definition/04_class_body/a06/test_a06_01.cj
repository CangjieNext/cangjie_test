/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a06_01

  @Level:         1

  @Assertion: 6.1.1.4(6)
              primaryInit indicates the definition of the primary constructor.

  @Description: Check that primary construtor in the class body works as a primary constructor:
                it should be called during creation of an object and it should initialize instance variables

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006152

  @Comment: This assertion references the syntax description for the class body:
            classBody
            : '{'
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

var indicator = 0

class SimpleClass {
  SimpleClass() {
    indicator++

    x = 1
    y = 2
  }
  
  let x: Int64
  var y = 1
}

class GenericClass<T> {
  GenericClass(_x: T) {
    indicator++
    x = _x
    y = 10
  }

  let x: T
  var y: Int64
}

class MemberParams {
  MemberParams(var a: Int64, let b: Bool) {
    indicator++
  }
}

main() {
  Assert.equals(0, indicator)

  var sc = SimpleClass()
  Assert.equals(1, indicator)
  Assert.equals(1, sc.x)
  Assert.equals(2, sc.y)

  var sc2 = SimpleClass()
  Assert.equals(2, indicator)
  Assert.equals(1, sc2.x)
  Assert.equals(2, sc2.y)

  var gen_str = GenericClass<String>("1")
  Assert.equals(3, indicator)
  Assert.equals("1", gen_str.x)
  Assert.equals(10, gen_str.y)

  var gen_int = GenericClass<Int64>(42)
  Assert.equals(4, indicator)
  Assert.equals(42, gen_int.x)
  Assert.equals(10, gen_int.y)

  var mem_param = MemberParams(11, false)
  Assert.equals(5, indicator)
  Assert.equals(11, mem_param.a)
  Assert.equals(false, mem_param.b)

}
