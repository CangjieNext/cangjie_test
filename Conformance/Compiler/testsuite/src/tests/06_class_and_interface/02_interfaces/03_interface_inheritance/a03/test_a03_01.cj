/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a03_01

  @Level:         1

  @Assertion: 6.2.3(3)
              When a sub-interface inherits the super interface,
              it inherits the abstract functions, default functions of the super interface.

  @Description: Check that a sub-interface has access to all members of the superinterface

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006377, 0006124

*/

import utils.assert.Assert

interface I {
    // Functions without body
    func f1(): Int64
    static func f2(): Int64
    static func f3<T>(): Int64

    // Functions with body
    func f4() {
        return 0
    }
    static func f5() {
        return 0
    }
    static func f6<T>() {
        return 0
    }

    // Properties without body
    mut prop p1: Int64
    prop p2: Int64
    static mut prop p3: Int64
    static prop p4: Int64

    // Properties with body
    mut prop p5: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    prop p6: Int64 {
        get() {
            0
        }
    }
    static mut prop p7: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    static prop p8: Int64 {
        get() {
            0
        }
    }

    // Operator without body
    operator func +(rhs: I): Int64

    // Operator with body
    operator func -(rhs: I) {
        return 0
    }
}

interface J <: I {
    func verify_access(x: J) {
        // Check instance members through an object
        Assert.equals(1, x.f1())
        Assert.equals(4, x.f4())
        Assert.equals(7, x.p1)
        Assert.equals(8, x.p2)
        Assert.equals(11, x.p5)
        Assert.equals(12, x.p6)

        // Check static member by name
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(5, f5())
        Assert.equals(6, f6<Unit>())
        Assert.equals(9, p3)
        Assert.equals(10, p4)
        Assert.equals(13, p7)
        Assert.equals(14, p8)

        // Check operators
        Assert.equals(15, x + x)
        Assert.equals(16, x - x)
    }
}

// Redefine or override all members of J
class A <: J {
    public override func f1() {
        return 1
    }
    public redef static func f2() {
        return 2
    }
    public redef static func f3<T>() {
        return 3
    }
    public override func f4() {
        return 4
    }
    public redef static func f5() {
        return 5
    }
    public redef static func f6<T>() {
        return 6
    }
    public override mut prop p1: Int64 {
        get() {
            7
        }
        set(v) {}
    }
    public override prop p2: Int64 {
        get() {
            8
        }
    }
    public redef static mut prop p3: Int64 {
        get() {
            9
        }
        set(v) {}
    }
    public redef static prop p4: Int64 {
        get() {
            10
        }
    }
    public override mut prop p5: Int64 {
        get() {
            11
        }
        set(v) {}
    }
    public override prop p6: Int64 {
        get() {
            12
        }
    }
    public redef static mut prop p7: Int64 {
        get() {
            13
        }
        set(v) {}
    }
    public redef static prop p8: Int64 {
        get() {
            14
        }
    }
    public override operator func +(rhs: I) {
        return 15
    }
    public override operator func -(rhs: I) {
        return 16
    }
}

main() {
    A().verify_access(A())
}