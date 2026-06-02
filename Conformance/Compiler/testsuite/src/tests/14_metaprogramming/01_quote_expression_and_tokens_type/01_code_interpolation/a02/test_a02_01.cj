/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a02_01

  @Level:         1

  @Assertion:   14.1.1(2) The operator is followed by an expression, indicating that the
                value of the expression is converted to tokens.

  @Description: Check that value of lambda expression call is converted to a token
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    // Lambda Expressions
    var le = {i: Float64 => i**i}
    var le0 = quote({i: Float64 => i**i}(5.0))
    var le1 = quote($({i: Float64 => i**i}(5.0)))
    var le2 = quote($(le(5.0)))

    for(t in le0 + le1 + le2) {
      Assert.isTrue(t is Token)
    }
}
