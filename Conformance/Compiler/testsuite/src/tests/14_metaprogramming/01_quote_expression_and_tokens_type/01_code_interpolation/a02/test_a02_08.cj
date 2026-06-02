/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a02_08

  @Level:         1

  @Assertion:   14.1.1(2) The operator is followed by an expression, indicating that the
                value of the expression is converted to tokens.

  @Description: Check that value of relational expressions is converted to a token
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    // Relational Expressions
    var x = 55.5
    let y = 55.55
    var cir0 = quote($(0 < 1))
    var cir1 = quote($(0 > 1))
    var cir2 = quote($(0 == 1))
    var cir3 = quote($(0 != 1))
    var cir4 = quote($(0 >= 1))
    var cir5 = quote($(0 <= 1))
    var cir6 = quote($(x < y))
    var cir7 = quote($(x > y))
    var cir8 = quote($(x == y))
    var cir9 = quote($(x != y))
    var cir10 = quote($(x <= y))
    var cir11 = quote($(x >= y))
    
    Assert.equals((0 < 1).toString(), cir0.toString())
    Assert.equals((0 > 1).toString(), cir1.toString())
    Assert.equals((0 == 1).toString(), cir2.toString())
    Assert.equals((0 != 1).toString(), cir3.toString())
    Assert.equals((0 >= 1).toString(), cir4.toString())
    Assert.equals((0 <= 1).toString(), cir5.toString())
    Assert.equals((x < y).toString(), cir6.toString())
    Assert.equals((x > y).toString(), cir7.toString())
    Assert.equals((x == y).toString(), cir8.toString())
    Assert.equals((x != y).toString(), cir9.toString())
    Assert.equals((x <= y).toString(), cir10.toString())
    Assert.equals((x >= y).toString(), cir11.toString())

    Assert.isTrue(cir0 is Tokens)
    Assert.isTrue(cir1 is Tokens)
    Assert.isTrue(cir2 is Tokens)
    Assert.isTrue(cir3 is Tokens)
    Assert.isTrue(cir4 is Tokens)
    Assert.isTrue(cir5 is Tokens)
    Assert.isTrue(cir6 is Tokens)
    Assert.isTrue(cir7 is Tokens)
    Assert.isTrue(cir8 is Tokens)
    Assert.isTrue(cir9 is Tokens)
    Assert.isTrue(cir10 is Tokens)
    Assert.isTrue(cir11 is Tokens)
}
