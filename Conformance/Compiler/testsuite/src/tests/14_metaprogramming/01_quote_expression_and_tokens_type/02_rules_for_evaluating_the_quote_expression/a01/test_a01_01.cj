/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_02_a01_01

  @Level:         1

  @Assertion:   14.1.2(1) - Code interpolation: The result of the expression .toTokens() is obtained. 

  @Description: Check that code interpolation call .toTokens() for expression in parentheses
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    var a1 = quote(2+3)
    var a2 = quote($(a1.toTokens()))
    var a3 = quote($(a1))

    Assert.equals(a1.toTokens().toString(), a2.toTokens().toString())
    Assert.equals(a2.toTokens().toString(), a3.toTokens().toString())
    Assert.equals(a3.toTokens().toString(), a1.toTokens().toString())
}
