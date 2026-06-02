/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a29_02

  @Level:         1

  @Assertion: 4.28(29) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description            Usage           Expression type

              &         Left associative   Bitwise AND            expr1 & expr2   The type of expr1 or expr2, since
                                                                                  expr1 and expr2 have the same type
              ^         Left associative   Bitwise XOR            expr1 ^ expr2   The type of expr1 or expr2, since
                                                                                  expr1 and expr2 have the same type

  @Description: Check the '&' operator expression type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    Assert.isTrue((1_i64 & 1_i64) is Int64)
    Assert.isTrue((1_i32 & 1_i32) is Int32)
    Assert.isTrue((1_i16 & 1_i16) is Int16)
    Assert.isTrue((1_i8 & 1_i8) is Int8)
    Assert.isTrue((1_u64 & 1_u64) is UInt64)
    Assert.isTrue((1_u32 & 1_u32) is UInt32)
    Assert.isTrue((1_u16 & 1_u16) is UInt16)
    Assert.isTrue((1_u8 & 1_u8) is UInt8)
    return
}

