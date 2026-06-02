/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_03_a01_03

  @Level:         1

  @Assertion: 4.5.3(1) The syntax of the do-while expression is defined as follows.
              doWhileExpression
                  : 'do' block 'while' '(' expression ')'
                  ;
  @Description: Check that block can be empty block
  @Mode: run
  @Negative: no

*/

main() {
    var i = 0

    func condition() {
        i++
        i < 5
    }

    do {
    } while (condition())
}
