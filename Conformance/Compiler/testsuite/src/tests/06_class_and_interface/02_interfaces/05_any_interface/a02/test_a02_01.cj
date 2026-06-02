/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_05_a02_01

  @Level:         1

  @Assertion: 6.2.5(2)
              class A {}
              struct B {}
              enum C { D }
              main() {
                var i: Any = A() // ok
                i = B() // ok
                i = C.D // ok
                i = (1, 2) // ok
                i = { => 123 } // ok
                return 0
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class A {}

struct B {}

enum C { D }

main() {
    var i: Any = A() // ok
    Assert.isTrue(i is Any)
    i = B() // ok
    Assert.isTrue(i is Any)
    i = C.D // ok
    Assert.isTrue(i is Any)
    i = (1, 2) // ok
    Assert.isTrue(i is Any)
    i = { => 123 } // ok
    Assert.isTrue(i is Any)
    return 0
}