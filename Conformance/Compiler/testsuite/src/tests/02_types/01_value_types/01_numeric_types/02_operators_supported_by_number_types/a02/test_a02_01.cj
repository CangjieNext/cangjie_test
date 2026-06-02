/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a02_01

  @Level:         1
  @Assertion:       2.1.1.2(2) All the preceding operators are defined for integer types.

  @Description:     Check +, -, *, /, %, **, <<, >>, !, &, |, ^, <, <=, ==, >, >=, !=, ++, --, unary -, +=, -=, *=, /=,
                    %=, **=, <<=, >>=, &=, |=, ^= for Int64/32/16/8/Native, UInt64/32/16/8/Native.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main() {
    var i64_1: Int64 = 4
    var i64_2: Int64 = 8
    Assert.equals(12, i64_1 + i64_2)
    Assert.equals(-4, i64_1 - i64_2)
    Assert.equals(32, i64_1 * i64_2)
    Assert.equals(0, i64_1 / i64_2)
    Assert.equals(4, i64_1 % i64_2)
    Assert.equals(65536, i64_1 ** UInt64(i64_2))
    Assert.equals(1024, i64_1 << i64_2)
    Assert.equals(0, i64_1 >> i64_2)
    Assert.equals(-5, !i64_1)
    Assert.equals(0, i64_1 & i64_2)
    Assert.equals(12, i64_1 | i64_2)
    Assert.equals(12, i64_1 ^ i64_2)
    Assert.isTrue(i64_1 < i64_2)
    Assert.isTrue(i64_1 <= i64_2)
    Assert.isTrue(i64_1 == i64_1)
    Assert.isTrue(i64_2 > i64_1)
    Assert.isTrue(i64_2 >= i64_1)
    Assert.isTrue(i64_1 != i64_2)
    i64_1++
    Assert.equals(5, i64_1)
    i64_1--
    Assert.equals(4, i64_1)
    Assert.equals(-4, -i64_1)
    i64_1 += i64_2
    Assert.equals(12, i64_1)
    i64_1 -= i64_2
    Assert.equals(4, i64_1)
    i64_1 *= i64_2
    Assert.equals(32, i64_1)
    i64_1 /= i64_2
    Assert.equals(4, i64_1)
    i64_1 %= i64_2
    Assert.equals(4, i64_1)
    i64_1 <<= i64_2
    Assert.equals(1024, i64_1)
    i64_1 >>= i64_2
    Assert.equals(4, i64_1)
    i64_1 |= i64_2
    Assert.equals(12, i64_1)
    i64_1 &= i64_2
    Assert.equals(8, i64_1)
    i64_1 ^= i64_2
    Assert.equals(0, i64_1)
    i64_1 = 4
    i64_1 **= UInt64(i64_2)
    Assert.equals(65536, i64_1)

    var i32_1: Int32 = 4
    var i32_2: Int32 = 2
    Assert.equals(6, i32_1 + i32_2)
    Assert.equals(2, i32_1 - i32_2)
    Assert.equals(8, i32_1 * i32_2)
    Assert.equals(2, i32_1 / i32_2)
    Assert.equals(0, i32_1 % i32_2)
    Assert.equals(16, i32_1 << i32_2)
    Assert.equals(1, i32_1 >> i32_2)
    Assert.equals(-5, !i32_1)
    Assert.equals(0, i32_1 & i32_2)
    Assert.equals(6, i32_1 | i32_2)
    Assert.equals(6, i32_1 ^ i32_2)
    Assert.isTrue(i32_2 < i32_1)
    Assert.isTrue(i32_2 <= i32_1)
    Assert.isTrue(i32_1 == i32_1)
    Assert.isTrue(i32_1 > i32_2)
    Assert.isTrue(i32_1 >= i32_2)
    Assert.isTrue(i32_1 != i32_2)
    i32_1++
    Assert.equals(5, i32_1)
    i32_1--
    Assert.equals(4, i32_1)
    Assert.equals(-4, -i32_1)
    i32_1 += i32_2
    Assert.equals(6, i32_1)
    i32_1 -= i32_2
    Assert.equals(4, i32_1)
    i32_1 *= i32_2
    Assert.equals(8, i32_1)
    i32_1 /= i32_2
    Assert.equals(4, i32_1)
    i32_1 %= i32_2
    Assert.equals(0, i32_1)
    i32_1 <<= i32_2
    Assert.equals(0, i32_1)
    i32_1 >>= i32_2
    Assert.equals(0, i32_1)
    i32_1 |= i32_2
    Assert.equals(2, i32_1)
    i32_1 &= i32_2
    Assert.equals(2, i32_1)
    i32_1 ^= i32_2
    Assert.equals(0, i32_1)

    var i16_1: Int16 = 7
    var i16_2: Int16 = 2
    Assert.equals(9, i16_1 + i16_2)
    Assert.equals(5, i16_1 - i16_2)
    Assert.equals(14, i16_1 * i16_2)
    Assert.equals(3, i16_1 / i16_2)
    Assert.equals(1, i16_1 % i16_2)
    Assert.equals(28, i16_1 << i16_2)
    Assert.equals(1, i16_1 >> i16_2)
    Assert.equals(-8, !i16_1)
    Assert.equals(2, i16_1 & i16_2)
    Assert.equals(7, i16_1 | i16_2)
    Assert.equals(5, i16_1 ^ i16_2)
    Assert.isTrue(i16_2 < i16_1)
    Assert.isTrue(i16_2 <= i16_1)
    Assert.isTrue(i16_1 == i16_1)
    Assert.isTrue(i16_1 > i16_2)
    Assert.isTrue(i16_1 >= i16_2)
    Assert.isTrue(i16_1 != i16_2)
    i16_1++
    Assert.equals(8, i16_1)
    i16_1--
    Assert.equals(7, i16_1)
    Assert.equals(-7, -i16_1)
    i16_1 += i16_2
    Assert.equals(9, i16_1)
    i16_1 -= i16_2
    Assert.equals(7, i16_1)
    i16_1 *= i16_2
    Assert.equals(14, i16_1)
    i16_1 /= i16_2
    Assert.equals(7, i16_1)
    i16_1 %= i16_2
    Assert.equals(1, i16_1)
    i16_1 <<= i16_2
    Assert.equals(4, i16_1)
    i16_1 >>= i16_2
    Assert.equals(1, i16_1)
    i16_1 |= i16_2
    Assert.equals(3, i16_1)
    i16_1 &= i16_2
    Assert.equals(2, i16_1)
    i16_1 ^= i16_2
    Assert.equals(0, i16_1)

    var i8_1: Int8 = 7
    var i8_2: Int8 = 2
    Assert.equals(9, i8_1 + i8_2)
    Assert.equals(5, i8_1 - i8_2)
    Assert.equals(14, i8_1 * i8_2)
    Assert.equals(3, i8_1 / i8_2)
    Assert.equals(1, i8_1 % i8_2)
    Assert.equals(28, i8_1 << i8_2)
    Assert.equals(1, i8_1 >> i8_2)
    Assert.equals(-8, !i8_1)
    Assert.equals(2, i8_1 & i8_2)
    Assert.equals(7, i8_1 | i8_2)
    Assert.equals(5, i8_1 ^ i8_2)
    Assert.isTrue(i8_2 < i8_1)
    Assert.isTrue(i8_2 <= i8_1)
    Assert.isTrue(i8_1 == i8_1)
    Assert.isTrue(i8_1 > i8_2)
    Assert.isTrue(i8_1 >= i8_2)
    Assert.isTrue(i8_1 != i8_2)
    i8_1++
    Assert.equals(8, i8_1)
    i8_1--
    Assert.equals(7, i8_1)
    Assert.equals(-7, -i8_1)
    i8_1 += i8_2
    Assert.equals(9, i8_1)
    i8_1 -= i8_2
    Assert.equals(7, i8_1)
    i8_1 *= i8_2
    Assert.equals(14, i8_1)
    i8_1 /= i8_2
    Assert.equals(7, i8_1)
    i8_1 %= i8_2
    Assert.equals(1, i8_1)
    i8_1 <<= i8_2
    Assert.equals(4, i8_1)
    i8_1 >>= i8_2
    Assert.equals(1, i8_1)
    i8_1 |= i8_2
    Assert.equals(3, i8_1)
    i8_1 &= i8_2
    Assert.equals(2, i8_1)
    i8_1 ^= i8_2
    Assert.equals(0, i8_1)

    var i_1: IntNative = 7
    var i_2: IntNative = 2
    Assert.equals(9, i_1 + i_2)
    Assert.equals(5, i_1 - i_2)
    Assert.equals(14, i_1 * i_2)
    Assert.equals(3, i_1 / i_2)
    Assert.equals(1, i_1 % i_2)
    Assert.equals(28, i_1 << i_2)
    Assert.equals(1, i_1 >> i_2)
    Assert.equals(-8, !i_1)
    Assert.equals(2, i_1 & i_2)
    Assert.equals(7, i_1 | i_2)
    Assert.equals(5, i_1 ^ i_2)
    Assert.isTrue(i_2 < i_1)
    Assert.isTrue(i_2 <= i_1)
    Assert.isTrue(i_1 == i_1)
    Assert.isTrue(i_1 > i_2)
    Assert.isTrue(i_1 >= i_2)
    Assert.isTrue(i_1 != i_2)
    i_1++
    Assert.equals(8, i_1)
    i_1--
    Assert.equals(7, i_1)
    Assert.equals(-7, -i_1)
    i_1 += i_2
    Assert.equals(9, i_1)
    i_1 -= i_2
    Assert.equals(7, i_1)
    i_1 *= i_2
    Assert.equals(14, i_1)
    i_1 /= i_2
    Assert.equals(7, i_1)
    i_1 %= i_2
    Assert.equals(1, i_1)
    i_1 <<= i_2
    Assert.equals(4, i_1)
    i_1 >>= i_2
    Assert.equals(1, i_1)
    i_1 |= i_2
    Assert.equals(3, i_1)
    i_1 &= i_2
    Assert.equals(2, i_1)
    i_1 ^= i_2
    Assert.equals(0, i_1)

    var u64_1: UInt64 = 5
    var u64_2: UInt64 = 8
    Assert.equals(13, u64_1 + u64_2)
    Assert.equals(3, u64_2 - u64_1)
    Assert.equals(40, u64_1 * u64_2)
    Assert.equals(0, u64_1 / u64_2)
    Assert.equals(5, u64_1 % u64_2)
    Assert.equals(1280, u64_1 << u64_2)
    Assert.equals(0, u64_1 >> u64_2)
    Assert.equals(18446744073709551610, !u64_1)
    Assert.equals(0, u64_1 & u64_2)
    Assert.equals(13, u64_1 | u64_2)
    Assert.equals(13, u64_1 ^ u64_2)
    Assert.isTrue(u64_1 < u64_2)
    Assert.isTrue(u64_1 <= u64_2)
    Assert.isTrue(u64_1 == u64_1)
    Assert.isTrue(u64_2 > u64_1)
    Assert.isTrue(u64_2 >= u64_1)
    Assert.isTrue(u64_1 != u64_2)
    u64_1++
    Assert.equals(6, u64_1)
    u64_1--
    Assert.equals(5, u64_1)
    u64_1 += u64_2
    Assert.equals(13, u64_1)
    u64_1 -= u64_2
    Assert.equals(5, u64_1)
    u64_1 *= u64_2
    Assert.equals(40, u64_1)
    u64_1 /= u64_2
    Assert.equals(5, u64_1)
    u64_1 %= u64_2
    Assert.equals(5, u64_1)
    u64_1 <<= u64_2
    Assert.equals(1280, u64_1)
    u64_1 >>= u64_2
    Assert.equals(5, u64_1)
    u64_1 |= u64_2
    Assert.equals(13, u64_1)
    u64_1 &= u64_2
    Assert.equals(8, u64_1)
    u64_1 ^= u64_2
    Assert.equals(0, u64_1)
    Assert.equals(0, -u64_1)

    var u32_1: UInt32 = 6
    var u32_2: UInt32 = 2
    Assert.equals(8, u32_1 + u32_2)
    Assert.equals(4, u32_1 - u32_2)
    Assert.equals(12, u32_1 * u32_2)
    Assert.equals(3, u32_1 / u32_2)
    Assert.equals(0, u32_1 % u32_2)
    Assert.equals(24, u32_1 << u32_2)
    Assert.equals(1, u32_1 >> u32_2)
    Assert.equals(4294967289, !u32_1)
    Assert.equals(2, u32_1 & u32_2)
    Assert.equals(6, u32_1 | u32_2)
    Assert.equals(4, u32_1 ^ u32_2)
    Assert.isTrue(u32_2 < u32_1)
    Assert.isTrue(u32_2 <= u32_1)
    Assert.isTrue(u32_1 == u32_1)
    Assert.isTrue(u32_1 > u32_2)
    Assert.isTrue(u32_1 >= u32_2)
    Assert.isTrue(u32_1 != u32_2)
    u32_1++
    Assert.equals(7, u32_1)
    u32_1--
    Assert.equals(6, u32_1)
    u32_1 += u32_2
    Assert.equals(8, u32_1)
    u32_1 -= u32_2
    Assert.equals(6, u32_1)
    u32_1 *= u32_2
    Assert.equals(12, u32_1)
    u32_1 /= u32_2
    Assert.equals(6, u32_1)
    u32_1 %= u32_2
    Assert.equals(0, u32_1)
    u32_1 <<= u32_2
    Assert.equals(0, u32_1)
    u32_1 >>= u32_2
    Assert.equals(0, u32_1)
    u32_1 |= u32_2
    Assert.equals(2, u32_1)
    u32_1 &= u32_2
    Assert.equals(2, u32_1)
    u32_1 ^= u32_2
    Assert.equals(0, u32_1)
    Assert.equals(0, -u32_1)

    var u16_1: UInt16 = 8
    var u16_2: UInt16 = 5
    Assert.equals(13, u16_1 + u16_2)
    Assert.equals(3, u16_1 - u16_2)
    Assert.equals(40, u16_1 * u16_2)
    Assert.equals(1, u16_1 / u16_2)
    Assert.equals(3, u16_1 % u16_2)
    Assert.equals(256, u16_1 << u16_2)
    Assert.equals(0, u16_1 >> u16_2)
    Assert.equals(65527, !u16_1)
    Assert.equals(0, u16_1 & u16_2)
    Assert.equals(13, u16_1 | u16_2)
    Assert.equals(13, u16_1 ^ u16_2)
    Assert.isTrue(u16_2 < u16_1)
    Assert.isTrue(u16_2 <= u16_1)
    Assert.isTrue(u16_1 == u16_1)
    Assert.isTrue(u16_1 > u16_2)
    Assert.isTrue(u16_1 >= u16_2)
    Assert.isTrue(u16_1 != u16_2)
    u16_1++
    Assert.equals(9, u16_1)
    u16_1--
    Assert.equals(8, u16_1)
    u16_1 += u16_2
    Assert.equals(13, u16_1)
    u16_1 -= u16_2
    Assert.equals(8, u16_1)
    u16_1 *= u16_2
    Assert.equals(40, u16_1)
    u16_1 /= u16_2
    Assert.equals(8, u16_1)
    u16_1 %= u16_2
    Assert.equals(3, u16_1)
    u16_1 <<= u16_2
    Assert.equals(96, u16_1)
    u16_1 >>= u16_2
    Assert.equals(3, u16_1)
    u16_1 |= u16_2
    Assert.equals(7, u16_1)
    u16_1 &= u16_2
    Assert.equals(5, u16_1)
    u16_1 ^= u16_2
    Assert.equals(0, u16_1)
    Assert.equals(0, -u16_1)

    var u8_1: UInt8 = 1
    var u8_2: UInt8 = 1
    Assert.equals(2, u8_1 + u8_2)
    Assert.equals(0, u8_1 - u8_2)
    Assert.equals(1, u8_1 * u8_2)
    Assert.equals(1, u8_1 / u8_2)
    Assert.equals(0, u8_1 % u8_2)
    Assert.equals(2, u8_1 << u8_2)
    Assert.equals(0, u8_1 >> u8_2)
    Assert.equals(254, !u8_1)
    Assert.equals(1, u8_1 & u8_2)
    Assert.equals(1, u8_1 | u8_2)
    Assert.equals(0, u8_1 ^ u8_2)
    Assert.isFalse(u8_2 < u8_1)
    Assert.isTrue(u8_2 <= u8_1)
    Assert.isTrue(u8_1 == u8_1)
    Assert.isFalse(u8_1 > u8_2)
    Assert.isTrue(u8_1 >= u8_2)
    Assert.isFalse(u8_1 != u8_2)
    u8_1++
    Assert.equals(2, u8_1)
    u8_1--
    Assert.equals(1, u8_1)
    u8_1 += u8_2
    Assert.equals(2, u8_1)
    u8_1 -= u8_2
    Assert.equals(1, u8_1)
    u8_1 *= u8_2
    Assert.equals(1, u8_1)
    u8_1 /= u8_2
    Assert.equals(1, u8_1)
    u8_1 %= u8_2
    Assert.equals(0, u8_1)
    u8_1 <<= u8_2
    Assert.equals(0, u8_1)
    u8_1 >>= u8_2
    Assert.equals(0, u8_1)
    u8_1 |= u8_2
    Assert.equals(1, u8_1)
    u8_1 &= u8_2
    Assert.equals(1, u8_1)
    u8_1 ^= u8_2
    Assert.equals(0, u8_1)
    Assert.equals(0, -u8_1)

    var u_1: UIntNative = 8
    var u_2: UIntNative = 5
    Assert.equals(13, u_1 + u_2)
    Assert.equals(3, u_1 - u_2)
    Assert.equals(40, u_1 * u_2)
    Assert.equals(1, u_1 / u_2)
    Assert.equals(3, u_1 % u_2)
    Assert.equals(256, u_1 << u_2)
    Assert.equals(0, u_1 >> u_2)
    Assert.isTrue(!u_1 == 4294967287 || !u_1 == 18446744073709551607)
    Assert.equals(0, u_1 & u_2)
    Assert.equals(13, u_1 | u_2)
    Assert.equals(13, u_1 ^ u_2)
    Assert.isTrue(u_2 < u_1)
    Assert.isTrue(u_2 <= u_1)
    Assert.isTrue(u_1 == u_1)
    Assert.isTrue(u_1 > u_2)
    Assert.isTrue(u_1 >= u_2)
    Assert.isTrue(u_1 != u_2)
    u_1++
    Assert.equals(9, u_1)
    u_1--
    Assert.equals(8, u_1)
    u_1 += u_2
    Assert.equals(13, u_1)
    u_1 -= u_2
    Assert.equals(8, u_1)
    u_1 *= u_2
    Assert.equals(40, u_1)
    u_1 /= u_2
    Assert.equals(8, u_1)
    u_1 %= u_2
    Assert.equals(3, u_1)
    u_1 <<= u_2
    Assert.equals(96, u_1)
    u_1 >>= u_2
    Assert.equals(3, u_1)
    u_1 |= u_2
    Assert.equals(7, u_1)
    u_1 &= u_2
    Assert.equals(5, u_1)
    u_1 ^= u_2
    Assert.equals(0, u_1)
    Assert.equals(0, -u_1)
}
