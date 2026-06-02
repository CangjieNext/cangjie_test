/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a52_01

  @Level:         1

  @Assertion: 6.1.2.1(52)
              If the constructor does not explicitly calling other constructors
              or calling the superclass’s constructor, the compiler inserts
              the parameterless constructor of the super class into the constructor.

  @Description: Check that a parameterless superclass constructor is called
                when a constructor does not call this or super

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

var super_was_called = false

open class Parent {
    init() {
        super_was_called = true
    }
}

class Test <: Parent {
    init() {}

    init(x: Int64) {
        let z = 1
        func f() {
            return 5
        }
        var m = 10
        m = f()
    }
}

class TestG<T> <: Parent {
    init() {}

    init(x: T) {
        func f1() {
            return 1
        }

        func f2() {
            return 2
        }

        var a = f1() + f2()

        a = f2() - f1()
    }
}

main() {
    let case1 = Test()
    Assert.equals(true, super_was_called)

    super_was_called = false
    let case2 = Test(1)
    Assert.equals(true, super_was_called)

    super_was_called = false
    let case3 = TestG<Unit>()
    Assert.equals(true, super_was_called)

    super_was_called = false
    let case4 = TestG<Rune>(r'e')
    Assert.equals(true, super_was_called)
}