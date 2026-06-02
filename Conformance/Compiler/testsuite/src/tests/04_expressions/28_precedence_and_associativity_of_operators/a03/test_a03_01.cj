/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a03_01

  @Level:         1

  @Assertion: 4.28(3) In addition, for expressions containing multiple operators with the same precedence,
              the evaluation order is determined by the associativity of the operator.

  @Description: Check expressions containing multiple operators with the same precendence evaluates according to theirs
                associativity.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    // Check "a + b + c + d" expression, where evaluation order is: ((a + b) + c) + d.
    // Trick: if evaluation order changes, expression evaluation will throw on overflow.
    let a: Int8 = 127
    let b: Int8 = -127
    let c: Int8 = -127
    let d: Int8 = 127

    let x = a + b + c + d
    Assert.equals(0, x)

    // Check "a / b * c * d" expression, where evaluation order is: ((a / b) * c) * d.
    // Trick: if evaluation order changes, expression evaluation will throw on overflow.
    let a1: Int8 = 0
    let b1: Int8 = 127
    let c1: Int8 = 127
    let d1: Int8 = 127

    let y = a1 / b1 * c1 * d1
    Assert.equals(0, y)

    return
}

