/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_02_a05_01

  @Level:         1

  @Assertion:   8.1.2(5)
                func g(i: I) {
                    i.f()
                }

                main() {
                    let a = Foo()
                    g(a)
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

func g(i: I) {
    i.f()
}

main() {
    let a = Foo()
    Assert.isTrue(a is I)
    g(a)
}
