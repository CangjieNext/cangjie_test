/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a12_01

  @Level:         1

  @Assertion: 6.1.1.4(12)
              After macro expanded, the macros must comply with the syntax definition of classMemberDeclaration.

  @Description: Check that macros expanded into valid class members work correctly

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: macro_defs.cj

  @Issue: 0006136, 0006124, 0006158

  @Comment: classMemberDeclaration is:
            classInit
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

class Test {
  @StaticVar[sv](1)

  @InstanceVar[mv](10)

  @PrimaryConstructor[Test](sv = 5)

  @InitConstructor[a](sv)

  @StaticInitializer(sv = 2)

  @Function[foo](12)

  @GenericFunction[bar](13)

  @StaticFunction[sfunc]("static")

  @OperatorOverload[[](idx: Int64)](idx + 1)

  @Property[prp](1000000)

  @StaticProperty[sprp](1111)

  @AnotherMacro[foobar](14)
}

main() {
  Assert.equals(2, Test.sv)
  Assert.equals("static", Test.sfunc())
  Assert.equals(1111, Test.sprp)

  let t1 = Test()
  Assert.equals(5, Test.sv)
  Assert.equals(10, t1.mv)
  Assert.equals(10, t1.mv)
  Assert.equals(12, t1.foo())
  Assert.equals(13, t1.bar<Unit, String>())
  Assert.equals(11, t1[10])
  Assert.equals(1000000, t1.prp)
  Assert.equals(14, t1.foobar())

  let t2 = Test(10)
  Assert.equals(10, Test.sv)
}
