/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a06_03

  @Level:         1

  @Assertion: 4.4(6) The syntax of a match expression is defined as follows.
  matchExpression
      : 'match' '(' expression ')' '{' matchCase+ '}'
      | 'match' '{' ('case' (expression | '_') '=>' expressionOrDeclaration+)+ '}'
      ;
  matchCase
      : 'case' pattern ('|' pattern)* patternGuard? '=>' expressionOrDeclaration+
      ;
  patternGuard
      : 'where' expression
      ;

  @Description: Checks that empty expressionOrDeclaration list causes a compile error.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/

var expr = 0

main() {
    var m = match (expr) {
        case 0 =>
        case _ => ""
    }

    return
}
