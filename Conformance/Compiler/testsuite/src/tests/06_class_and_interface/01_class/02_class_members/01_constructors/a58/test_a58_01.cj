/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a58_01

  @Level:         1

  @Assertion: 6.1.2.1(58)
              Before all of the instance member variables are initialized,
              the constructor cannot use functions or lambda that capture this
              or use super functions by super.f or use separate this expression,
              but can use this.variableName (the syntax sugar variableName)
              to access initialized member variables.

  @Description: Check that initialized member variables can be used anywhere in a constructor
                and super functions, 'this' expressions and fucntions capturing 'this'
                can be used after all the member variables are initialized

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006226, 0006194, 0006124

*/

import utils.assert.Assert

open class Parent {
    func f1() {
        return "f1"
    }

    func f2<T>() {
        return "f2"
    }

    public func f3() {
        return "f3"
    }

    public func f4<T>() {
        return "f4"
    }

    protected func f5() {
        return "f5"
    }

    protected func f6<T>() {
        return "f6"
    }

    mut prop p1: String {
        get() {
            "p1"
        }
        set(v) {}
    }

    prop p2: String {
        get() {
            "p2"
        }
    }

    public mut prop p3: String {
        get() {
            "p3"
        }
        set(v) {}
    }

    public prop p4: String {
        get() {
            "p4"
        }
    }

    protected mut prop p5: String {
        get() {
            "p5"
        }
        set(v) {}
    }

    protected prop p6: String {
        get() {
            "p6"
        }
    }
}

class Test <: Parent {
    init() {
        // Check the access to already initialized member variables
        Assert.equals(1, this.m1)
        Assert.equals(2, this.m2)
        Assert.equals(3, this.m3)
        Assert.equals(4, this.m4)
        Assert.equals(5, this.m5)
        Assert.equals(6, this.m6)
        Assert.equals(7, this.m7)
        Assert.equals(8, this.m8)

        // Initialized uninitialized member variables
        n1 = 9
        n2 = 10
        Assert.equals(9, this.n1)
        Assert.equals(10, this.n2)

        // Call functions from the superclass
        Assert.equals("f1", super.f1())
        Assert.equals("f2", super.f2<Any>())
        Assert.equals("f3", super.f3())
        Assert.equals("f4", super.f4<Any>())
        Assert.equals("f5", super.f5())
        Assert.equals("f6", super.f6<Any>())

        // Call properties from the superclass
        Assert.equals("p1", super.p1)
        Assert.equals("p2", super.p2)
        Assert.equals("p3", super.p3)
        Assert.equals("p4", super.p4)
        Assert.equals("p5", super.p5)
        Assert.equals("p6", super.p6)

        // Instance members capture 'this'
        Assert.equals("g1", this.g1())
        Assert.equals("g2", this.g2<Unit>())
        Assert.equals("g3", this.g3())
        Assert.equals("g4", this.g4<Unit>())
        Assert.equals("g5", this.g5())
        Assert.equals("g6", this.g6<Unit>())
        Assert.equals("g7", this.g7())
        Assert.equals("g8", this.g8<Unit>())

        // Instance properties capture 'this'
        Assert.equals("q1", this.q1)
        Assert.equals("q2", this.q2)
        Assert.equals("q3", this.q3)
        Assert.equals("q4", this.q4)
        Assert.equals("q5", this.q5)
        Assert.equals("q6", this.q6)
        Assert.equals("q7", this.q7)
        Assert.equals("q8", this.q8)

        // Use 'this' as an expression
        let x = this
        Assert.isTrue(x is Test)
        Assert.equals(10, x.n2)

        // Capture 'this' in a lambda
        let l = { => this }
        Assert.isTrue(l() is Test)
        Assert.equals(9, l().n1)

        // Capture 'this' in a local function
        func local() {
            return this
        }
        Assert.isTrue(local() is Test)
        Assert.equals(10, local().n2)

        // Capture 'this' through a member function
        var f = g1
        Assert.equals("g1", f())
    }

    let m1 = 1
    var m2 = 2
    public let m3 = 3
    public var m4 = 4
    protected let m5 = 5
    protected var m6 = 6
    private let m7 = 7
    private var m8 = 8

    var n1: Int64
    let n2: Int64

    func g1() {
        return "g1"
    }

    func g2<T>() {
        return "g2"
    }

    public func g3() {
        return "g3"
    }

    public func g4<T>() {
        return "g4"
    }

    protected func g5() {
        return "g5"
    }

    protected func g6<T>() {
        return "g6"
    }

    private func g7() {
        return "g7"
    }

    private func g8<T>() {
        return "g8"
    }

    mut prop q1: String {
        get() {
            "q1"
        }
        set(v) {}
    }

    prop q2: String {
        get() {
            "q2"
        }
    }

    public mut prop q3: String {
        get() {
            "q3"
        }
        set(v) {}
    }

    public prop q4: String {
        get() {
            "q4"
        }
    }

    protected mut prop q5: String {
        get() {
            "q5"
        }
        set(v) {}
    }

    protected prop q6: String {
        get() {
            "q6"
        }
    }

    private mut prop q7: String {
        get() {
            "q7"
        }
        set(v) {}
    }

    private prop q8: String {
        get() {
            "q8"
        }
    }
}

main() {
    Test()
    0
}