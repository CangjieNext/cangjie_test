/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a25_08

  @Level:         1

  @Assertion: 4.28(25) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description            Usage           Expression type

              is        None               Type check             expr is type      Except the type of `expr as
                                                                                    userType` is Option<userType>,
                                                                                    other expressions have Bool type
              as        None               Type cast              expr as userType  Except the type of `expr as
                                                                                    userType` is Option<userType>,
                                                                                    other expressions have Bool type
              ==        None               Equal                  expr1 == expr2    Bool
              !=        None               Not equal              expr1 != expr2    Bool

  @Description: Check that 'is' operator has higher precedence than '!=' operator. Check that compilation error would
                occur in case of incorrect precedence; case "(false != "hi") is String".

  @Mode: compileonly

  @Negative: yes

*/

main() {
    (false != "hi") is String
    return
}

