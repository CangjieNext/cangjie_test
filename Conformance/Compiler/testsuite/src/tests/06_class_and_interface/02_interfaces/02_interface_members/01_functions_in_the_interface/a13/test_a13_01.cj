/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a13_01

  @Level:         1

  @Assertion: 6.2.2.1(13)
              interface I {
                func foo1() {} // ok
                func foo2() {} // ok
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {
    func foo1() {} // ok
    func foo2() {} // ok
}

class A <: I {}

main () {
    Assert.isTrue(A().foo1() is Unit)
    Assert.isTrue(A().foo2() is Unit)
}