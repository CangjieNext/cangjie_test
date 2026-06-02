/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a12_05

  @Level:         1

  @Assertion: 6.1.1.4(12)
              After macro expanded, the macros must comply with the syntax definition of classMemberDeclaration.

  @Description: Check that a macro that expands into a malformed property is illegal

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: macro_defs.cj

  @Issue: 0006124, 0006158

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

import ml.*

class Test {
  // Expands into: prop p {}
  @MalformedProperty(p)
}

main() {
}
