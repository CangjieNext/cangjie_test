/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a10_03

  @Level:         1

  @Assertion: 6.2.4.1(10)
              If the implementation type already has (inherited from the super class or defined by the type)
              an implementation of the same function or property in an interface,
              the default implementation in any interface is not used.

  @Description: Check that a class can get the implementations of interface members from the superclass

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

  @Comment: The assertion is not exactly about that. But it's the only place in the specification
            where it's mentioned that implementation of abstract functions can come from the superclass

*/

import utils.assert.Assert

interface I {
    func f1(): Int64
    static func f2(): Int64
    static func f3<T>(): Int64

    mut prop p1: Int64
    prop p2: Int64
    static mut prop p3: Int64
    static prop p4: Int64 
    operator func-(rhs: Int64): Int64
}

open class S {
    public func f1() {
        return 1
    }
    public static func f2() {
        return 2
    }
    public static func f3<T>() {
        return 3
    }

    public mut prop p1: Int64 {
        get() {
            4
        }
        set(v) {}
    }
    public prop p2: Int64 {
        get() {
            5
        }
    }
    public static mut prop p3: Int64 {
        get() {
            6
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            7
        }
    }
    public operator func-(rhs: Int64) {
        return 8
    }
}

class A <: S & I {
    func check() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, p3)
        Assert.equals(7, p4)
        Assert.equals(8, this - 1)
    }
}

main() {
    A().check()
}