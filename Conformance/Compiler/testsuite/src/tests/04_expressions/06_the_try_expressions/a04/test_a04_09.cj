/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_06_a04_09

  @Level:         1

  @Assertion: 4.6(4)
              The syntax of the try expression is defined as:

              tryExpression
                  : 'try' block 'finally' block
                  | 'try' block ('catch' '(' catchPattern ')' block)+ ('finally' block)?
                  | 'try' '(' resourceSpecifications ')' block ('catch' '(' catchPattern ')' block)* ('finally' block)?
                  ;

  @Description: Check that "'try' block ('catch' '(' catchPattern ')' block)+ ('finally' block)?"
                without catchPattern causes a compilation error.

  @Mode: compileonly

  @Negative: yes
*/

main() {
    try {
    } catch () {
    } finally {
    }
}

