/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a19_07

  @Level:         1

  @Assertion: 4.28(19) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description            Usage           Expression type

              <<        Left associative   Bitwise left shift     expr1 << expr2    The type of expr1, where expr1 and
                                                                                    expr2 can have different types
              >>        Left associative   Bitwise right shift    expr1 >> expr2    The type of expr1, where expr1 and
                                                                                    expr2 can have different types
              <         None               Less than              expr1 < expr2     Except the type of `expr as
                                                                                    userType` is Option<userType>,
                                                                                    other expressions have Bool type
              <=        None               Less than or equal     expr1 <= expr2    Except the type of `expr as
                                                                                    userType` is Option<userType>,
                                                                                    other expressions have Bool type
              >         None               Greater than           expr1 > expr2     Except the type of `expr as
                                                                                    userType` is Option<userType>,
                                                                                    other expressions have Bool type
              >=        None               Greater than or equal  expr1 >= expr2    Except the type of `expr as
                                                                                    userType` is Option<userType>,
                                                                                    other expressions have Bool type
              is        None               Type check             expr is type      Except the type of `expr as
                                                                                    userType` is Option<userType>,
                                                                                    other expressions have Bool type
              as        None               Type cast              expr as userType  Except the type of `expr as
                                                                                    userType` is Option<userType>,
                                                                                    other expressions have Bool type

  @Description: Check that '<<' operator has higher precedence than '>' operator.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    Assert.isTrue(32 > 1 << 4)
    Assert.isTrue(32 > (1 << 4))
    // Note: (32 > 1) << 4 would cause a compilation error. Tested separately.
    return
}

