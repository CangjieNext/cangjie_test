/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a03_01

  @Level:         1

  @Assertion:   8.1.2(3)
                interface I {
                    func f(): Unit
                }

                class Foo {}

                extend Foo <: I {
                    public func f() {}
                }

  @Description: Checks the given example.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

interface I {
    func f(): Unit
}

class Foo {}

extend Foo <: I {
    public func f() {}
}

main() {
    let foo = Foo()
    Assert.isTrue(foo is I)
    foo.f()
}
