/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a08_01

  @Level:         1

  @Assertion: 4.13.1(8) T is this: within the scope of a class or interface, non-static members can be accessed
              using the this keyword.

  @Description: Check that non-static members of classes and interfaces can be accessed using this keyword.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface I {
    func foo() {
        return 1
    }
}

class C <: I {
    init() {
        x = 2
    }

    func test() {
        // Case: access to non-static interface member.
        let f1 = this.foo
        let t1 = f1()

        // Case: access to non-static class data member.
        let t2 = this.x

        // Case: access to non-static class member function.
        let f3 = this.bar
        let t3 = f3()

        return (t1, t2, t3)
    }

    func bar(): Int64 {
        return 3
    }

    var x: Int64
}

main() {
    let t = C().test()
    Assert.isTrue(t == (1, 2, 3))
}

