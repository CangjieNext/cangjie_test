/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_02_a02_01

  @Level:         1

  @Assertion:   14.1.2(2) - Common tokens: Obtain the corresponding Tokens result. 

  @Description: Check that common tokens obtain the corresponding Tokens result
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    var a1 = quote(2+3)
    var a2 = quote((a1.toTokens()))
    var a3 = quote((a1))

    // Checking the common tokens obtain the corresponding Tokens result
    Assert.equals("(a1.toTokens())", a2.toString())
    Assert.equals("(a1)", a3.toString())

    // Checking the common tokens not calls .toTokens() for expression in parentheses
    Assert.notEquals(a1.toTokens().toString(), a2.toTokens().toString())
    Assert.notEquals(a2.toTokens().toString(), a3.toTokens().toString())
    Assert.notEquals(a3.toTokens().toString(), a1.toTokens().toString())
}
