/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a13_02

  @Level:         1

  @Assertion: 4.28(13) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description       Usage             Expression type

              **        Right associative  Power             expr1 ** expr2    The type of expr1
              *         Left associative   Multiply          expr1 * expr2     The type of expr1 or expr2, since expr1
                                                                               and expr2 have the same type
              /         Left associative   Divide            expr1 / expr2     The type of expr1 or expr2, since expr1
                                                                               and expr2 have the same type
              %         Left associative   Remainder         expr1 % expr2     The type of expr1 or expr2, since expr1
                                                                               and expr2 have the same type

  @Description: Check the '**' operator expression type.

  @Mode: run

  @Negative: no
*/

import utils.assert.Assert

main() {
    var x = 2 ** 3
    var y = 2.0 ** 3
    Assert.isTrue(x is Int64)
    Assert.isTrue(y is Float64)
    return
}

