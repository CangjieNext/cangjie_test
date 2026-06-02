/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a24_02

  @Level:         1

  @Assertion: 4.28(24) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description            Usage           Expression type

              >=        None               Greater than or equal  expr1 >= expr2    Except the type of `expr as
                                                                                    userType` is Option<userType>,
                                                                                    other expressions have Bool type
              is        None               Type check             expr is type      Except the type of `expr as
                                                                                    userType` is Option<userType>,
                                                                                    other expressions have Bool type
              as        None               Type cast              expr as userType  Except the type of `expr as
                                                                                    userType` is Option<userType>,
                                                                                    other expressions have Bool type
              ==        None               Equal                  expr1 == expr2    Bool
              !=        None               Not equal              expr1 != expr2    Bool

  @Description: Check the '>=' operator expression type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    Assert.isTrue((3_i64 >= 5_i64) is Bool)
    Assert.isTrue((3_i32 >= 5_i32) is Bool)
    Assert.isTrue((3_i16 >= 5_i16) is Bool)
    Assert.isTrue((3_i8 >= 5_i8) is Bool)
    Assert.isTrue((3_u64 >= 5_u64) is Bool)
    Assert.isTrue((3_u32 >= 5_u32) is Bool)
    Assert.isTrue((3_u16 >= 5_u16) is Bool)
    Assert.isTrue((3_u8 >= 5_u8) is Bool)
    Assert.isTrue((3.0_f64 >= 5.0_f64) is Bool)
    Assert.isTrue((3.0_f32 >= 5.0_f32) is Bool)
    Assert.isTrue((3.0_f16 >= 5.0_f16) is Bool)
    return
}

