/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a05_03

  @Level:         1

  @Assertion: 4.14(5) The syntax of the increment and decrement expression is defined as follows:

              incAndDecExpression
                  : postfixExpression ('++' | '--' )?

  @Description: Check that '++' usage over non-postfix expression causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    var p = 3
    var q = 4
    (p + q)++
}

