/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a07_006

  @Level:         1

  @Assertion: 6.2.4.1(7)
              The type of the implemented property must be the same as the corresponding property in the interface.

  @Description: Check that an enum can implement abstract properties with default implementations
                by defining a property with the same name and type

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006077

*/

import utils.assert.Assert

interface HI {}
class HC <: HI {
    HC(let x!: Int64 = 0) {}
}
struct HS {
    HS(let x!: Int64 = 0) {}
}
enum HE {
    E(Int64)
}

interface I {
    prop p1: Int64 {
        get() {
            0
        }
    }
    prop p2: Int32 {
        get() {
            0i32
        }
    }
    static prop p3: Int16 {
        get() {
            0i16
        }
    }
    static prop p4: Int8 {
        get() {
            0i8
        }
    }

    prop p5: UInt64 {
        get() {
            0u64
        }
    }
    prop p6: UInt32 {
        get() {
            0u32
        }
    }
    static prop p7: UInt16 {
        get() {
            0u16
        }
    }
    static prop p8: UInt8 {
        get() {
            0u8
        }
    }

    prop p9: Float64 {
        get() {
            0.1f64
        }
    }
    prop p10: Float32 {
        get() {
            0.1f32
        }
    }
    static prop p11: Float16 {
        get() {
            0.1f16
        }
    }
    static prop p12: Unit {
        get() {
        }
    }

    prop p13: String {
        get() {
            ""
        }
    }
    prop p14: Rune {
        get() {
            r'a'
        }
    }
    static prop p15: Bool {
        get() {
            false
        }
    }
    static prop p16: (String, Rune, Bool) {
        get() {
            ("", r'a', false)
        }
    }

    prop p17: () -> Int64 {
        get() {
            {=>0}
        }
    }
    prop p18: Range<Int64> {
        get() {
            1..2:1
        }
    }
    static prop p19: Array<Bool> {
        get() {
            [true, false]
        }
    }
    static prop p20: VArray<Int64, $3> {
        get() {
            [1, 1, 1]
        }
    }

    prop p21: HI {
        get() {
            HC()
        }
    }
    prop p22: HC {
        get() {
            HC()
        }
    }
    static prop p23: HS {
        get() {
            HS()
        }
    }
    static prop p24: HE {
        get() {
            HE.E(0)
        }
    }
}

enum A <: I {
    AA(Int64)
    public prop p1: Int64 {
        get() {
            1
        }
    }
    public prop p2: Int32 {
        get() {
            2i32
        }
    }
    public static prop p3: Int16 {
        get() {
            3i16
        }
    }
    public static prop p4: Int8 {
        get() {
            4i8
        }
    }

    public prop p5: UInt64 {
        get() {
            5u64
        }
    }
    public prop p6: UInt32 {
        get() {
            6u32
        }
    }
    public static prop p7: UInt16 {
        get() {
            7u16
        }
    }
    public static prop p8: UInt8 {
        get() {
            8u8
        }
    }

    public prop p9: Float64 {
        get() {
            0.01f64
        }
    }
    public prop p10: Float32 {
        get() {
            0.01f32
        }
    }
    public static prop p11: Float16 {
        get() {
            0.01f16
        }
    }
    public static prop p12: Unit {
        get() {
        }
    }

    public prop p13: String {
        get() {
            "tfqfq"
        }
    }
    public prop p14: Rune {
        get() {
            r'u'
        }
    }
    public static prop p15: Bool {
        get() {
            true
        }
    }
    public static prop p16: (String, Rune, Bool) {
        get() {
            ("nnn", r']', false)
        }
    }

    public prop p17: () -> Int64 {
        get() {
            {=>17}
        }
    }
    public prop p18: Range<Int64> {
        get() {
            1..18:1
        }
    }
    public static prop p19: Array<Bool> {
        get() {
            [true, true]
        }
    }
    public static prop p20: VArray<Int64, $3> {
        get() {
            [1, 0, 5]
        }
    }

    public prop p21: HI {
        get() {
            HC()
        }
    }
    public prop p22: HC {
        get() {
            HC(x: 22)
        }
    }
    public static prop p23: HS {
        get() {
            HS(x: 23)
        }
    }
    public static prop p24: HE {
        get() {
            HE.E(24)
        }
    }
}

main() {
    let tst = A.AA(1)
    Assert.equals(1, tst.p1)
    Assert.equals(2i32, tst.p2)
    Assert.equals(3i16, A.p3)
    Assert.equals(4i8, A.p4)

    Assert.equals(5u64, tst.p5)
    Assert.equals(6u32, tst.p6)
    Assert.equals(7u16, A.p7)
    Assert.equals(8u8, A.p8)

    Assert.approxEquals(0.01, tst.p9)
    Assert.approxEquals(0.01f32, tst.p10)
    Assert.approxEquals(0.01f16, A.p11)
    Assert.isTrue(A.p12 is Unit)

    Assert.equals("tfqfq", tst.p13)
    Assert.equals(r'u', tst.p14)
    Assert.equals(true, A.p15)
    Assert.isTrue(A.p16 == ("nnn", r']', false))

    Assert.equals(17, tst.p17())
    Assert.equals(1..18:1, tst.p18)
    Assert.equals([true, true], A.p19)
    Assert.equals(1, A.p20[0])
    Assert.equals(0, A.p20[1])
    Assert.equals(5, A.p20[2])

    Assert.isTrue(tst.p21 is HI)
    Assert.equals(22, tst.p22.x)
    Assert.equals(23, A.p23.x)
    let tmp = A.p24
    let x = match(tmp) {
        case HE.E(a) => a
    }
    Assert.equals(24, x)
}