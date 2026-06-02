/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a08_11

  @Level:         1

  @Assertion: 6.2.4.1(8)
              If there is only one default implementation of the same function or property in multiple interfaces,
              the implementation type can leave the function or property unimplemented
              and use the default implementation.

  @Description: Check that an enum can reimplement default implementations of the single superinterface

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

interface I {
    func f1() {
        return 1
    }
    static func f2() {
        return 2
    }
    static func f3<T>() {
        return 3
    }

    prop p1: Int64 {
        get() {
            4
        }
    }
    static prop p2: Int64 {
        get() {
            5
        }
    }

    operator func+(rhs: I) {
        return 6
    }
}

enum A <: I {
    E(String)
    public func f1() {
        return 11
    }
    public static func f2() {
        return 12
    }
    public static func f3<T>() {
        return 13
    }

    public prop p1: Int64 {
        get() {
            14
        }
    }
    public static prop p2: Int64 {
        get() {
            15
        }
    }

    public operator func+(rhs: I) {
        return 16
    }

    func check() {
        Assert.equals(11, f1())
        Assert.equals(12, f2())
        Assert.equals(13, f3<Unit>())
        Assert.equals(14, p1)
        Assert.equals(15, p2)
        Assert.equals(16, this + this)
    }
}

main() {
    A.E("").check()
}