/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_02_a02_01

  @Level:         1

  @Assertion: 6.2.2.2(2)
              The abstract functions and abstract properties in an interface can have default implementations.

  @Description: Check that properties and functions in an interface
                can have a default implementation or can omit it

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

interface I {
    func f1(): Int64
    static func f2(): Int64
    static func f3<T>(): Int64

    func f4() {
        return 4
    }
    static func f5() {
        return 5
    }
    static func f6<T>() {
        return 6
    }

    mut prop p1: Int64
    prop p2: Int64
    static mut prop p3: Int64
    static prop p4: Int64

    mut prop p5: Int64 {
        get() {
            11
        }
        set(v) {}
    }
    prop p6: Int64 {
        get() {
            12
        }
    }
    static mut prop p7: Int64 {
        get() {
            13
        }
        set(v) {}
    }
    static prop p8: Int64 {
        get() {
            14
        }
    }

    func verify() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(4, f4())
        Assert.equals(5, f5())
        Assert.equals(6, f6<Unit>())
        Assert.equals(7, p1)
        Assert.equals(8, p2)
        Assert.equals(9, p3)
        Assert.equals(10, p4)
        Assert.equals(11, p5)
        Assert.equals(12, p6)
        Assert.equals(13, p7)
        Assert.equals(14, p8)
    }
}

class Impl <: I {
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
            7
        }
        set(v) {}
    }
    public prop p2: Int64 {
        get() {
            8
        }
    }
    public static mut prop p3: Int64 {
        get() {
            9
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            10
        }
    }
}

main() {
    Impl().verify()
}