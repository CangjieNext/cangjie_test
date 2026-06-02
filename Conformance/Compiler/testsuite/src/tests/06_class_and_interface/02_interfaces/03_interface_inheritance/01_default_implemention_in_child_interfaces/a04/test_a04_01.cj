/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_01_a04_01

  @Level:         1

  @Assertion: 6.2.3.1(4)
              If a new default implementation is given,
              the override or redef modifier before the function definition is optional.

  @Description: Check that a subinterface can optinally use 'override' and 'redef' keyword
                when reimplementing default implementations from the superinterface

  @Mode: run

  @Negative: no

  @Structure: single

  @Comment: This is the continuation of the previous assertion:
            If a subinterface inherits a function or property
            that has a default implementation in the superinterface,
            it is not allowed to give only the declaration of this function or property
            but without definition in the subinterface

    @Issue: 0006124


*/

import utils.assert.Assert

interface I {
    func f1() {
        return 0
    }
    static func f2() {
        return 0
    }
    static func f3<T>() {
        return 0
    }

    mut prop p1: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    prop p2: Int64 {
        get() {
            0
        }
    }
    static mut prop p3: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    static prop p4: Int64 {
        get() {
            0
        }
    }

    operator func -() {
        return 0
    }
}

interface J1 <: I {
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

    operator func -() {
        return 8
    }

    func verify() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<String>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, p3)
        Assert.equals(7, p4)
        Assert.equals(8, -this)
    }
}

interface J2 <: I {
    override func f1() {
        return 10
    }
    redef static func f2() {
        return 20
    }
    redef static func f3<T>() {
        return 30
    }

    override mut prop p1: Int64 {
        get() {
            40
        }
        set(v) {}
    }
    override prop p2: Int64 {
        get() {
            50
        }
    }
    redef static mut prop p3: Int64 {
        get() {
            60
        }
        set(v) {}
    }
    redef static prop p4: Int64 {
        get() {
            70
        }
    }

    override operator func -() {
        return 80
    }

    func verify() {
        Assert.equals(10, f1())
        Assert.equals(20, f2())
        Assert.equals(30, f3<String>())
        Assert.equals(40, p1)
        Assert.equals(50, p2)
        Assert.equals(60, p3)
        Assert.equals(70, p4)
        Assert.equals(80, -this)
    }
}

class Impl1 <: J1 {}
class Impl2 <: J2 {}

main() {
    Impl1().verify()
    Impl2().verify()
}