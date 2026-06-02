/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_a02_01

  @Level:         1

  @Assertion: 4.13(2) Depending on the suffix operator, they are classified as member access expressions, function call
              expressions, and index expressions.

  @Description: Check usage of listed postfix expressions.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct S {
    S(var x!: Int64, var y!: Int64) {}
}

func foo() {
    return 42
}

enum E {
    | A
    | B
}

main() {
    // Member access expression.
    let s = S(x: 3, y: 4)
    let x = s.x
    Assert.equals(3, x)

    // Function invocation expression.
    let y = foo()
    Assert.equals(42, y)

    // Index access expression.
    let t = (42, 53)
    let z = t[1]
    Assert.equals(53, z)

    // Increment expression.
    var u = 35
    u++
    Assert.equals(36, u)

    // Enum destructuring expression.
    let v = match (E.A) {
        case A => 1
        case B => 2
    }
    Assert.equals(1, v)
}

