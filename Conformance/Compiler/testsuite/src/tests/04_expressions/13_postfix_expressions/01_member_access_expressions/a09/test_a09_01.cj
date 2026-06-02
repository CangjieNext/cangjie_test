/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a09_01

  @Level:         1

  @Assertion: 4.13.1(9) T is super: within a class or interface scope, non-static members of the direct superclass
              of the current class can be accessed by the super keyword.

  @Description: Check that non-static members of direct superclass of the current class can be accessed using the
                'super' keyword.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface I {
    func foo() {
        return 1
    }
}

open class C1 <: I {
    init() {
        x = 2
    }

    var x: Int64
}

class C2 <: C1 {
    func test() {
        // Access to direct superclass non-static class member function using 'super' keyword.
        let t1 = super.foo

        // Access to direct superclass non-static class data member using 'super' keyword.
        let t2 = super.x

        return (t1(), t2)
    }
}

main() {
    let t = C2().test()
    Assert.isTrue(t == (1, 2))
}

