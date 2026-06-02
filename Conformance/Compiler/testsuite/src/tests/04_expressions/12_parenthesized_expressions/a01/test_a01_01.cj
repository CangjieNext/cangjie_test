/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_12_a01_01

  @Level:         1

  @Assertion: 4.12(1)
              Parenthesized expressions are expressions that are enclosed in parentheses.

  @Description: Check parenthesized expression usage.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

enum E {
    | A
    | B
}

func foo() {
    // Return parenthesized expression.
    (return 42)
}

main(inp: Array<String>) {
    Assert.equals(42, foo())

    // Conditional parenthesized expression.
    let x1 = 3
    let x2 = (if (Assert.getRuntimeZero(inp) + x1 < 5) { 1 } else { 2 })
    Assert.equals(1, x2)

    // Pattern matching parenthesized expression.
    let a = (match (E.A) {
        case A => 1
        case B => 2
    })
    Assert.equals(1, a)

    // Numeric type conversion parenthesized expression.
    let b = (Int32(42))
    Assert.equals(42, b)

    // Arithmetic parenthesized expression.
    let c = (1 + 2)
    Assert.equals(3, c)
}

