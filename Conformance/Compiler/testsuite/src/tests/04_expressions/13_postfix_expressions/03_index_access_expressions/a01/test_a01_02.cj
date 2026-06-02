/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_03_a01_02

  @Level:         1

  @Assertion: 4.13.3(1) The syntax of a index access expression is defined as the rule 5 of the syntax of
              the postfix expression
              above, where the syntax of indexAccess is defined as follows:

              indexAccess
                  : '[' (expression | rangeElement) ']'
                  ;

              rangeElement
                  : '..'
                  | ('..=' | '..' ) expression
                  | expression '..'
                  ;

  @Description: Check that index access expression without required '[' causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

// NOTE: Rule 5 is "postfixExpression indexAccess".

main() {
    let a = [1, 2, 3, 4, 5]
    a 0]
    return
}

