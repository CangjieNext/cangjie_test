/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_12_a03_10

  @Level:         1

  @Assertion: 4.12(3)
              The syntax of a parenthesized expression is defined as.

              parenthesizedExpression
                  : '(' expression ')'
                  ;

  @Description: Check that arithmetic parenthesized expression without ')' cuases a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    // Incorrect arithmetic parenthesized expression.
    let c = 1 + 2)
}

