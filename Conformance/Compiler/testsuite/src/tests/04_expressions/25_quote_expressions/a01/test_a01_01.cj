
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_25_a01_01

  @Level:         1

  @Assertion:   4.25(1) A quote expression is used to reference code and represent it as an operable data object. It is
                mainly used for metaprogramming. For details, see chapter 14.
  @Description: Checks compilation and execution of a program that uses quote expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert
import std.ast.*

main() {
    let x: Int64 = 123
    Assert.equals("x + 3", (quote(x) + quote(+) + quote(3)).toString())
    Assert.equals("x + 3", (quote(x + 3)).toString())
    Assert.equals("x +(1 + 3)", (quote(x + (1 +          3))).toString())
    Assert.equals("x + \"3\"", (quote(x+) + Token(STRING_LITERAL, "3")).toString())
    Assert.equals("123 + 3", (quote($x) + quote(+) + quote(3)).toString())
}

