/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a11_01

  @Level:         1

  @Assertion: 6.1.1.4(11)
              macroExpression indicates the macro invocation expression.

  @Description: Check that macro invocations in the class body are expanded correctly

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: macro_defs.cj

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

import ml.*

class Simple {
  @MacroVar[macro_var]("macro_var")

  @MacroLet[macro_let](10)

  @MacroFunc[f](return 25)

  @MacroFuncNoParens
  func foo() { return 35 }
}

class Generic<T> {
  @MacroVar[macro_var](17)

  @MacroLet[macro_let]('1')

  @MacroFunc[f](return 90)

  @MacroFuncNoParens
  func gee(x: Int64) { return x + 1 }
}

main() {
  var a = Simple()
  Assert.equals("macro_var", a.macro_var)
  Assert.equals(10, a.macro_let)
  Assert.equals(25, a.f())
  Assert.equals(35, a.foo())

  var b = Generic<String>()
  Assert.equals(17, b.macro_var)
  Assert.equals('1', b.macro_let)
  Assert.equals(90, b.f())
  Assert.equals(0, b.gee(-1))
}
