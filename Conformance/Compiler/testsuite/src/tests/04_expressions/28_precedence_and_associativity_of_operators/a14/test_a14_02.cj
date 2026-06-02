/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a14_02

  @Level:         1

  @Assertion: 4.28(14) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description       Usage             Expression type

              *         Left associative   Multiply          expr1 * expr2     The type of expr1 or expr2, since expr1
                                                                               and expr2 have the same type
              +         Left associative   Add               expr1 + expr2     The type of expr1 or expr2, since expr1
                                                                               and expr2 have the same type
              -         Left associative   Subtract          expr1 - expr2     The type of expr1 or expr2, since expr1
                                                                               and expr2 have the same type

  @Description: Check the '*' operator expression type.

  @Mode: run

  @Negative: no
*/

import utils.assert.Assert

main() {
    let x = 2 * 3
    let y = 2.0 * 3.0
    let z = 2_u8 * 3_u8

    Assert.isTrue(x is Int64)
    Assert.isTrue(y is Float64)
    Assert.isTrue(z is UInt8)

    return
}

