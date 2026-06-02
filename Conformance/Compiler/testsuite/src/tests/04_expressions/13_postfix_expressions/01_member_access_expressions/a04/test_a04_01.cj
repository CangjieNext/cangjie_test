/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a04_01

  @Level:         1

  @Assertion: 4.13.1(4) If T is an object of a class, a non-static member of the class
              or interface can be accessed in this way.

  @Description: Check usage of member access expressions T.a where T is an object of a class and a is a non-static
                member of the either class or interface.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface I {
    func foo() {
        return 42
    }
}

class C <: I {
    init(in_x: Int64) {
        x = in_x
    }

    func bar() {
        return 35
    }

    var x: Int64
}

main() {
    // T.a: T is an object of a class and a is non-static class member.
    let c = C(5)
    let x = c.x
    Assert.equals(5, x)
    let cbar = c.bar
    Assert.equals(35, cbar())

    // T.a: T is an object of a class and a is non-static interface member.
    let afoo = c.foo
    Assert.equals(42, afoo())
}

