/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a07_01

  @Level:         1

  @Assertion: 4.14(7) For the expression expr++ (or expr--), the following is specified:

              2. Since expr++ (or expr--) is syntactic sugar of expr += 1 (or expr -= 1), the expr must also be
              assignable.

  @Description: Check that ++ and -- works for assignable expressions.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    var x: Int64 = 0
}

main() {
    var counter = 0
    counter++
    Assert.equals(1, counter)
    counter--
    Assert.equals(0, counter)

    var c = C()
    c.x++
    Assert.equals(1, c.x)
    c.x--
    Assert.equals(0, c.x)
}

