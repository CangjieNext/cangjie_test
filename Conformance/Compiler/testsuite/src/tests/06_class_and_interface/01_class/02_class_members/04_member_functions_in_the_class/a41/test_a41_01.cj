/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a41_01

  @Level:         1

  @Assertion: 6.1.2.4(41)
              The instance members of the class cannot be accessed in the static member function.

  @Description: Check that static members can be accessed in static member functions

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

class Test {
    static var m1 = 1
    static let m2 = 2
    private static var m3 = 3
    private static let m4 = 4
    protected static var m5 = 5
    protected static let m6 = 6
    public static var m7 = 7
    public static let m8 = 8

    static mut prop p1: Int64 {
        get() {
            9
        }
        set(v) {}
    }
    static prop p2: Int64 {
        get() {
            10
        }
    }
    static private mut prop p3: Int64 {
        get() {
            11
        }
        set(v) {}
    }
    static private prop p4: Int64 {
        get() {
            12
        }
    }
    static protected mut prop p5: Int64 {
        get() {
            13
        }
        set(v) {}
    }
    static protected prop p6: Int64 {
        get() {
            14
        }
    }
    static public mut prop p7: Int64 {
        get() {
            15
        }
        set(v) {}
    }
    static public prop p8: Int64 {
        get() {
            16
        }
    }

    static func f1() {
        return 17
    }
    static func f2<T>() {
        return 18
    }
    static private func f3() {
        return 19
    }
    static private func f4<T>() {
        return 20
    }
    static protected func f5() {
        return 21
    }
    static protected func f6<T>() {
        return 22
    }
    static public func f7() {
        return 23
    }
    static public func f8<T>() {
        return 24
    }

    static func test_f() {
        Assert.equals(1, m1)
        Assert.equals(2, m2)
        Assert.equals(3, m3)
        Assert.equals(4, m4)
        Assert.equals(5, m5)
        Assert.equals(6, m6)
        Assert.equals(7, m7)
        Assert.equals(8, m8)

        Assert.equals(9, p1)
        Assert.equals(10, p2)
        Assert.equals(11, p3)
        Assert.equals(12, p4)
        Assert.equals(13, p5)
        Assert.equals(14, p6)
        Assert.equals(15, p7)
        Assert.equals(16, p8)

        Assert.equals(17, f1())
        Assert.equals(18, f2<Unit>())
        Assert.equals(19, f3())
        Assert.equals(20, f4<Unit>())
        Assert.equals(21, f5())
        Assert.equals(22, f6<Unit>())
        Assert.equals(23, f7())
        Assert.equals(24, f8<Unit>())
    }

    static func test_g<T>() {
        Assert.equals(1, m1)
        Assert.equals(2, m2)
        Assert.equals(3, m3)
        Assert.equals(4, m4)
        Assert.equals(5, m5)
        Assert.equals(6, m6)
        Assert.equals(7, m7)
        Assert.equals(8, m8)

        Assert.equals(9, p1)
        Assert.equals(10, p2)
        Assert.equals(11, p3)
        Assert.equals(12, p4)
        Assert.equals(13, p5)
        Assert.equals(14, p6)
        Assert.equals(15, p7)
        Assert.equals(16, p8)

        Assert.equals(17, f1())
        Assert.equals(18, f2<Unit>())
        Assert.equals(19, f3())
        Assert.equals(20, f4<Unit>())
        Assert.equals(21, f5())
        Assert.equals(22, f6<Unit>())
        Assert.equals(23, f7())
        Assert.equals(24, f8<Unit>())
    }
}

main() {
    Test.test_f()
    Test.test_g<Bool>()
}