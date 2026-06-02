/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a18_02

  @Level:         1

  @Assertion: 4.28(18) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description          Usage           Expression type

              -         Left associative   Subtract             expr1 - expr2   The type of expr1 or expr2, since
                                                                                expr1 and expr2 have the same type
              <<        Left associative   Bitwise left shift   expr1 << expr2  The type of expr1, where expr1 and
                                                                                expr2 can have different types
              >>        Left associative   Bitwise right shift  expr1 >> expr2  The type of expr1, where expr1 and
                                                                                expr2 can have different types

  @Description: Check the '-' operator expression type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    Assert.isTrue(10_i64 - 5_i64 is Int64)
    Assert.isTrue(10_i32 - 5_i32 is Int32)
    Assert.isTrue(10_i16 - 5_i16 is Int16)
    Assert.isTrue(10_i8 - 5_i8 is Int8)
    Assert.isTrue(10_u64 - 5_u64 is UInt64)
    Assert.isTrue(10_u32 - 5_u32 is UInt32)
    Assert.isTrue(10_u16 - 5_u16 is UInt16)
    Assert.isTrue(10_u8 - 5_u8 is UInt8)
    Assert.isTrue(10.0_f64 - 5.0_f64 is Float64)
    Assert.isTrue(10.0_f32 - 5.0_f32 is Float32)
    Assert.isTrue(10.0_f16 - 5.0_f16 is Float16)
    return
}

