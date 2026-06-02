/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a01_03

  @Level:         1

  @Assertion: 6.2.4.1(1)
              When implementing an interface for a type other than an abstract class,
              you must implement all the functions.

  @Description: Check that if an enum implements all abstract members of superinterfaces
                no errors are produced

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006392

*/

import utils.assert.Assert

// Nothing to implement
interface I {}

// Two interfaces with several memners
interface I1 {
    func f1_i1(): Int64
    static func f2_i1(): Int64
    static func f3_i1<T>(): Int64

    prop p1_i1: Int64
    static prop p2_i1: Int64

    operator func +(rhs: I1): Int64
}

interface I2 {
    func f1_i2(): Int64
    static func f2_i2(): Int64
    static func f3_i2<T>(): Int64

    prop p1_i2: Int64
    static prop p2_i2: Int64

    operator func -(rhs: I2): Int64
}

// Many interfaces each with one member
interface J1 {
    func f1(): Int64
}

interface J2 {
    static func f2(): Int64

}

interface J3 {
    static func f3<T>(): Int64
}

interface J4 {
    prop p1: Int64
}

interface J5 {
    static prop p2: Int64
}

interface J6 {
    operator func [](idx: Int64): Int64
}

enum Case1 <: I {
    EC1(Int64)
}

enum Case2 <: I1 & I2 {
    EC2(Int64)

    public func f1_i1() {
        return 1
    }
    public static func f2_i1() {
        return 2
    }
    public static func f3_i1<T>() {
        return 3
    }

    public prop p1_i1: Int64 {
        get() {
            4
        }
    }
    public static prop p2_i1: Int64 {
        get() {
            5
        }
    }

    public operator func +(rhs: I1) {
        return 6
    }

    public func f1_i2() {
        return 7
    }
    public static func f2_i2() {
        return 8
    }
    public static func f3_i2<T>() {
        return 9
    }

    public prop p1_i2: Int64 {
        get() {
            10
        }
    }
    public static prop p2_i2: Int64 {
        get() {
            11
        }
    }

    public operator func -(rhs: I2) {
        return 12
    }

    func check() {
        Assert.equals(1, f1_i1())
        Assert.equals(2, f2_i1())
        Assert.equals(3, f3_i1<Unit>())
        Assert.equals(4, p1_i1)
        Assert.equals(5, p2_i1)
        Assert.equals(6, this + this)

        Assert.equals(7, f1_i2())
        Assert.equals(8, f2_i2())
        Assert.equals(9, f3_i2<Unit>())
        Assert.equals(10, p1_i2)
        Assert.equals(11, p2_i2)
        Assert.equals(12, this - this)
    }
}

enum Case3 <: J1 & J2 & J3 & J4 & J5 & J6 {
    EC3(Int64)
    public func f1() {
        return 10
    }
    public static func f2() {
        return 20
    }
    public static func f3<T>() {
        return 30
    }

    public prop p1: Int64 {
        get() {
            40
        }
    }

    public static prop p2: Int64 {
        get() {
            50
        }
    }

    public operator func [](idx: Int64) {
        return 60
    }

    func check() {
        Assert.equals(10, f1())
        Assert.equals(20, f2())
        Assert.equals(30, f3<Unit>())
        Assert.equals(40, p1)
        Assert.equals(50, p2)
        Assert.equals(60, this[0])
    }
}

main() {
    let case1 = Case1.EC1(1)
    Assert.isTrue(case1 is I)

    let case2 = Case2.EC2(2)
    case2.check()

    let case3 = Case3.EC3(3)
    case3.check()
}