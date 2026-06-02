/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a06_02

  @Level:         1

  @Assertion: 4.5.1(6) By the way, if binding patterns exist in the pattern after for, it means declaring
              one (or more) new let variables, and the scope of each variable is from its first occurrence
              to the end of the loop body.
  @Description: Checks that binding introduced by enum pattern shadows outer scope binding
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

enum E { Foo(Bool) }

main() {
    var x = false

    for (Foo(x) in [Foo(true), Foo(true)]) {
        Assert.isTrue(x)       // outer loop x
        for (Foo(x) in [Foo(false), Foo(false)]) {
            Assert.isFalse(x)  // inner loop x
        }
        Assert.isTrue(x)       // outer loop x again
    }

    Assert.isFalse(x)          // local x
}
