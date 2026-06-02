/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_06_a01_03

  @Level:         1

  @Assertion: 6.1.2.6(1)
              Properties can also be defined in class,
              see Property for the syntax of defining member properties.

  @Description: Check that properties can access class members

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert


class Test {
    let m1 = 15
    var m2 = -2

    static let s1 = 9
    static var s2 = -3

    func mf(x: Int64) {
        m2 = x + 1
        return m2 + 2
    }

    static func sf(x: Int64) {
        s2 = x * 2
        return s2 + s1 
    }

    mut prop p1: Int64 {
        get() {
            m2
        }
        set(v) {
            m2 = v
        }
    }
    prop p2: Int64 {
        get() {
            m1
        }
    }

    private mut prop p3: Int64 {
        get() {
            m1
        }
        set(v) {
            m2 = v
        }
    }
    private prop p4: Int64 {
        get() {
            m2
        }
    }

    protected mut prop p5: Int64 {
        get() {
            m2 = 19
            m1
        }
        set(v) {
            m2 = 1
        }
    }
    protected prop p6: Int64 {
        get() {
            mf(1)
        }
    }

    public mut prop p7: Int64 {
        get() {
            let x = m1 + m2
            func local(x: Int64) {
                return x - 3
            }
            local(x)
        }
        set(v) {
            func local(x: Test) {
                x.m2 = v
            }
            let capture = { => local(this) }
            capture()
        }
    }
    public prop p8: Int64 {
        get() {
            p3
        }
    }

    static mut prop p9: Int64 {
        get() {
            s2
        }
        set(v) {
            s2 = v
        }
    }
    static prop p10: Int64 {
        get() {
            s1
        }
    }

    private static mut prop p11: Int64 {
        get() {
            s1
        }
        set(v) {
            s2 = v
        }
    }
    private static prop p12: Int64 {
        get() {
            s2
        }
    }

    protected static mut prop p13: Int64 {
        get() {
            s2 = p11 + p12
            1
        }
        set(v) {
            s2 = Test().p1
        }
    }
    protected static prop p14: Int64 {
        get() {
            sf(19)
        }
    }

    public static mut prop p15: Int64 {
        get() {
            func local() {
                return 1
            }
            let x = local()
            s1 + x
        }
        set(v) {
            func local(x: Bool) {
                var z = v
                if (x) {
                    z++
                }
                return z
            }
            let zz = local(true)
            s2 = zz
        }
    }
    public static prop p16: Int64 {
        get() {
            p9 = 7
            0
        }
    }

    static func test() {
        let tst = Test()

        // Standard getter and setter for mutable variable m2
        Assert.equals(-2, tst.p1)
        tst.p1 = 9
        Assert.equals(9, tst.m2)

        // Standard getter for immutable variable m1
        Assert.equals(15, tst.p2)

        // Getter for m1, but setter for m2
        Assert.equals(15, tst.p3)
        tst.p3 = 7
        Assert.equals(7, tst.m2)

        // Getter for m2
        Assert.equals(7, tst.p4)

        // Getter returns a constant and changes m2, setter assigns a constant to m2
        Assert.equals(15, tst.p5)
        Assert.equals(19, tst.m2)
        tst.p5 = 100000
        Assert.equals(1, tst.m2)

        // Getter calls the function that changes m2
        Assert.equals(4, tst.p6)
        Assert.equals(2, tst.m2)

        // Getter and setter contain declarations, local functions and expressions
        Assert.equals(14, tst.p7)
        tst.p7 = 199
        Assert.equals(199, tst.m2)        

        // Getter calls another getter
        Assert.equals(15, tst.p8)

        // Standard getter and setter for mutable variable s2
        Assert.equals(-3, Test.p9)
        Test.p9 = 77
        Assert.equals(77, Test.s2)

        // Standard getter for immutable variable s1
        Assert.equals(9, Test.p10)

        // Getter for s1, but setter for s2
        Assert.equals(9, Test.p11)
        Test.p11 = 444
        Assert.equals(444, Test.s2)

        // Getter for s2
        Assert.equals(444, Test.p12)
        
        // Getter accesses other static properties and sets s2, setter creates an instance
        Assert.equals(1, Test.p13)
        Assert.equals(453, Test.s2)
        Test.p13 = 1
        Assert.equals(-2, Test.s2)

        // Getter calls the function that sets s2
        Assert.equals(47, Test.p14)
        Assert.equals(38, Test.s2)

        // Getter and setter contain declarations, local functions and expressions
        Assert.equals(10, Test.p15)
        Test.p15 = 2
        Assert.equals(3, Test.s2)

        // Getter writes to another property
        Assert.equals(0, Test.p16)
        Assert.equals(7, Test.s2)
    }
}

main() {
    Test.test()
}