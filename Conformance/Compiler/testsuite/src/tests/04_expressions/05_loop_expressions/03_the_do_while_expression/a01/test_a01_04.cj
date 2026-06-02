/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_03_a01_04

  @Level:         1

  @Assertion: 4.5.3(1) The syntax of the do-while expression is defined as follows.
              doWhileExpression
                  : 'do' block 'while' '(' expression ')'
                  ;
  @Description: Check some examples of do while loops
  @Mode: run
  @Negative: no
  @CompileWarning: ignore

*/

import utils.assert.Assert

func less(i: Int64, j: Int64) { i < j }

main() {
    var i = Assert.getRuntimeZero()

    do {
        i++
    } while (less(i, 5))

    Assert.equals(5, i);

    do {
        i++
    } while (less(i, 5))

    Assert.equals(6, i);

    do {
        break
        i++
    } while (less(i, 5))

    Assert.equals(6, i);
}

