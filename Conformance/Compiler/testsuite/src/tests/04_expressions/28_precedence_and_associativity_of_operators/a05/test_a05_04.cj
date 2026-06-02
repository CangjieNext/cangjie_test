/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a05_04

  @Level:         1

  @Assertion: 4.28(5) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description    Usage          Expression type

              .         Left associative   Member access  Name.name      The type of name

  @Description: Check the '.' operator expression type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    var x: Int64 = 0
    var y: Float64 = 0.0
    var z: String = "hi"
}

main() {
    var c = C()
    Assert.isTrue(c.x is Int64)
    Assert.isTrue(c.y is Float64)
    Assert.isTrue(c.z is String)
    return
}

