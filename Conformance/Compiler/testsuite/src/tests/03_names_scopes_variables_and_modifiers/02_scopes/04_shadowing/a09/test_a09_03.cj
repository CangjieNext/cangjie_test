/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a09_03

  @Level:         1
  @Assertion:    3.2.4(9) If the name f is a top-level function, f can be either overloaded based on the
                 overloading rule or shadowed.

  @Mode:         run
  @Negative:     no

*/

package test

import utils.assert.Assert

func incr (x: Int64) { x + 1 }

interface I {
    func incr(x: Int64) { x }
    func test() {
        func incr(incr: Int64) { incr - 1 }
        Assert.equals(99, incr(100))
    }
}

class C <: I {
    C() {
        Assert.equals(100, incr(100))
    }
}

main() {
    let c = C()
    c.test()
}
