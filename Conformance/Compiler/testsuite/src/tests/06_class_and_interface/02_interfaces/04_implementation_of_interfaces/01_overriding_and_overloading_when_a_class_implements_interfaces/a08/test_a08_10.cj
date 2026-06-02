/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a08_10

  @Level:         1

  @Assertion: 6.2.4.1(8)
              If there is only one default implementation of the same function or property in multiple interfaces,
              the implementation type can leave the function or property unimplemented
              and use the default implementation.

  @Description: Check that an enum can use default implementations of one of several superinterfaces
                if other superinterfaces do not have default implementations

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006413

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


enum A <: I1 & I2 & I3 {
    E(String)
    func check() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, p3)
        Assert.equals(7, p4)
        Assert.equals(8, this + 1)
    }
}

main() {
    A.E("").check()
}