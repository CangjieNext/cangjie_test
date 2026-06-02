/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a12_02

  @Level:         1

  @Assertion: 4.28(12) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description       Usage             Expression type

              -         Right associative  Unary negative    -expr             The type of expr
              **        Right associative  Power             expr1 ** expr2    The type of expr1

  @Description: Check the '-' operator expression type.

  @Mode: run

  @Negative: no
*/

import utils.assert.Assert

main() {
    var i: Int64 = 5
    var f: Float64 = 5.0

    Assert.isTrue((-i) is Int64)
    Assert.isTrue((-f) is Float64)

    return
}

