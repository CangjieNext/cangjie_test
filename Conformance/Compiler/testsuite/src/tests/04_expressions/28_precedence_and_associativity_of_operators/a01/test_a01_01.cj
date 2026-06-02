/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a01_01

  @Level:         1

  @Assertion: 4.28(1) The value of an expression containing two or more operators is determined by the grouping rules
              of operators. The grouping rules are decided by the precedence and associativity of operators.
              Specifically, precedence defines the order of evaluation when there are multiple operators with different
              precedence in an expression, and associativity determines how operators of the same precedence are
              grouped in the absence of parentheses.

  @Description: Check some grouping rules examples.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    operator func+(x: Int64) { 100 }
}

main() {
    var c = C()

    // Case: a + b + c (left-associative expression)
    let x1 = c + 1 + 2
    let x2 = (c + 1) + 2
    let x3 = c + (1 + 2)
    Assert.equals(102, x1)
    Assert.equals(x1, x2)
    Assert.notEquals(x1, x3)

    // Case: a + b * c (precedence-guided expression)
    let y1 = 2 + 3 * 4
    let y2 = (2 + 3) * 4
    let y3 = 2 + (3 * 4)
    Assert.notEquals(y1, y2)
    Assert.equals(y1, y3)

    return
}

