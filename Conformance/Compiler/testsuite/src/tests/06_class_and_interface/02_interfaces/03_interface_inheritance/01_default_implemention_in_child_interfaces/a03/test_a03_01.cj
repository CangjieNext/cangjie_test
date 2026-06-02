/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_01_a03_01

  @Level:         1

  @Assertion: 6.2.3.1(3)
              If a subinterface inherits a function or property
              that has a default implementation in the superinterface,
              it is not allowed to give only the declaration of this function or property
              but without definition in the subinterface

  @Description: Check that a subinterface can reimplement the default implementation
                from superinterface members

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
}

interface J <: I {
    func f1() {
        return 10
    }
    static func f2() {
        return 20
    }
    static func f3<T>() {
        return 30
    }

    mut prop p1: Int64 {
        get() {
            40
        }
        set(v) {}
    }
    prop p2: Int64 {
        get() {
            50
        }
    }
    static mut prop p3: Int64 {
        get() {
            60
        }
        set(v) {}
    }
    static prop p4: Int64 {
        get() {
            70
        }
    }

    operator func -() {
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

class Impl <: J {}

main() {
    Impl().verify()
}