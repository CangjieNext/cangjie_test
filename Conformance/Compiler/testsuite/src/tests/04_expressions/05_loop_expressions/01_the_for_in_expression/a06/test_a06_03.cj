/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a06_03

  @Level:         1

  @Assertion: 4.5.1(6) By the way, if binding patterns exist in the pattern after for, it means declaring
              one (or more) new let variables, and the scope of each variable is from its first occurrence
              to the end of the loop body.
  @Description: Checks that binding introduced by tuple pattern shadows outer scope binding.
                Also checks introducing two variable bindings.
  @Mode: run
  @Negative: no

*/

import utils.assert.Assert

enum E { Foo(Bool) }

main() {
    var x = false
    var y = false

    for ((Foo(x), Foo(y)) in [(Foo(true), Foo(true)), (Foo(true), Foo(true))]) {
        Assert.isTrue(x)       // outer loop x
        Assert.isTrue(y)       // outer loop y
        for ((Foo(x), Foo(y)) in [(Foo(false), Foo(false)), (Foo(false), Foo(false))]) {
            Assert.isFalse(x)  // inner loop x
            Assert.isFalse(y)  // inner loop y
        }
        Assert.isTrue(x)       // outer loop x again
        Assert.isTrue(y)       // outer loop y again
    }

    Assert.isFalse(x)          // local x
    Assert.isFalse(y)          // local y
}
