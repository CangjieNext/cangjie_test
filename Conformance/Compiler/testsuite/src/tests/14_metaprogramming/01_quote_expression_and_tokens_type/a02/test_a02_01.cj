/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a02_01

  @Level:         1

  @Assertion:   14.1(2) - Use keyword quote to define the quote expression.

  @Description: Checking the existence of the quote keyword
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    var t1 = quote( )
    Assert.isTrue(t1 is Tokens, reason:"The quote expression is of the Tokens type")
}
