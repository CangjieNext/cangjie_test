/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a04_08

  @Level:         1

  @Assertion: 6.2.4.1(4)
              The return type of the implemented function should be the same as
              or a subtype of the return type of the corresponding function in the interface.

  @Description: Check that an enum can implement abstract functions from a superinterface
                by defining functions with the same name, parameter list and the return type
                that is the same as an abstract function return type.
                The superinterface has several functions with different return types

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I2 {
    static func f1(): Int64
    static func f2(): Int32
    static func f3(): Int16
    static func f4(): Int8
    static func f5(): UInt64
    static func f6(): UInt32
    static func f7(): UInt16
    static func f8(): UInt8
    static func f9(): Float64
    static func f10(): Float32
    static func f11(): Float16
    static func f12(): Bool
    static func f13(): Rune
    static func f14(): String
    static func f15(): Unit
    static func f16(): (Rune, Rune)
    static func f17(): () -> Int64
    static func f18(): Range<Int64>
    static func f19(): Array<Bool>
}

enum B <: I2 {
    E | D
    public static func f1() {
        return 1
    }
    public static func f2() {
        return 2i32
    }
    public static func f3() {
        return 3i16
    }
    public static func f4() {
        return 4i8
    }
    public static func f5() {
        return 5u64
    }
    public static func f6() {
        return 6u32
    }
    public static func f7() {
        return 7u16
    }
    public static func f8() {
        return 8u8
    }
    public static func f9() {
        return 1.1
    }
    public static func f10() {
        return 1.2f32
    }
    public static func f11() {
        return 1.3f16
    }
    public static func f12() {
        return false
    }
    public static func f13() {
        return r'\\'
    }
    public static func f14() {
        return "[]"
    }
    public static func f15() {}
    public static func f16() {
        return (r'z', r'q')
    }
    public static func f17() {
        return { => 10 }
    }
    public static func f18() {
        return 1..9:2
    }
    public static func f19() {
        return [false, false, true]
    }

    func check() {
        Assert.equals(1, f1())
        Assert.equals(2i32, f2())
        Assert.equals(3i16, f3())
        Assert.equals(4i8, f4())
        Assert.equals(5u64, f5())
        Assert.equals(6u32, f6())
        Assert.equals(7u16, f7())
        Assert.equals(8u8, f8())
        Assert.approxEquals(1.1, f9())
        Assert.approxEquals(1.2f32, f10())
        Assert.approxEquals(1.3f16, f11())
        Assert.equals(false, f12())
        Assert.equals(r'\\', f13())
        Assert.equals("[]", f14())
        Assert.isTrue(f15() is Unit)
        Assert.isTrue(f16() == (r'z',r'q'))
        Assert.equals(10, f17()())
        Assert.equals(1..9:2, f18())
        Assert.equals([false, false, true], f19())
    }
}

main() {
    B.D.check()
}