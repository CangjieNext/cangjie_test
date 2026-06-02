/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_02_a04_01

  @Level:         1

  @Assertion: 6.2.2.2(4)
              this can be used in the default implementation of an instance member function,
              and the type of this is the current interface.

  @Description: Check that 'this' can be accessed inside default implementations
                of instance members

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006374, 0006124

  @Comment: The assertion says that 'this' is accessible in functions only
            but the description of 'this' allows it in any instance member

*/

import utils.assert.Assert

interface I {
    func f() {
        let x = this
        Assert.isTrue(x is I)
    }
    mut prop p1: Int64 {
        get() {
            let x = this
            Assert.isTrue(x is I)
            1
        }
        set(v) {
            let x = this
            Assert.isTrue(x is I)
        }
    }
    prop p2: Int64 {
        get() {
            let x = this
            Assert.isTrue(x is I)
            2
        }
    }
}

class A <: I {}

main() {
    A().f()
    A().p1
    A().p1 = 1
    A().p2
    0
}