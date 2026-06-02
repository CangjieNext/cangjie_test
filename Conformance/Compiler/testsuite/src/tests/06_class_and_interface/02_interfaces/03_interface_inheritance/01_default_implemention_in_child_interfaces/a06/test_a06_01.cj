/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_01_a06_01

  @Level:         1

  @Assertion: 6.2.3.1(6)
              If a child interface inherits multiple parent interfaces
              that have default implementations of the same signature member,
              the child interface must provide its own version of the new default implementation
              or it will compile with an error.

  @Description: Check that a child interface can reimplement conflicting members from several superclasses

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
    mut prop p1: Int64 {
        get() {
            14
        }
        set(v) {}
    }
    prop p2: Int64 {
        get() {
            15
        }
    }
    static mut prop p3: Int64 {
        get() {
            16
        }
        set(v) {}
    }
    static prop p4: Int64 {
        get() {
            17
        }
    }

    operator func !() {
        return 18
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
    mut prop p1: Int64 {
        get() {
            24
        }
        set(v) {}
    }
    prop p2: Int64 {
        get() {
            25
        }
    }
    static mut prop p3: Int64 {
        get() {
            26
        }
        set(v) {}
    }
    static prop p4: Int64 {
        get() {
            27
        }
    }
    operator func !() {
        return 28
    }
}

interface I3 {
    func f1() {
        return 31
    }
    static func f2() {
        return 32
    }
    static func f3<T>() {
        return 33
    }
    mut prop p1: Int64 {
        get() {
            34
        }
        set(v) {}
    }
    prop p2: Int64 {
        get() {
            35
        }
    }
    static mut prop p3: Int64 {
        get() {
            36
        }
        set(v) {}
    }
    static prop p4: Int64 {
        get() {
            37
        }
    }
    operator func !() {
        return 38
    }
}

interface J <: I1 & I2 & I3 {
    func f1() {
        return 1
    }
    redef static func f2() {
        return 2
    }
    static func f3<T>() {
        return 3
    }
    override mut prop p1: Int64 {
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
    redef static mut prop p3: Int64 {
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
    operator func !() {
        return 8
    }

    func verify() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Int16>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, p3)
        Assert.equals(7, p4)
        Assert.equals(8, !this)
    }
}

class Impl <: J {}

main() {
    Impl().verify()
}