/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a04_03

  @Level:         1

  @Assertion: 4.14(4) Furthermore, the postfix increment/decrement operator is non-associative, and thus an expression
              containing multiple ++ or -- without parentheses are syntactically invalid.

  @Description: Check that expression might contain multiple ++ or -- when precedence is specified and associativity
                does not come to play.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    var p = 0
    var q = 0

    // Expression with multiple ++
    var x1: (Unit, Unit) = ((p++), (q++))
    Assert.equals(1, p)
    Assert.equals(1, q)

    // Expression with multiple --
    var x2: (Unit, Unit) = ((p--), (q--))
    Assert.equals(0, p)
    Assert.equals(0, q)
}

