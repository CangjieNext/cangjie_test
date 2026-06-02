/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a12_03

  @Level:         1

  @Assertion: 4.28(12) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description       Usage             Expression type

              -         Right associative  Unary negative    -expr             The type of expr
              **        Right associative  Power             expr1 ** expr2    The type of expr1

  @Description: Check that '-' operator precedence is higher than '**' operator. Check the correct precedence case.

  @Mode: run

  @Negative: no
*/

import utils.assert.Assert

class B {
    operator func-() {
        return 5
    }
}

main() {
    var b = B()

    // NOTE: -(b ** 2) would lead to a compilation error and checked separately.
    let x = -b ** 2
    let y = (-b) ** 2

    Assert.equals(25, x)
    Assert.equals(y, x)

    return
}

