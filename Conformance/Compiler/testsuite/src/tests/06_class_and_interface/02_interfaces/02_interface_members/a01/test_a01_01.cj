/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_a01_01

  @Level:         1

  @Assertion: 6.2.2(1)
              The members of an interface include
              • members declared in the body of the interface which include static member functions,
                instance member functions, operator overloading functions,
                static member properties and instance member properties.
              • and members inherited from other interfaces.

  @Description: Check that all the listed entities are members of an interface

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

interface S1 {
    // Functions without body
    func f1_s1(): Int64
    static func f2_s1(): Int64
    static func f3_s1<T>(): Int64

    // Functions with body
    func f4_s1() {
        return 0
    }
    static func f5_s1() {
        return 0
    }
    static func f6_s1<T>() {
        return 0
    }

    // Properties without body
    mut prop p1_s1: Int64
    prop p2_s1: Int64
    static mut prop p3_s1: Int64
    static prop p4_s1: Int64

    // Properties with body
    mut prop p5_s1: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    prop p6_s1: Int64 {
        get() {
            0
        }
    }
    static mut prop p7_s1: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    static prop p8_s1: Int64 {
        get() {
            0
        }
    }

    // Operator without body
    operator func +(rhs: S1): Int64

    // Operator with body
    operator func -(rhs: S1) {
        return 0
    }
}

interface S2 {
    // Functions without body
    func f1_s2(): Int64
    static func f2_s2(): Int64
    static func f3_s2<T>(): Int64

    // Functions with body
    func f4_s2() {
        return 0
    }
    static func f5_s2() {
        return 0
    }
    static func f6_s2<T>() {
        return 0
    }

    // Properties without body
    mut prop p1_s2: Int64
    prop p2_s2: Int64
    static mut prop p3_s2: Int64
    static prop p4_s2: Int64

    // Properties with body
    mut prop p5_s2: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    prop p6_s2: Int64 {
        get() {
            0
        }
    }
    static mut prop p7_s2: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    static prop p8_s2: Int64 {
        get() {
            0
        }
    }

    // Operator without body
    operator func *(rhs: S2): Int64

    // Operator with body
    operator func /(rhs: S2) {
        return 0
    }
}

interface I <: S1 & S2 {
    // Functions without body
    func f1(): Int64
    static func f2(): Int64
    static func f3<T>(): Int64

    // Functions with body
    func f4() {
        return 0
    }
    static func f5() {
        return 0
    }
    static func f6<T>() {
        return 0
    }

    // Properties without body
    mut prop p1: Int64
    prop p2: Int64
    static mut prop p3: Int64
    static prop p4: Int64

    // Properties with body
    mut prop p5: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    prop p6: Int64 {
        get() {
            0
        }
    }
    static mut prop p7: Int64 {
        get() {
            0
        }
        set(v) {}
    }
    static prop p8: Int64 {
        get() {
            0
        }
    }

    // Operator without body
    operator func !(): Int64

    // Operator with body
    operator func -() {
        return 0
    }

    // Check that all members can be accessed by name inside the interface
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

        Assert.equals(15, f1_s1())
        Assert.equals(16, f2_s1())
        Assert.equals(17, f3_s1<Unit>())
        Assert.equals(18, f4_s1())
        Assert.equals(19, f5_s1())
        Assert.equals(20, f6_s1<Unit>())

        Assert.equals(21, p1_s1)
        Assert.equals(22, p2_s1)
        Assert.equals(23, p3_s1)
        Assert.equals(24, p4_s1)
        Assert.equals(25, p5_s1)
        Assert.equals(26, p6_s1)
        Assert.equals(27, p7_s1)
        Assert.equals(28, p8_s1)

        Assert.equals(29, f1_s2())
        Assert.equals(30, f2_s2())
        Assert.equals(31, f3_s2<Unit>())
        Assert.equals(32, f4_s2())
        Assert.equals(33, f5_s2())
        Assert.equals(34, f6_s2<Unit>())

        Assert.equals(35, p1_s2)
        Assert.equals(36, p2_s2)
        Assert.equals(37, p3_s2)
        Assert.equals(38, p4_s2)
        Assert.equals(39, p5_s2)
        Assert.equals(40, p6_s2)
        Assert.equals(41, p7_s2)
        Assert.equals(42, p8_s2)
    }
}

// Override every member of the interface. If a function or a property is not a member of the interface
// the modifiers 'override' and 'redef' can't be used
class A <: I {
    public override func f1() {
        return 1
    }
    public redef static func f2() {
        return 2
    }
    public redef static func f3<T>() {
        return 3
    }
    public override func f4() {
        return 4
    }
    public redef static func f5() {
        return 5
    }
    public redef static func f6<T>() {
        return 6
    }
    public override mut prop p1: Int64 {
        get() {
            7
        }
        set(v) {}
    }
    public override prop p2: Int64 {
        get() {
            8
        }
    }
    public redef static mut prop p3: Int64 {
        get() {
            9
        }
        set(v) {}
    }
    public redef static prop p4: Int64 {
        get() {
            10
        }
    }
    public override mut prop p5: Int64 {
        get() {
            11
        }
        set(v) {}
    }
    public override prop p6: Int64 {
        get() {
            12
        }
    }
    public redef static mut prop p7: Int64 {
        get() {
            13
        }
        set(v) {}
    }
    public redef static prop p8: Int64 {
        get() {
            14
        }
    }

    public override func f1_s1() {
        return 15
    }
    public redef static func f2_s1() {
        return 16
    }
    public redef static func f3_s1<T>() {
        return 17
    }
    public override func f4_s1() {
        return 18
    }
    public redef static func f5_s1() {
        return 19
    }
    public redef static func f6_s1<T>() {
        return 20
    }
    public override mut prop p1_s1: Int64 {
        get() {
            21
        }
        set(v) {}
    }
    public override prop p2_s1: Int64 {
        get() {
            22
        }
    }
    public redef static mut prop p3_s1: Int64 {
        get() {
            23
        }
        set(v) {}
    }
    public redef static prop p4_s1: Int64 {
        get() {
            24
        }
    }
    public override mut prop p5_s1: Int64 {
        get() {
            25
        }
        set(v) {}
    }
    public override prop p6_s1: Int64 {
        get() {
            26
        }
    }
    public redef static mut prop p7_s1: Int64 {
        get() {
            27
        }
        set(v) {}
    }
    public redef static prop p8_s1: Int64 {
        get() {
            28
        }
    }

    public override func f1_s2() {
        return 29
    }
    public redef static func f2_s2() {
        return 30
    }
    public redef static func f3_s2<T>() {
        return 31
    }
    public override func f4_s2() {
        return 32
    }
    public redef static func f5_s2() {
        return 33
    }
    public redef static func f6_s2<T>() {
        return 34
    }
    public override mut prop p1_s2: Int64 {
        get() {
            35
        }
        set(v) {}
    }
    public override prop p2_s2: Int64 {
        get() {
            36
        }
    }
    public redef static mut prop p3_s2: Int64 {
        get() {
            37
        }
        set(v) {}
    }
    public redef static prop p4_s2: Int64 {
        get() {
            38
        }
    }
    public override mut prop p5_s2: Int64 {
        get() {
            39
        }
        set(v) {}
    }
    public override prop p6_s2: Int64 {
        get() {
            40
        }
    }
    public redef static mut prop p7_s2: Int64 {
        get() {
            41
        }
        set(v) {}
    }
    public redef static prop p8_s2: Int64 {
        get() {
            42
        }
    }

    public override operator func !() {
        return 43
    }
    public override operator func -() {
        return 44
    }
    public override operator func +(rhs: S1) {
        return 45
    }
    public override operator func -(rhs: S1) {
        return 46
    }
    public override operator func *(rhs: S2) {
        return 47
    }
    public override operator func /(rhs: S2) {
        return 48
    }
}

main() {
    A().verify()

    let op1: I = A()
    let op2: I = A()

    Assert.equals(43, !op1)
    Assert.equals(44, -op2)
    Assert.equals(45, op1 + op2)
    Assert.equals(46, op1 - op2)
    Assert.equals(47, op1 * op2)
    Assert.equals(48, op1 / op2)
}