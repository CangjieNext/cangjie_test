/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_02_a03_01

  @Level:         1

  @Assertion:   14.1.2(3) The quote expression is combined into a larger Tokens based on the sequence in which the expression appears.


  @Description: Check that common tokens obtain the corresponding Tokens result
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    var a1 = quote(2+3) + quote(6)
    var a2 = quote($(2+3)) + quote(+6) + quote(-$(7-4))
    var a3 = quote(\$)+quote(\(2+3) + quote(+6\))

    Assert.isTrue(a1 is Tokens)
    Assert.isTrue(a2 is Tokens)
    Assert.isTrue(a3 is Tokens)

    Assert.equals("2 + 3 6", a1.toString())
    Assert.equals("5 + 6 - 3", a2.toString())
    Assert.equals("$(2 + 3 + 6)", a3.toString())
}
