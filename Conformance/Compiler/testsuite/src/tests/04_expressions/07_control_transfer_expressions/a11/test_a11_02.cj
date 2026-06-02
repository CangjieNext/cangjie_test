/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_07_a11_02

  @Level:         1

  @Assertion: 4.7(11)
              The syntax of control transfer expressions is defined as follows.

              jumpExpression
                  : 'break'
                  | 'continue'
                  | 'return' expression?
                  | 'throw' expression
                  ;

  @Description: Check that throw without expression causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    throw;
    return
}

