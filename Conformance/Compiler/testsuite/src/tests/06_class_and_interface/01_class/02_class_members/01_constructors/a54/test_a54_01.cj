/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a54_01

  @Level:         1

  @Assertion: 6.1.2.1(54)
              After another constructor in the class or a superclass’s constructor is called,
              the instance member variables of the superclass can be accessed using super.f.

  @Description: Check that instance variables from the superclass can be accessed
                after 'this' or 'super' call

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006194

*/

import utils.assert.Assert

var id = 0

open class Parent {
    public var v1 = 1
    public let v2 = 2
    protected var v3 = 3
    protected let v4 = 4
    var v5 = 5
    let v6 = 6
}

class Test <: Parent {
    init() {}

    // Explicit super call
    init(x: Float64) {
        super()
        let t1 = super.v1
        let t2 = super.v2
        let t3 = super.v3
        let t4 = super.v4
        let t5 = super.v5
        let t6 = super.v6
        Assert.equals(1, t1)
        Assert.equals(2, t2)
        Assert.equals(3, t3)
        Assert.equals(4, t4)
        Assert.equals(5, t5)
        Assert.equals(6, t6)

        id = 1
    }

    // Explicit this call
    init(x: Int64) {
        this()
        let t1 = super.v1
        let t2 = super.v2
        let t3 = super.v3
        let t4 = super.v4
        let t5 = super.v5
        let t6 = super.v6
        Assert.equals(1, t1)
        Assert.equals(2, t2)
        Assert.equals(3, t3)
        Assert.equals(4, t4)
        Assert.equals(5, t5)
        Assert.equals(6, t6)

        id = 2
    }

    // Implicit super call
    init(x: Bool) {
        let t1 = super.v1
        let t2 = super.v2
        let t3 = super.v3
        let t4 = super.v4
        let t5 = super.v5
        let t6 = super.v6
        Assert.equals(1, t1)
        Assert.equals(2, t2)
        Assert.equals(3, t3)
        Assert.equals(4, t4)
        Assert.equals(5, t5)
        Assert.equals(6, t6)

        id = 3
    }

    // Since instance functions are called on a complete instance
    // super will be called by the time the function is called
    func f() {
        let t1 = super.v1
        let t2 = super.v2
        let t3 = super.v3
        let t4 = super.v4
        let t5 = super.v5
        let t6 = super.v6
        Assert.equals(1, t1)
        Assert.equals(2, t2)
        Assert.equals(3, t3)
        Assert.equals(4, t4)
        Assert.equals(5, t5)
        Assert.equals(6, t6)

        id = 4
    }

    // Properties are presumably the same as functions
    mut prop prop_p: Int64 {
        get() {
            let t1 = super.v1
            let t2 = super.v2
            let t3 = super.v3
            let t4 = super.v4
            let t5 = super.v5
            let t6 = super.v6
            Assert.equals(1, t1)
            Assert.equals(2, t2)
            Assert.equals(3, t3)
            Assert.equals(4, t4)
            Assert.equals(5, t5)
            Assert.equals(6, t6)
            id = 5
            10
        }
        set(v) {
            let t1 = super.v1
            let t2 = super.v2
            let t3 = super.v3
            let t4 = super.v4
            let t5 = super.v5
            let t6 = super.v6
            Assert.equals(1, t1)
            Assert.equals(2, t2)
            Assert.equals(3, t3)
            Assert.equals(4, t4)
            Assert.equals(5, t5)
            Assert.equals(6, t6)
            id = 6
        }
    }
}

main() {
    let case1 = Test(.0001)
    Assert.equals(1, id)

    let case2 = Test(1)
    Assert.equals(2, id)

    let case3 = Test(false)
    Assert.equals(3, id)

    case3.f()
    Assert.equals(4, id)

    case3.prop_p
    Assert.equals(5, id)

    case3.prop_p = 1
    Assert.equals(6, id)
}