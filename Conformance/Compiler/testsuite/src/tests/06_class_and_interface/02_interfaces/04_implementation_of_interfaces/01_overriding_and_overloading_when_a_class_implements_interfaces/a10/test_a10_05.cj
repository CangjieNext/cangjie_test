/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a10_05

  @Level:         1

  @Assertion: 6.2.4.1(10)
              If the implementation type already has (inherited from the super class or defined by the type)
              an implementation of the same function or property in an interface,
              the default implementation in any interface is not used.

  @Description: Check that an enum that defines the implementations of interface members
                does not use default implementations

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

interface I1 {
    func f1() {
        return 11
    }
    static func f2() {
        return 12
    }
    static func f3<T>() {
        return 13
    }

    prop p1: Int64 {
        get() {
            14
        }
    }
    static prop p2: Int64 {
        get() {
            15
        }
    }

    operator func-(rhs: Int64) {
        return 16
    }
}

interface I2 {
    func f1() {
        return 21
    }
    static func f2() {
        return 22
    }
    static func f3<T>() {
        return 23
    }

    prop p1: Int64 {
        get() {
            24
        }
    }
    static prop p2: Int64 {
        get() {
            25
        }
    }

    operator func-(rhs: Int64) {
        return 26
    }
}

enum A <: I1 & I2 {
    E
    public func f1() {
        return 1
    }
    public static func f2() {
        return 2
    }
    public static func f3<T>() {
        return 3
    }

    public prop p1: Int64 {
        get() {
            4
        }
    }
    public static prop p2: Int64 {
        get() {
            5
        }
    }

    public operator func-(rhs: Int64) {
        return 6
    }

    func check() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, this - 1)
    }
}

main() {
    A.E.check()
}