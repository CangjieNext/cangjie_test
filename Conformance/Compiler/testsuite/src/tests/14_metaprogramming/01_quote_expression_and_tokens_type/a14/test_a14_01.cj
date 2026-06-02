/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a14_01

  @Level:         1

  @Assertion:   14.1(14) The Cangjie programming language provides the Tokens type to indicate the token result
                obtained after lexically analyzing the source text. 

  @Description: Checking the presence of the Tokens type
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

class ts <: Tokens {}

main(): Unit {
    var t: Tokens
    var t1 = Tokens()
    var t2 = ts()

    Assert.isTrue(t1 is Tokens)
    Assert.isTrue(t2 is Tokens)
}
