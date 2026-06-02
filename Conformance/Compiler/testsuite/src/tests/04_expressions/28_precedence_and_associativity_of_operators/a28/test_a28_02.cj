/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a28_02

  @Level:         1

  @Assertion: 4.28(28) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description            Usage           Expression type

              !=        None               Not equal              expr1 != expr2    Bool

  @Description: Check the '!=' operator expression type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    Assert.isTrue((1_i64 != 2_i64) is Bool)
    Assert.isTrue(("sos" != "hoh") is Bool)
    Assert.isTrue((1.0_f64 != 2.0_f64) is Bool)
    return
}

