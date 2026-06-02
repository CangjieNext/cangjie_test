/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_02_a01_03

  @Level:         1

  @Assertion: 4.5.2(1) The syntax of the while expression is defined as follows.
              whileExpression
              'while' '(' ('let' deconstructPattern '<-')? expression ')' block
               ;
               where while is the keyword, while is followed by a parenthesis, which can be an expression
               or a let-declared variable definition, followed by a block.
  @Description: Check that block can be empty block
  @Mode: run
  @Negative: no
  @CompileWarning: ignore

*/

main() {
    let i = 0
    while (i > 0) { }

}
