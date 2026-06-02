/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_24

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that quote expressions have type and value.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import std.ast.* 
import utils.assert.Assert
import utils.macros.*

enum Test { 
    A | B | C(Int64) 
}

main() {
    var tokens = quote(3 + 4)
    Assert.isTrue(tokens is Tokens)
    @matchOrThrow[A](A)
}
