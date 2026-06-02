/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_03_a01_02

  @Level:         1

  @Assertion: 4.5.3(1) The syntax of the do-while expression is defined as follows.
              doWhileExpression
                  : 'do' block 'while' '(' expression ')'
                  ;
  @Description: Check that there is no do-while-let similar to while-let
  @Mode: compileonly
  @Negative: yes
  @Issue: 6473

*/

main() {
    do {
    } while (let _ <- 1)
}
