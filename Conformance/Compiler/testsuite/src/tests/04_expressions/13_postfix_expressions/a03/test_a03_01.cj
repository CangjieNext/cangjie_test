/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_a03_01

  @Level:         1

  @Assertion: 4.13(3) The classified as member access expressions, function call expressions, index expressions can be
              preceded by an optional ? operator, in order to make Option types support the above postfix
              operators. For the ? operator, see below for details.

  @Description: Check that member access expression, function call expression and index expressions can be preceded
                by an optional ? operator.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct S {
    S(var x!: Int64) {}

    func foo() {
        return 42
    }
}

main() {
    var s: ?S = S(x: 3)

    // Member access expression preceded by an ? operator.
    let x = s?.x
    Assert.equals(3, x.getOrThrow())

    // Function invocation expression preceded by an ? operator.
    let y = s?.foo()
    Assert.equals(42, y.getOrThrow())

    // Index access expression preceeded by an ? operator.
    let t: ?(Int64, Int64) = (42, 53)
    let z = t?[1]
    Assert.equals(53, z.getOrThrow())
}

