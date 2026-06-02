/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a02_07

  @Level:         1

  @Assertion:   14.1.1(2) The operator is followed by an expression, indicating that the
                value of the expression is converted to tokens.

  @Description: Check that value of arithmetic expressions is converted to a token
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*
import std.convert.*

main(): Unit {
    // Arithmetic Expressions
    var x = 67.0
    var y = 2.0
    var add = quote($(x + y))
    var sub = quote($(x - y))
    var mul = quote($(x * y))
    var div = quote($(x / y))
    var mod = quote($(7 % 2))
    var exp = quote($(x ** y))

    Assert.equals((x + y).format('2.1'), add.toString())
    Assert.equals((x - y).format('2.1'), sub.toString())
    Assert.equals((x * y).format('2.1'), mul.toString())
    Assert.equals((x / y).format('2.1'), div.toString())
    Assert.equals((7 % 2).format('1.0'), mod.toString())
    Assert.equals((x ** y).format('2.1'), exp.toString())

    Assert.isTrue(add is Tokens)
    Assert.isTrue(sub is Tokens)
    Assert.isTrue(mul is Tokens)
    Assert.isTrue(div is Tokens)
    Assert.isTrue(mod is Tokens)
    Assert.isTrue(exp is Tokens)
}
