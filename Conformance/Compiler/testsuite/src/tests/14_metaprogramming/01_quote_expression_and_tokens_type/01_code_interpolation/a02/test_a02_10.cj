/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a02_10

  @Level:         1

  @Assertion:   14.1.1(2) The operator is followed by an expression, indicating that the
                value of the expression is converted to tokens.

  @Description: Check that value of bitwise expressions is converted to a token
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*
import std.convert.*

main(): Unit {
    // Bitwise Expressions
    var ci_b0 = quote($(!10))
    var ci_b1 = quote($(10<<1))
    var ci_b2 = quote($(10 << 1 << 1))
    var ci_b3 = quote($(1 ^ 8 & 15 | 24))

    Assert.equals((10 << 1).toString(), ci_b1.toString())
    Assert.equals((10 << 1 << 1).toString(), ci_b2.toString())
    Assert.equals((1 ^ 8 & 15 | 24).toString(), ci_b3.toString())

    Assert.isTrue(ci_b0 is Tokens)
    Assert.isTrue(ci_b1 is Tokens)
    Assert.isTrue(ci_b2 is Tokens)
    Assert.isTrue(ci_b3 is Tokens)
}
