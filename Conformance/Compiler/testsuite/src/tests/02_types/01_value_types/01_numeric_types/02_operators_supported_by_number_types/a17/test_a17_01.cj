/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a17_01

  @Level:         1
  @Assertion:       2.1.1.2(17) (Compound) Assignment operators include assignment operation (=) and compound assignment
                    operations (op=) where the op may be a binary operators (i.e. arithmetic operators, logical
                    operators or bitwise operators). (Compound) assignment operation are used for assigning a value to a
                    variable. For details about the (compound) assignment operation, see the description of the
                    Assignment Expressions in Chapter 4.

  @Description:     Check that operators =, +=, -=, *=, **=, /=, %=, &&=, ||=, &=, |=, ^=, <<=, >>= work as expected for
                    all possible types.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore

  @Comment:         The logical compound operators are tested in this test even though they only work on the Bool type,
                    which isn't a numeric type, although this subchapter is about numeric types. See comment on issue
                    6166.
  @Issue:           0006166
*/

import utils.assert.Assert

main() {
    var i64: Int64 = 0
    var i32: Int32 = 0
    var i16: Int16 = 0
    var i8: Int8 = 0
    var i: IntNative = 0
    var u64: UInt64 = 0
    var u32: UInt32 = 0
    var u16: UInt16 = 0
    var u8: UInt8 = 0
    var u: UIntNative = 0
    var f64: Float64 = 0.0
    var f32: Float32 = 0.0
    var f16: Float16 = 0.0
    var b: Bool = false

    i64 = 2
    i32 = -4
    i16 = 12
    i8 = 3
    i = 9
    u64 = 7
    u32 = 10
    u16 = 1
    u8 = 10
    u = 8
    Assert.equals(2, i64)
    Assert.equals(-4, i32)
    Assert.equals(12, i16)
    Assert.equals(3, i8)
    Assert.equals(9, i)
    Assert.equals(7, u64)
    Assert.equals(10, u32)
    Assert.equals(1, u16)
    Assert.equals(10, u8)
    Assert.equals(8, u)
    f64 = -39.301526704722164
    f32 = -7.14275
    f16 = 39.7
    Assert.approxEquals(-39.301526704722164, f64)
    Assert.approxEquals(-7.14275, f32)
    Assert.approxEquals(39.7, f16)
    b = true
    Assert.isTrue(b)

    i64 += 4
    i32 += 2
    i16 += -12
    i8 += -5
    i += 0
    u64 += 3
    u32 += 12
    u16 += 7
    u8 += 6
    u += 9
    Assert.equals(6, i64)
    Assert.equals(-2, i32)
    Assert.equals(0, i16)
    Assert.equals(-2, i8)
    Assert.equals(9, i)
    Assert.equals(10, u64)
    Assert.equals(22, u32)
    Assert.equals(8, u16)
    Assert.equals(16, u8)
    Assert.equals(17, u)
    f64 += 39.8433
    f32 += -3.653
    f16 += 16.73
    Assert.approxEquals(0.5417732952778351, f64)
    Assert.approxEquals(-10.79575, f32)
    Assert.approxEquals(56.43, f16)

    i64 -= 12
    i32 -= 4
    i16 -= -7
    i8 -= 5
    i -= -4
    u64 -= 8
    u32 -= 12
    u16 -= 3
    u8 -= 4
    u -= 12
    Assert.equals(-6, i64)
    Assert.equals(-6, i32)
    Assert.equals(7, i16)
    Assert.equals(-7, i8)
    Assert.equals(13, i)
    Assert.equals(2, u64)
    Assert.equals(10, u32)
    Assert.equals(5, u16)
    Assert.equals(12, u8)
    Assert.equals(5, u)
    f64 -= 27.9701
    f32 -= 34.98
    f16 -= 36.8
    Assert.approxEquals(-27.428326704722163, f64)
    Assert.approxEquals(-45.77574, f32)
    Assert.approxEquals(19.63, f16)

    i64 *= 5
    i32 *= 1
    i16 *= -5
    i8 *= 11
    i *= 8
    u64 *= 8
    u32 *= 8
    u16 *= 4
    u8 *= 10
    u *= 13
    Assert.equals(-30, i64)
    Assert.equals(-6, i32)
    Assert.equals(-35, i16)
    Assert.equals(-77, i8)
    Assert.equals(104, i)
    Assert.equals(16, u64)
    Assert.equals(80, u32)
    Assert.equals(20, u16)
    Assert.equals(120, u8)
    Assert.equals(65, u)
    f64 *= 4.325
    f32 *= -16.69
    f16 *= 36.8
    Assert.approxEquals(-118.62751299792336, f64)
    Assert.approxEquals(763.99726, f32)
    Assert.approxEquals(722.38, f16)

    i64 **= 3
    Assert.equals(-27000, i64)
    f64 = -f64
    f64 **= -0.01
    Assert.approxEquals(0.9533626768371529, f64)
    f64 **= -3
    Assert.approxEquals(1.154052491053269, f64)

    i64 /= -14
    i32 /= -7
    i16 /= 6
    i8 /= 1
    i /= 4
    u64 /= 7
    u32 /= 6
    u16 /= 12
    u8 /= 4
    u /= 9
    Assert.equals(1928, i64)
    Assert.equals(0, i32)
    Assert.equals(-5, i16)
    Assert.equals(-77, i8)
    Assert.equals(26, i)
    Assert.equals(2, u64)
    Assert.equals(13, u32)
    Assert.equals(1, u16)
    Assert.equals(30, u8)
    Assert.equals(7, u)
    f64 /= 35.231
    f32 /= -40.0
    f16 /= 8.9
    Assert.approxEquals(0.03275673387225083, f64)
    Assert.approxEquals(-19.09993, f32)
    Assert.approxEquals(81.16, f16)

    i64 %= -2
    i32 %= -14
    i16 %= 5
    i8 %= 2
    i %= 12
    u64 %= 9
    u32 %= 8
    u16 %= 3
    u8 %= 9
    u %= 12
    Assert.equals(0, i64)
    Assert.equals(0, i32)
    Assert.equals(0, i16)
    Assert.equals(-1, i8)
    Assert.equals(2, i)
    Assert.equals(2, u64)
    Assert.equals(5, u32)
    Assert.equals(1, u16)
    Assert.equals(3, u8)
    Assert.equals(7, u)

    b &&= true
    Assert.isTrue(b)
    b &&= false
    Assert.isFalse(b)
    b &&= true
    Assert.isFalse(b)
    b &&= false
    Assert.isFalse(b)

    b ||= false
    Assert.isFalse(b)
    b ||= true
    Assert.isTrue(b)
    b ||= true
    Assert.isTrue(b)
    b ||= false
    Assert.isTrue(b)

    i64 &= 1
    i32 &= 12
    i16 &= 11
    i8 &= -11
    i &= -9
    u64 &= 0
    u32 &= 5
    u16 &= 3
    u8 &= 5
    u &= 12
    Assert.equals(0, i64)
    Assert.equals(0, i32)
    Assert.equals(0, i16)
    Assert.equals(-11, i8)
    Assert.equals(2, i)
    Assert.equals(0, u64)
    Assert.equals(5, u32)
    Assert.equals(1, u16)
    Assert.equals(1, u8)
    Assert.equals(4, u)

    i64 |= 12
    i32 |= 4
    i16 |= -7
    i8 |= 5
    i |= -4
    u64 |= 8
    u32 |= 12
    u16 |= 3
    u8 |= 4
    u |= 12
    Assert.equals(12, i64)
    Assert.equals(4, i32)
    Assert.equals(-7, i16)
    Assert.equals(-11, i8)
    Assert.equals(-2, i)
    Assert.equals(8, u64)
    Assert.equals(13, u32)
    Assert.equals(3, u16)
    Assert.equals(5, u8)
    Assert.equals(12, u)

    i64 ^= 5
    i32 ^= 1
    i16 ^= -5
    i8 ^= 11
    i ^= 8
    u64 ^= 8
    u32 ^= 8
    u16 ^= 4
    u8 ^= 10
    u ^= 13
    Assert.equals(9, i64)
    Assert.equals(5, i32)
    Assert.equals(2, i16)
    Assert.equals(-2, i8)
    Assert.equals(-10, i)
    Assert.equals(0, u64)
    Assert.equals(5, u32)
    Assert.equals(7, u16)
    Assert.equals(15, u8)
    Assert.equals(1, u)

    i64 <<= 32
    i32 <<= 16
    i16 <<= 8
    i8 <<= 4
    i <<= 2
    u64 <<= 31
    u32 <<= 15
    u16 <<= 7
    u8 <<= 3
    u <<= 13
    Assert.equals(38654705664, i64)
    Assert.equals(327680, i32)
    Assert.equals(512, i16)
    Assert.equals(-32, i8)
    Assert.equals(-40, i)
    Assert.equals(0, u64)
    Assert.equals(163840, u32)
    Assert.equals(896, u16)
    Assert.equals(120, u8)
    Assert.equals(8192, u)

    i64 >>= 5
    i32 >>= 4
    i16 >>= 3
    i8 >>= 2
    i >>= 1
    u64 >>= 1
    u32 >>= 2
    u16 >>= 3
    u8 >>= 4
    u >>= 5
    Assert.equals(1207959552, i64)
    Assert.equals(20480, i32)
    Assert.equals(64, i16)
    Assert.equals(-8, i8)
    Assert.equals(-20, i)
    Assert.equals(0, u64)
    Assert.equals(40960, u32)
    Assert.equals(112, u16)
    Assert.equals(7, u8)
    Assert.equals(256, u)
}
