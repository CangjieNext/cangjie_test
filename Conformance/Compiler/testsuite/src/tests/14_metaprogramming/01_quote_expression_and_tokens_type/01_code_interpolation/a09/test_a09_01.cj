/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a09_01

  @Level:         1

  @Assertion:   14.1.1(9) - The Tokens type implements ToTokens interface by default, toTokens returns
                the Tokens value itself. 

  @Description: Check that Tokens type implements ToTokens interface and toTokens returns
                the Tokens value itself
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    var t0 = Tokens()
    var t1 = quote(-)
    var t2 = quote($(2+5))
    var t3 = t2.toTokens()

    Assert.isTrue(t0 is ToTokens)
    Assert.isTrue(t1 is ToTokens)
    Assert.isTrue(t2 is ToTokens)
    Assert.isTrue(t3 is ToTokens)
    Assert.isTrue(t0.toTokens().toTokens().toTokens().toTokens() is ToTokens)

    Assert.equals(t0.toTokens().toTokens().toTokens().toString(), t0.toString())
    Assert.equals(t3.toString(), t2.toString())
    Assert.equals(t3.toTokens().toTokens().toTokens().toString(), t2.toString())
}
