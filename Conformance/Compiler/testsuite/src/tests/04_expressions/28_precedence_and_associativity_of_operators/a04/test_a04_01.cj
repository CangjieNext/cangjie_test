/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a04_01

  @Level:         1

  @Assertion: 4.28(4) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description    Usage          Expression type

              @         Right associative  macro call     @expr1 @expr2  Unit
              .         Left associative   Member access  Name.name      The type of name

  @Description: Check that macro call is right associative.

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: aux_macros_01.cj

*/

import utils.assert.Assert
import aux_macros_01.*

main() {
    // Check that the inner macro is executed first
    let t = @Outer @Inner(3)
    Assert.isTrue(t)
}

