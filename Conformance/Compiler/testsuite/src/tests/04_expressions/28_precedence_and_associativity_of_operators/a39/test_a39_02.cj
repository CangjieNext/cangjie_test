/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a39_02

  @Level:         1

  @Assertion: 4.28(39) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description     Usage                Expression type

              =         None               Assignment      leftValue = expr     Unit

  @Description: Check the '=' operator expression type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    var x: Int64 = 0
    var y: String = "hello"
    Assert.isTrue((x = 5) is Unit)
    Assert.isTrue((y = "hi") is Unit)
    return
}

