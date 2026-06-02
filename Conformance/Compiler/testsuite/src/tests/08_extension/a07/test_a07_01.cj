/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a07_01

  @Level:         1

  @Assertion:   8(7) Features that can be added include: Implementing Interfaces.

  @Description: Checks that implementing interfaces can be added to class extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

interface I {
    func foo(): Int64
}

class Foo {
    var x: Int64 = 0
    var y: Int64 = 0

    init (a: Int64, b: Int64) {
        x = a
        y = b
    }
}

extend Foo <: I {
    public func foo(): Int64  {
        x + y
    }
}

main() {
    let x = Foo(4, 5)
    Assert.equals(9, x.foo())
}
