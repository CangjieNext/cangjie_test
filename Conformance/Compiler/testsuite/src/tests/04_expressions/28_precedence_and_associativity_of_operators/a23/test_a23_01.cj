/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a23_01

  @Level:         1

  @Assertion: 4.28(23) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description            Usage           Expression type

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
              ==        None               Equal                  expr1 == expr2    Bool
              !=        None               Not equal              expr1 != expr2    Bool

  @Description: Check that '>' is not associative.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    let x = 7 > 5 > 3
    return
}

