/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a04_01

  @Level:         1

  @Assertion: 6.1.1.4(4)
              staticInit indicates the definition of the static initializer.

  @Description: Check that static initializer in the class body works as a static initializer:
                unitialized static variables will be initialized by it
                and initialized ones will be rewritten

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006136

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

class A {
  static init() {
    immut_var = 1
    mut_var = 2
    mut_var_init = 3
  }

  static let immut_var: Int64
  static var mut_var: Int64
  static var mut_var_init = 25
}

class B<T> {
  static init() {
    immut_var = 4
    mut_var = 5
    mut_var_init = 6
  }

  static let immut_var: Int64
  static var mut_var: Int64
  static var mut_var_init = 10
}

main() {
  Assert.equals(1, A.immut_var)
  Assert.equals(2, A.mut_var)
  Assert.equals(3, A.mut_var_init)

  Assert.equals(4, B<Int64>.immut_var)
  Assert.equals(5, B<Int64>.mut_var)
  Assert.equals(6, B<Int64>.mut_var_init)
}
