/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_02_a03_02

  @Level:         1

  @Assertion: 6.2.2.2(3)
              When an interface is inherited or implemented by other interfaces or types,
              the default implementations of the interface are copied into the subtype
              if they have not been reimplemented.

  @Description: Check that reimplemented members do not have their default implementation
                copied to a subtype

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
}

class C1 <: I {
    public func f1() {
        return 11
    }
    public static func f2() {
        return 12
    }
    public static func f3<T>() {
        return 13
    }

    public mut prop p1: Int64 {
        get() {
            14
        }
        set(v) {}
    }

    public prop p2: Int64 {
        get() {
            15
        }
    }

    public static mut prop p3: Int64 {
        get() {
            16
        }
        set(v) {}
    }

    public static prop p4: Int64 {
        get() {
            17
        }
    }

    func check() {
        Assert.equals(11, f1())
        Assert.equals(12, f2())
        Assert.equals(13, f3<Unit>())
        Assert.equals(14, p1)
        Assert.equals(15, p2)
        Assert.equals(16, p3)
        Assert.equals(17, p4)
    }
}

struct S1 <: I {
    public func f1() {
        return 21
    }
    public static func f2() {
        return 22
    }
    public static func f3<T>() {
        return 23
    }

    public mut prop p1: Int64 {
        get() {
            24
        }
        set(v) {}
    }

    public prop p2: Int64 {
        get() {
            25
        }
    }

    public static mut prop p3: Int64 {
        get() {
            26
        }
        set(v) {}
    }

    public static prop p4: Int64 {
        get() {
            27
        }
    }

    func check() {
        Assert.equals(21, f1())
        Assert.equals(22, f2())
        Assert.equals(23, f3<Unit>())
        Assert.equals(24, p1)
        Assert.equals(25, p2)
        Assert.equals(26, p3)
        Assert.equals(27, p4)
    }
}

enum E1 <: I {
    EC1(String)

    public func f1() {
        return 31
    }
    public static func f2() {
        return 32
    }
    public static func f3<T>() {
        return 33
    }

    public prop p2: Int64 {
        get() {
            35
        }
    }

    public static prop p4: Int64 {
        get() {
            37
        }
    }

    func check() {
        Assert.equals(31, f1())
        Assert.equals(32, f2())
        Assert.equals(33, f3<Unit>())
        Assert.equals(4, p1)
        Assert.equals(35, p2)
        Assert.equals(6, p3)
        Assert.equals(37, p4)
    }
}

interface J <: I {}

class C2 <: J {
    public func f1() {
        return 41
    }
    public static func f2() {
        return 42
    }
    public static func f3<T>() {
        return 43
    }

    public mut prop p1: Int64 {
        get() {
            44
        }
        set(v) {}
    }

    public prop p2: Int64 {
        get() {
            45
        }
    }

    public static mut prop p3: Int64 {
        get() {
            46
        }
        set(v) {}
    }

    public static prop p4: Int64 {
        get() {
            47
        }
    }

    func check() {
        Assert.equals(41, f1())
        Assert.equals(42, f2())
        Assert.equals(43, f3<Unit>())
        Assert.equals(44, p1)
        Assert.equals(45, p2)
        Assert.equals(46, p3)
        Assert.equals(47, p4)
    }
}

struct S2 <: J {
    public func f1() {
        return 51
    }
    public static func f2() {
        return 52
    }
    public static func f3<T>() {
        return 53
    }

    public mut prop p1: Int64 {
        get() {
            54
        }
        set(v) {}
    }

    public prop p2: Int64 {
        get() {
            55
        }
    }

    public static mut prop p3: Int64 {
        get() {
            56
        }
        set(v) {}
    }

    public static prop p4: Int64 {
        get() {
            57
        }
    }

    func check() {
        Assert.equals(51, f1())
        Assert.equals(52, f2())
        Assert.equals(53, f3<Unit>())
        Assert.equals(54, p1)
        Assert.equals(55, p2)
        Assert.equals(56, p3)
        Assert.equals(57, p4)
    }
}

enum E2 <: J {
    EC2(String)

    public func f1() {
        return 61
    }
    public static func f2() {
        return 62
    }
    public static func f3<T>() {
        return 63
    }

    public prop p2: Int64 {
        get() {
            65
        }
    }

    public static prop p4: Int64 {
        get() {
            67
        }
    }

    func check() {
        Assert.equals(61, f1())
        Assert.equals(62, f2())
        Assert.equals(63, f3<Unit>())
        Assert.equals(4, p1)
        Assert.equals(65, p2)
        Assert.equals(6, p3)
        Assert.equals(67, p4)
    }
}

main() {
    C1().check()
    S1().check()
    E1.EC1("").check()

    C2().check()
    S2().check()
    E2.EC2("").check()
}