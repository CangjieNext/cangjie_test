/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a09_03

  @Level:         1

  @Assertion: 6.2.4.1(9)
              If multiple interfaces contain multiple default implementations
              of the same function or property, the implementation type
              must implement the function or property and cannot inherit from the default implementation.

  @Description: Check that an enum can reimplement abstract members that have default implementations
                in several superinterfaces

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

    operator func+(rhs: Int64) {
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

    operator func+(rhs: Int64) {
        return 26
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

    prop p1: Int64 {
        get() {
            34
        }
    }
    static prop p2: Int64 {
        get() {
            35
        }
    }

    operator func+(rhs: Int64) {
        return 36
    }
}


enum A <: I1 & I2 & I3 {
    E(Rune)
    public override func f1() {
        return 1
    }
    public redef static func f2() {
        return 2
    }
    public redef static func f3<T>() {
        return 3
    }

    public override prop p1: Int64 {
        get() {
            4
        }

    }
    public redef static prop p2: Int64 {
        get() {
            5
        }
    }

    public override operator func+(rhs: Int64) {
        return 6
    }

    func check() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, this + 1)
    }
}

main() {
    A.E(r'c').check()
}