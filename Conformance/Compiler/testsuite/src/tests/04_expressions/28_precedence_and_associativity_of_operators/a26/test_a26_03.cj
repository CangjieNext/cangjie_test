/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a26_03

  @Level:         1

  @Assertion: 4.28(26) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description            Usage           Expression type

              as        None               Type cast              expr as userType  Except the type of `expr as
                                                                                    userType` is Option<userType>,
                                                                                    other expressions have Bool type
              ==        None               Equal                  expr1 == expr2    Bool
              !=        None               Not equal              expr1 != expr2    Bool

  @Description: Check that 'as' operator has higher precedence than '==' operator.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    let s = Option<String>.Some("hi")
    Assert.isTrue("hi" as String == s)
    Assert.isTrue(("hi" as String) == s)
    Assert.isTrue(s == "hi" as String)
    Assert.isTrue(s == ("hi" as String))
    Assert.isTrue(((s == "hi") as String) is Option<String>) // Another precedence -> another result type.
    // NOTE: Incorrect precedence "hi" as (String == s) leads to a compilation error. Tested separately.
    return
}

