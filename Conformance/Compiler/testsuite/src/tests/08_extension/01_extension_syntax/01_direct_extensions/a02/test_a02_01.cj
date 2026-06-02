/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_01_01_a02_01

  @Level:         1

  @Assertion:   8.1.1(2)
                class Foo {}
                extend Foo {
                  func f() {}
                }

                main() {
                  let a = Foo()
                  a.f() // call extension function
                }

  @Description: Checks the given example.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

var flag = false

class Foo {}

extend Foo {
    func f() { flag = true }
}

main() {
    let a = Foo()
    Assert.isFalse(flag)
    a.f() // call extension function
    Assert.isTrue(flag)
}
