/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_03_a02_01

  @Level:         1

  @Assertion: 4.5.3(2) The difference between a while expression and a do-while expression is the
              loop body in a while expression may not be evaluated (when the expression is initially false),
              whereas the loop body in a do-while expression is at least evaluated once, i.e., block is
              evaluated before evaluating the expression written after the keyword while.
  @Description: Check that block is at least evaluated once
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

main() {
    var msg = ""

    do {
        msg = "seen"
    } while (Assert.getRuntimeZero() == 1)

    Assert.equals("seen", msg)
}
