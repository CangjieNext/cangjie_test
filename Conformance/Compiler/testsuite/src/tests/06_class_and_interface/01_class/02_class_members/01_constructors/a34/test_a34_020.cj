/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a34_020

  @Level:         1

  @Assertion: 6.1.2.1(34)
              A constructor has the following dedicated syntax.
              Init
                : nonSMemberModifier? 'init' '(' InitParamLists? ')'
                '{'
                  (superCallExression | initCallExpression)?
                  ( expression
                  | variableDeclaration
                  | functionDefinition)*
                '}'
                ;
              InitParamLists
                : unnamedParameterList (',' namedParameterList)?
                | namedParameterList
                ;

  @Description: Check that the parameter list of an init constructor
                consisting of unnamed and named parameters has to be enclosed in parentheses

  @Mode: compileonly

  @Negative: yes

  @Structure: single
*/

class Ufbqty2 {
  init a: Int64, b!: String {}
}

main() {
}