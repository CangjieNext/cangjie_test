/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a06_01

  @Level:         1

  @Assertion:   14.1(6)    - The quote expression is of the Tokens type. Tokens is a type provided by the
                Cangjie standard library and is a sequence consisting of lexical units (token).

  @Description: Checking the quote expression is of the Tokens type
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    var t = quote( )
    var t1: Tokens = quote("It's cool in space")
    var t2 = quote($t1)
    var t3: Tokens = quote($t2)

    Assert.isTrue(t is Tokens)
    Assert.isTrue(t1 is Tokens)
    Assert.isTrue(t2 is Tokens)
    Assert.isTrue(t3 is Tokens)
}