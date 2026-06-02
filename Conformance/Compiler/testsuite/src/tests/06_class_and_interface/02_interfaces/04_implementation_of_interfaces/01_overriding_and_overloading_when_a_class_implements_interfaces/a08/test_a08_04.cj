/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a08_04

  @Level:         1

  @Assertion: 6.2.4.1(8)
              If there is only one default implementation of the same function or property in multiple interfaces,
              the implementation type can leave the function or property unimplemented
              and use the default implementation.

  @Description: Check that a class can reimplement default implementations of one of several superinterfaces
                if other superinterfaces do not have default implementations

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

interface I1 {
    func f1() {
        return 1
    }
    static func f2() {
        return 2
    }
    static func f3<T>() {
        return 3
    }

    mut prop p1: Int64 {
        get() {
            4
        }
        set(v) {}
    }
    prop p2: Int64 {
        get() {
            5
        }
    }
    static mut prop p3: Int64 {
        get() {
            6
        }
        set(v) {}
    }
    static prop p4: Int64 {
        get() {
            7
        }
    }
    operator func+(rhs: Int64) {
        return 8
    }
}

interface I2 {
    func f1(): Int64
    static func f2(): Int64
    static func f3<T>(): Int64

    mut prop p1: Int64
    prop p2: Int64
    static mut prop p3: Int64
    static prop p4: Int64
    operator func+(rhs: Int64): Int64
}

interface I3 {
    func f1(): Int64
    static func f2(): Int64
    static func f3<T>(): Int64

    mut prop p1: Int64
    prop p2: Int64
    static mut prop p3: Int64
    static prop p4: Int64
    operator func+(rhs: Int64): Int64
}


class A <: I1 & I2 & I3 {
    public func f1() {
        return 11
    }
    public static func f2() {
        return 12
    }
    public static func f3<T>() {
        return 13
    }

    public mut prop p1: Int64 {
        get() {
            14
        }
        set(v) {}
    }
    public prop p2: Int64 {
        get() {
            15
        }
    }
    public static mut prop p3: Int64 {
        get() {
            16
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            17
        }
    }
    public operator func+(rhs: Int64) {
        return 18
    }

    func check() {
        Assert.equals(11, f1())
        Assert.equals(12, f2())
        Assert.equals(13, f3<Unit>())
        Assert.equals(14, p1)
        Assert.equals(15, p2)
        Assert.equals(16, p3)
        Assert.equals(17, p4)
        Assert.equals(18, this + 1)
    }
}

main() {
    A().check()
}