/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_28_a31_03

  @Level:         1

  @Assertion: 4.28(31) The following table shows the precedence, associativity, description, usage and the type of the
              expression for each operator. The closer an operator is to the top of the table, the higher precedence
              it has.

              Operator  Associativity      Description     Usage                Expression type

              |         Left associative   Bitwise OR      expr1 | expr2        The type of expr1 or expr2, since
                                                                                expr1 and expr2 have the same type
              ..        None               Range operator  expr1..expr2:expr3   Range type
              ..=       None               Range operator  expr1..=expr2:expr3  Range type

  @Description: Check that '|' operator has higher precedence than '..' operator.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    var arr = [1, 2, 3, 4, 5]
    Assert.isTrue(arr[..(3|3)] == [1, 2, 3])
    // (..3)|3 leads to a compilation error. Checked separately.
    return
}

