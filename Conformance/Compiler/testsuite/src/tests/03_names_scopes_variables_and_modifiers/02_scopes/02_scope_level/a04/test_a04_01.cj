/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            03_02_02_a04_01

  @Level:         1
  
  @Assertion:       3.2.2(4) 1. Names from other packages introduced by import clause have the lowest scope level.

  @Description:     The test imports functions f and g from different packages and also defines them at the global and
                    local levels. Check that it is impossible to access functions from packages without a package
                    modifier.

  @Mode:            run

  @Negative:        no

  @Structure:       complex-main

  @Dependencies:    aux_test_a04_01_m1_p1.cj aux_test_a04_01_m1_p2.cj aux_test_a04_01_m1_p3.cj

  @CompileWarning:  no

  @Comment:         Issue 6090 -- non-problem. The test changed to be correct.

  @Issue:           0006090

*/

import {p1, p2, p3.f as g}

import utils.assert.Assert

class A {
    operator func ()() {
        Assert.equals(0, f())
        Assert.equals(1, p1.f())
        Assert.equals(2, p2.f())
        Assert.equals(1, p1.f())
        Assert.equals(2, p2.f())

        Assert.equals(3, g())
        Assert.equals(-3, p2.g())
        Assert.equals(-2, p1.g())
        Assert.equals(-3, p2.g())
    }
}

func f() { 0 }

main() {
    A()()

    let g = { => 100 }

    Assert.notEquals(f(), p1.f())
    Assert.notEquals(f(), p1.f())
    Assert.notEquals(f(), p2.f())
    Assert.notEquals(p1.f(), p2.f())

    Assert.notEquals(g(), p2.g())
    Assert.notEquals(g(), p1.g())
    Assert.notEquals(p2.g(), p1.g())

    Assert.equals(0, f())
    Assert.equals(1, p1.f())
    Assert.equals(2, p2.f())
    Assert.equals(1, p1.f())
    Assert.equals(2, p2.f())

    Assert.equals(100, g())
    Assert.equals(-3, p2.g())
    Assert.equals(-2, p1.g())
    Assert.equals(-3, p2.g())
}
