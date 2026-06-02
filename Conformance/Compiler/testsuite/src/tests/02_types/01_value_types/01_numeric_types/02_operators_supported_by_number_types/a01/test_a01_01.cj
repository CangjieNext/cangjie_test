/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a01_01

  @Level:         1
  @Assertion:       2.1.1.2(1) Operators supported by numeric types include: arithmetic operators, bitwise operators,
                    relational operators, increment/decrement operators, unary negative operators, and (compound)
                    assignment operators.

  @Description:     Demo of listed operations.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

var i64: Int64 = 0
var i32: Int32 = 1
var i16: Int16 = 2
var u64: UInt64 = 3
var u32: UInt32 = 4
var u16: UInt16 = 5
var f64: Float64 = 6.0
var f32: Float32 = 7.0
var f16: Float16 = 8.0

main() {
    // Arithmetic
    Assert.equals(1, i64 + Int64(i32))
    Assert.equals(-1, i32 - Int32(i16))
    Assert.equals(6, UInt64(i16) * u64)
    Assert.equals(0, u64 / UInt64(u32))
    Assert.equals(2, UInt64(u16) % u64)
    Assert.equals(59049, 3 ** 10)
    // Bitwise
    Assert.equals(5, u16 << i64)
    Assert.equals(0, i64 >> i32)
    Assert.equals(-1, !i64)
    Assert.equals(1, UInt64(i32) & u64)
    Assert.equals(4, u32 | UInt32(i64))
    Assert.equals(1, u64 ^ UInt64(i16))
    // Relational
    Assert.isTrue(f64 < Float64(f32))
    Assert.isTrue(f32 <= Float32(f16))
    Assert.isTrue(i64 == Int64(i16 - i16))
    Assert.isTrue(u64 > UInt64(i64))
    Assert.isTrue(u32 >= UInt32(i64))
    Assert.isTrue(u16 != UInt16(f16))
    // Increment
    i32++
    Assert.equals(2, i32)
    // Decrement
    i16--
    Assert.equals(1, i16)
    // Unary negative
    Assert.approxEquals(-6.0, -f64)
    // Assignment operators
    f64 += Float64(u16)
    Assert.approxEquals(11.0, f64)
    f32 -= Float32(i64)
    Assert.approxEquals(7.0, f32)
    f16 *= Float16(i32)
    Assert.approxEquals(16.0, f16)
    i64 /= Int64(u64)
    Assert.equals(0, i64)
    i64 %= Int64(u32)
    Assert.equals(0, i64)
    i64 **= u64
    Assert.equals(0, i64)
    i32 <<= Int32(u32)
    Assert.equals(32, i32)
    i16 >>= Int16(u16)
    Assert.equals(0, i16)
    i64 &= Int64(u32)
    Assert.equals(0, i64)
    i32 |= Int32(u32)
    Assert.equals(36, i32)
    i16 ^= Int16(u16)
    Assert.equals(5, i16)
}
