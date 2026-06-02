/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_a06_02

  @Level:         1

  @Assertion:   14.1(6)    - The quote expression is of the Tokens type. Tokens is a type provided by the
                Cangjie standard library and is a sequence consisting of lexical units (token).

  @Description: Checking the Tokens type is a sequence consisting of lexical units (token)
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

main(): Unit {
  var t: Tokens = quote("It's") + Token(STRING_LITERAL, "cool") + quote("in") + quote("space")
  Assert.isTrue(t[3] is Token)
  Assert.isTrue(t.get(1) is Token)
  Assert.isTrue(t.iterator().next().getOrThrow() is Token)

  for (item in t) {
    Assert.isTrue(item is Token)
  }
}