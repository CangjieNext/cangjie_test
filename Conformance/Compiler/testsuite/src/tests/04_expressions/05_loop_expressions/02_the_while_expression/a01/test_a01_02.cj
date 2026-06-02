/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a01_02

  @Level:         1

  @Assertion: 4.5.2(1) The syntax of the while expression is defined as follows.
              whileExpression
              'while' '(' ('let' deconstructPattern '<-')? expression ')' block
               ;
               where while is the keyword, while is followed by a parenthesis, which can be an expression
               or a let-declared variable definition, followed by a block.
  @Description: Check that 'var' can not be used instead of 'let'
  @Mode: compileonly
  @Negative: yes
  @Issue: 6473

*/

main() {
    while (var i <- 0) { break }
}
