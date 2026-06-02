/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_06_a01_02

  @Level:         1

  @Assertion: 6.1.2.6(1)
              Properties can also be defined in class,
              see Property for the syntax of defining member properties.

  @Description: Check the values various types are correctly passed to and from properties

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

struct Helper_struct {
    Helper_struct(let m: Int64) {}
}

enum Helper_enum {
    A(Int64) |
    B(String)
}

class Test {
    mut prop p1: Unit {
        get() {
            ()
        }
        set(v) {
            Assert.isTrue(v is Unit)
        }
    }
    prop p2: Int64 {
        get() {
            100
        }
    }

    private mut prop p3: Rune {
        get() {
            r'a'
        }
        set(v) {
            Assert.isTrue(v is Rune)
            Assert.equals(r'f', v)
        }
    }
    private prop p4: Float64 {
        get() {
            1.4e-15
        }
    }

    protected mut prop p5: String {
        get() {
            "OoOoOoOo"
        }
        set(v) {
            Assert.isTrue(v is String)
            Assert.equals("ttt", v)
        }
    }
    protected prop p6: Bool {
        get() {
            true
        }
    }

    public mut prop p7: (Int64, Rune, (String, String)) {
        get() {
            (19, r' ', ("Str", "ing"))
        }
        set(v) {
            Assert.isTrue(v is (Int64, Rune, (String, String)))
            Assert.equals(13, v[0])
            Assert.equals(r'}', v[1])
            Assert.equals("YY", v[2][0])
            Assert.equals("YYY", v[2][1])
        }
    }
    public prop p8: (Int64, Int64) -> Bool {
        get() {
            {x: Int64, y: Int64 => if (x + y > 0) {return true} else {return false} }
        }
    }

    static mut prop p9: Array<Int64> {
        get() {
            [1, 2, 2, 1]
        }
        set(v) {
            Assert.isTrue(v is Array<Int64>)
            Assert.equals([0], v)
        }
    }
    static prop p10: Range<Int64> {
        get() {
            -100..100:100
        }
    }

    private static mut prop p11: Helper_struct {
        get() {
            Helper_struct(-1)
        }
        set(v) {
            Assert.isTrue(v is Helper_struct)
            Assert.equals(55, v.m)
        }
    }
    private static prop p12: Helper_enum {
        get() {
            Helper_enum.B("It's B")
        }
    }

    protected static mut prop p13: UInt32 {
        get() {
            147419u32
        }
        set(v) {
            Assert.isTrue(v is UInt32)
            Assert.equals(555u32, v)
        }
    }
    protected static prop p14: Float16 {
        get() {
            0.047190417741f16
        }
    }

    public static mut prop p15: Int8 {
        get() {
            63i8
        }
        set(v) {
            Assert.isTrue(v is Int8)
            Assert.equals(-1i8, v)
        }
    }
    public static prop p16: Float32 {
        get() {
            1.78e13
        }
    }

    static func test() {
        let tst = Test()

        let t1 = tst.p1
        Assert.isTrue(t1 is Unit)
        tst.p1 = ()

        let t2 = tst.p2
        Assert.equals(100, t2)

        let t3 = tst.p3
        Assert.equals(r'a', t3)
        tst.p3 = r'f'

        let t4 = tst.p4
        Assert.approxEquals(1.4e-15, t4)

        let t5 = tst.p5
        Assert.equals("OoOoOoOo", t5)
        tst.p5 = "ttt"

        let t6 = tst.p6
        Assert.equals(true, t6)

        let t7 = tst.p7
        Assert.equals(19, t7[0])
        Assert.equals(r' ', t7[1])
        Assert.equals("Str", t7[2][0])
        Assert.equals("ing", t7[2][1])
        tst.p7 = (13, r'}', ("YY", "YYY"))

        let t8 = tst.p8
        Assert.equals(false, t8(-6, -9))

        let t9 = Test.p9
        Assert.equals([1, 2, 2, 1], t9)
        Test.p9 = [0]

        let t10 = Test.p10
        Assert.equals(-100..100:100, t10)

        let t11 = Test.p11
        Assert.equals(-1, t11.m)
        Test.p11 = Helper_struct(55)

        let t12 = Test.p12
        let tmp = match(t12) {
            case Helper_enum.A(x) => ""
            case Helper_enum.B(y) => y
            case _ => "t"
        }
        Assert.equals("It's B", tmp)

        let t13 = Test.p13
        Assert.equals(147419u32, t13)
        Test.p13 = 555u32

        let t14 = Test.p14
        Assert.approxEquals(0.047190417741f16, t14)

        let t15 = Test.p15
        Assert.equals(63i8, t15)
        Test.p15 = -1i8

        let t16 = Test.p16
        Assert.approxEquals(1.78e13, t16)
    }
}

main() {
    Test.test()
}