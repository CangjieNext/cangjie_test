/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a17_03

  @Level:         1

  @Assertion: 4.28(17) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description          Usage           Expression type

              +         Left associative   Add                  expr1 + expr2   The type of expr1 or expr2, since
                                                                                expr1 and expr2 have the same type
              -         Left associative   Subtract             expr1 - expr2   The type of expr1 or expr2, since
                                                                                expr1 and expr2 have the same type
              <<        Left associative   Bitwise left shift   expr1 << expr2  The type of expr1, where expr1 and
                                                                                expr2 can have different types
              >>        Left associative   Bitwise right shift  expr1 >> expr2  The type of expr1, where expr1 and
                                                                                expr2 can have different types

  @Description: Check that '+' operator has higher precedence than '<<' operator.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    let x1 = 1 << 3 + 4
    let x2 = (1 << 3) + 4
    let x3 = 1 << (3 + 4)
    Assert.notEquals(x1, x2)
    Assert.equals(x1, x3)

    let y1 = 4 + 1 << 3
    let y2 = (4 + 1) << 3
    let y3 = 4 + (1 << 3)
    Assert.equals(y1, y2)
    Assert.notEquals(y1, y3)

    return
}

