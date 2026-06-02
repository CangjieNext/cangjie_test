/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a03_05

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

  @Description: Check that the curly brackets must be macthed: no clothing bracket

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006151
*/

class _fworO {

main() {
}
