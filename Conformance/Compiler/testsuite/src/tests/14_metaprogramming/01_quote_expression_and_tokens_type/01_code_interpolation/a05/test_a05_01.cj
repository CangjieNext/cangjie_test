/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a05_01

  @Level:         1

  @Assertion:   14.1.1(5)    var rightOp: Tokens = quote(3)
                quote(2 + $rightOp)            // quote(2 + 3)

  @Description: Check example
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
    var rightOp: Tokens = quote(3)
    var t = quote(2 + $rightOp)            // quote(2 + 3)

    Assert.equals(quote(2 + 3).toString(), t.toString())
}
