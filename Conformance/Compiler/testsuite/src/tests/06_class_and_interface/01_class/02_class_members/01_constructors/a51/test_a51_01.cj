/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a51_01

  @Level:         1

  @Assertion: 6.1.2.1(51)
              If called, it must be at the first expression in the constructor body,
              without any expression or declaration before it.

  @Description: Check that this or super can be called as long as it's the first
                expression in the constructor

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: This is the continuation of the previous assertion:
            "Init constructors in the class can call other constructors (via this call expression)
            in the class or superclass‘s constructor(via super call expression),
            but only one of them can be called.


*/

import utils.assert.Assert

var gv = 0
var called_const = 0

open class Parent {
    init() {
        called_const = 1
    }
}

class Test <: Parent {
    private init() {
        called_const = 2
    }

    init(a: Int64) {
        super()

        let x = 1
        let y = 2

        func f(x: Int64) {
            return x + 1
        }

        let z = f(x + y)
        gv = z
    }

    init(x: String) {
        this()

        var m = 20

        func g(x: Int64, y: Int64) {
            return x * y
        }

        var h = g(m, m/2)

        gv = h
    }

    init(x: Bool) {
        super()
    }

    init(x: Rune) {
        this()
    }
}

main() {
    let case1 = Test(1)
    Assert.equals(4, gv)
    Assert.equals(1, called_const)
    called_const = 0

    let case2 = Test("")
    Assert.equals(200, gv)
    Assert.equals(2, called_const)
    called_const = 0

    let case3 = Test(false)
    Assert.equals(1, called_const)
    called_const = 0

    let case4 = Test('w')
    Assert.equals(2, called_const)
}