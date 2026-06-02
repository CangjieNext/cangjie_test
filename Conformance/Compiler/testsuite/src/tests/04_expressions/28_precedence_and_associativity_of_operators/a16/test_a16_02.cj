/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a16_02

  @Level:         1

  @Assertion: 4.28(16) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description       Usage             Expression type

              %         Left associative   Remainder         expr1 % expr2     The type of expr1 or expr2, since expr1
                                                                               and expr2 have the same type
              +         Left associative   Add               expr1 + expr2     The type of expr1 or expr2, since expr1
                                                                               and expr2 have the same type
              -         Left associative   Subtract          expr1 - expr2     The type of expr1 or expr2, since expr1
                                                                               and expr2 have the same type

  @Description: Check the '%' operator expression type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    Assert.isTrue(5_i64 % 2_i64 is Int64)
    Assert.isTrue(5_i32 % 2_i32 is Int32)
    Assert.isTrue(5_u16 % 2_u16 is UInt16)
    return
}

