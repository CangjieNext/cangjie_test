/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a06_02

  @Level:         1

  @Assertion: 4.28(6) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description    Usage          Expression type

              []        Left associative   Index access   varName[expr]  The type of the element of varName

  @Description: Check the '[]' operator expression type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    var iarr = [1, 2, 3, 4, 5]
    Assert.isTrue(iarr[0] is Int64)

    var farr = [1.0, 2.0, 3.0]
    Assert.isTrue(farr[0] is Float64)

    var sarr = ["hi", "hello", "greetings"]
    Assert.isTrue(sarr[0] is String)
}

