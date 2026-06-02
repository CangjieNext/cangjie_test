/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a10_01

  @Level:         1

  @Assertion: 6.1.1.4(10)
              operatorFunctionDefinition indicates the definition of an operator overloading member function.

  @Description: Check that operators defined in the class body will provide the ability
                to use operators for the objects of this class

  @Mode: run

  @Negative: no

  @Structure: single

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

class NonGeneric {
  operator func!() {
    return false
  }
  operator func+(rhs: NonGeneric) {
    return x + rhs.x
  }
  operator func()(_x: Int64) {
    return x * _x
  }

  NonGeneric(let x: Int64) {}
}

class Generic<T> {
  operator func-(rhs:Generic<T>) {
    return 25
  }
  operator func-() {
    return 26
  }
  operator func[](idx: Int64) {
    return "${idx}"
  }
}

main() {
  let n1 = NonGeneric(10)
  let n2 = NonGeneric(20)

  let a = n1 + n2
  Assert.equals(30, a)

  let b = !n1
  Assert.equals(false, b)

  let c = n2(10)
  Assert.equals(200, c)

  let g1 = Generic<Bool>()
  let g2 = Generic<Bool>()

  let d = g1 - g2
  Assert.equals(25, d)

  let e = -g1
  Assert.equals(26, e)

  let f = g2[12]
  Assert.equals("12", f)
}
