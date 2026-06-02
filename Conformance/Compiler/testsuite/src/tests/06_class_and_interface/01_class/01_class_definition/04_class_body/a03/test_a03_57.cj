/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a03_57

  @Level:         1

  @Assertion: 6.1.1.4(3)
              The syntax of a class body is as the following:
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

  @Description: Check that the class body can't contain a return expression

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006151
*/

class Bqiyqbem {
  return 1
}

main() {
}
