/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a02_01

  @Level:         1

  @Assertion: 4.28(2) If an expression contains multiple operators with different precedences, the evaluation order is:
              the sub-expression containing the higher precedence operators is evaluated firstly, after which the
              sub-expression containing the lower precedence operator is evaluated.

  @Description: Check that sub-expression containing the higher precedence operators is evaluated firstly. Check it
                on "a * b + c * d" example where a*b should be evaluated first, c*d should be evaluated then, and
                sum is the expression result.

  @Mode: run

  @Negative: no
*/

import utils.assert.Assert

main() {
    let x1 = 2 * 3 + 4 * 5
    let x2 = (2 * 3) + (4 * 5)
    let x3 = 2 * (3 + (4 * 5))
    let x4 = 2 * ((3 + 4) * 5)
    let x5 = ((2 * 3) + 4) * 5
    let x6 = (2 * (3 + 4)) * 5
    Assert.equals(x1, x2)
    Assert.notEquals(x1, x3)
    Assert.notEquals(x1, x4)
    Assert.notEquals(x1, x5)
    Assert.notEquals(x1, x6)

    return
}

