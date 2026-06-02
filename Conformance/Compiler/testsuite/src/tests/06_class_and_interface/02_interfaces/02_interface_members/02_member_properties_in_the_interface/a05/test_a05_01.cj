/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_02_a05_01

  @Level:         1

  @Assertion: 6.2.2.2(5)
              The default implementation, like the non-abstract member functions,
              has access to all accessible elements in the current scope

  @Description: Check that members accessible in non-abstract members
                are accessible in default implementations of interface members

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

    func f4():Int64
    static func f5(): Int64
    static func f6<T>(): Int64

    mut prop p1: Int64 {
        get() {
            7
        }
        set(v) {}
    }
    prop p2: Int64 {
        get() {
            8
        }
    }
    static mut prop p3: Int64 {
        get() {
            9
        }
        set(v) {}
    }
    static prop p4: Int64 {
        get() {
            10
        }
    }

    mut prop p5: Int64
    prop p6: Int64
    static mut prop p7: Int64
    static prop p8: Int64

    // Every member is accessible in instance functions
    func verify_instance() {
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

    // Static members are accessible in static functions
    static func verify_static() {
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(5, f5())
        Assert.equals(6, f6<Unit>())

        Assert.equals(9, p3)
        Assert.equals(10, p4)
        Assert.equals(13, p7)
        Assert.equals(14, p8)
    }

    // Every member is accessible in the getters and setters of instance properties
    mut prop p_instance: Unit {
        get() {
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
        set(v) {
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

    prop p_instance_let: Unit {
        get() {
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

    // Only static members are accessible in the getters and setters of static properties
    static mut prop p_static: Unit {
        get() {
            Assert.equals(2, f2())
            Assert.equals(3, f3<Unit>())
            Assert.equals(5, f5())
            Assert.equals(6, f6<Unit>())

            Assert.equals(9, p3)
            Assert.equals(10, p4)
            Assert.equals(13, p7)
            Assert.equals(14, p8)
        }
        set(v) {
            Assert.equals(2, f2())
            Assert.equals(3, f3<Unit>())
            Assert.equals(5, f5())
            Assert.equals(6, f6<Unit>())

            Assert.equals(9, p3)
            Assert.equals(10, p4)
            Assert.equals(13, p7)
            Assert.equals(14, p8)
        }
    }

    static prop p_static_let: Unit {
        get() {
            Assert.equals(2, f2())
            Assert.equals(3, f3<Unit>())
            Assert.equals(5, f5())
            Assert.equals(6, f6<Unit>())

            Assert.equals(9, p3)
            Assert.equals(10, p4)
            Assert.equals(13, p7)
            Assert.equals(14, p8)
        }
    }
}

class A <: I {
    public func f4() {
        return 4
    }
    public static func f5() {
        return 5
    }
    public static func f6<T>() {
        return 6
    }

    public mut prop p5: Int64 {
        get() {
            11
        }
        set(v) {}
    }
    public prop p6: Int64 {
        get() {
            12
        }
    }
    public static mut prop p7: Int64 {
        get() {
            13
        }
        set(v) {}
    }
    public static prop p8: Int64 {
        get() {
            14
        }
    }
}

main() {
    let tst = A()
    tst.verify_instance()
    A.verify_static()
    var pi = tst.p_instance
    pi = tst.p_instance_let
    tst.p_instance = pi
    var ps = A.p_static
    ps = A.p_static_let
    A.p_static = ps
}