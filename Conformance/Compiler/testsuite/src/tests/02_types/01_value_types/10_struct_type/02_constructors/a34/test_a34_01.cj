/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a34_01

  @Level:         1

  @Assertion: 2.1.10.2(34)
              Before all of the instance member variables are initialized,
              the constructor cannot use functions or lambda that capture this,
              but can use this.variableName (the syntax sugar variableName) to access initialized member variables.

  @Description: Check that initialized member variables can be used anywhere in a constructor

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006226, 0006194, 0006124, 0006495

*/

import utils.assert.Assert

struct Test {
    init() {
        // Check the access to already initialized member variables
        Assert.equals(1, this.m1)
        Assert.equals(2, this.m2)
        Assert.equals(3, this.m3)
        Assert.equals(4, this.m4)
        Assert.equals(5, this.m5)
        Assert.equals(6, this.m6)

        // Initialized uninitialized member variables
        n1 = 9
        n2 = 10
        Assert.equals(9, this.n1)
        Assert.equals(10, this.n2)

        // Call member functions
        Assert.equals("g1", this.g1())
        Assert.equals("g2", this.g2<Unit>())
        Assert.equals("g3", this.g3())
        Assert.equals("g4", this.g4<Unit>())
        Assert.equals("g5", this.g5())
        Assert.equals("g6", this.g6<Unit>())

        // Call member properties
        Assert.equals("q1", this.q1)
        Assert.equals("q2", this.q2)
        Assert.equals("q3", this.q3)
        Assert.equals("q4", this.q4)
        Assert.equals("q5", this.q5)
        Assert.equals("q6", this.q6)

        // Access functions as first-class citizens
        let f1 = g1
        let f2 = g2<Unit>
        let f3 = g3
        let f4 = g4<Unit>
        let f5 = g5
        let f6 = g6<Unit>
        Assert.equals("g1", f1())
        Assert.equals("g2", f2())
        Assert.equals("g3", f3())
        Assert.equals("g4", f4())
        Assert.equals("g5", f5())
        Assert.equals("g6", f6())
    }

    let m1 = 1
    var m2 = 2
    public let m3 = 3
    public var m4 = 4
    private let m5 = 5
    private var m6 = 6

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

    private func g5() {
        return "g5"
    }

    private func g6<T>() {
        return "g6"
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

    private mut prop q5: String {
        get() {
            "q5"
        }
        set(v) {}
    }

    private prop q6: String {
        get() {
            "q6"
        }
    }
}

main() {
    Test()
    0
}