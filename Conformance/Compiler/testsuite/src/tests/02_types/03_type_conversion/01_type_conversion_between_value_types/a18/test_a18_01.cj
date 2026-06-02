/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a18_01

  @Level:         1

  @Assertion:    2.3.1(18) Bidirectional conversion between signed integers and unsigned integers: Note that the range 
                 of signed integers are not contained in the range of unsigned integers with the same length, and vice
                 versa. Therefore, when a signed integer is converted to an unsigned one or the other way around, if 
                 the value falls within the range of the target type, the conversion is successful.

  @Description:  Check that if a value falls within the range of the target type the conversion will be successful

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let i8_u8 = UInt8(0_i8)
let i8_u16 = UInt16(34_i8)
let i8_u32 = UInt32(35_i8)
let i8_u64 = UInt64(36_i8)
let i8_uN = UIntNative(37_i8)

var i16_u8 = UInt8(38_i16)
var i16_u16 = UInt16(3572_i16)
var i16_u32 = UInt32(3573_i16)
var i16_u64 = UInt64(3624_i16)
var i16_uN = UIntNative(3762_i16)

let i32_u8 = UInt8(40_i32)
let i32_u16 = UInt16(3572_i32)
let i32_u32 = UInt32(357234_i32)
let i32_u64 = UInt64(362413_i32)
let i32_uN = UIntNative(376297_i32)

let i64_u8 = UInt8(39_i64)
let i64_u16 = UInt16(3572_i64)
let i64_u32 = UInt32(357296_i64)
let i64_u64 = UInt64(36249634_i64)
let i64_uN = UIntNative(376223_i64)

let u8_i8 = Int8(127_u8)
let u8_i16 = Int16(142_u8)
let u8_i32 = Int32(143_u8)
let u8_i64 = Int64(255_u8)
let u8_iN = IntNative(245_u8)

var u16_i8 = Int8(46_u16)
var u16_i16 = Int16(30572_u16)
var u16_i32 = Int32(63579_u16)
var u16_i64 = Int64(63624_u16)
var u16_iN = IntNative(63762_u16)

let u32_i8 = Int8(120_u32)
let u32_i16 = Int16(13572_u32)
let u32_i32 = Int32(357278_u32)
let u32_i64 = Int64(362445_u32)
let u32_iN = IntNative(376212_u32)

let u64_i8 = Int8(13_u64)
let u64_i16 = Int16(3572_u64)
let u64_i32 = Int32(357276_u64)
let u64_i64 = Int64(36244593_u64)
let u64_iN = IntNative(376280_u64)

main(): Unit {
    Assert.isTrue(i8_u8 is UInt8)
    Assert.isTrue(i8_u16 is UInt16)
    Assert.isTrue(i8_u32 is UInt32)
    Assert.isTrue(i8_u64 is UInt64)
    Assert.isTrue(i8_uN is UIntNative)

    Assert.isTrue(i16_u8 is UInt8)
    Assert.isTrue(i16_u16 is UInt16)
    Assert.isTrue(i16_u32 is UInt32)
    Assert.isTrue(i16_u64 is UInt64)
    Assert.isTrue(i16_uN is UIntNative)

    Assert.isTrue(i32_u8 is UInt8)
    Assert.isTrue(i32_u16 is UInt16)
    Assert.isTrue(i32_u32 is UInt32)
    Assert.isTrue(i32_u64 is UInt64)
    Assert.isTrue(i32_uN is UIntNative)

    Assert.isTrue(i64_u8 is UInt8)
    Assert.isTrue(i64_u16 is UInt16)
    Assert.isTrue(i64_u32 is UInt32)
    Assert.isTrue(i64_u64 is UInt64)
    Assert.isTrue(i64_uN is UIntNative)

    Assert.isTrue(u8_i8 is Int8)
    Assert.isTrue(u8_i16 is Int16)
    Assert.isTrue(u8_i32 is Int32)
    Assert.isTrue(u8_i64 is Int64)
    Assert.isTrue(u8_iN is IntNative)

    Assert.isTrue(u16_i8 is Int8)
    Assert.isTrue(u16_i16 is Int16)
    Assert.isTrue(u16_i32 is Int32)
    Assert.isTrue(u16_i64 is Int64)
    Assert.isTrue(u16_iN is IntNative)

    Assert.isTrue(u32_i8 is Int8)
    Assert.isTrue(u32_i16 is Int16)
    Assert.isTrue(u32_i32 is Int32)
    Assert.isTrue(u32_i64 is Int64)
    Assert.isTrue(u32_iN is IntNative)

    Assert.isTrue(u64_i8 is Int8)
    Assert.isTrue(u64_i16 is Int16)
    Assert.isTrue(u64_i32 is Int32)
    Assert.isTrue(u64_i64 is Int64)
    Assert.isTrue(u64_iN is IntNative)

    Assert.equals(0, i8_u8)
    Assert.equals(34, i8_u16)
    Assert.equals(35, i8_u32)
    Assert.equals(36, i8_u64)
    Assert.equals(37, i8_uN)

    Assert.equals(38, i16_u8)
    Assert.equals(3572, i16_u16)
    Assert.equals(3573, i16_u32)
    Assert.equals(3624, i16_u64)
    Assert.equals(3762, i16_uN)

    Assert.equals(40, i32_u8)
    Assert.equals(3572, i32_u16)
    Assert.equals(357234, i32_u32)
    Assert.equals(362413, i32_u64)
    Assert.equals(376297, i32_uN)

    Assert.equals(39, i64_u8)
    Assert.equals(3572, i64_u16)
    Assert.equals(357296, i64_u32)
    Assert.equals(36249634, i64_u64)
    Assert.equals(376223, i64_uN)

    Assert.equals(127, u8_i8)
    Assert.equals(142, u8_i16)
    Assert.equals(143, u8_i32)
    Assert.equals(255, u8_i64)
    Assert.equals(245, u8_iN)

    Assert.equals(46, u16_i8)
    Assert.equals(30572, u16_i16)
    Assert.equals(63579, u16_i32)
    Assert.equals(63624, u16_i64)
    Assert.equals(63762, u16_iN)

    Assert.equals(120, u32_i8)
    Assert.equals(13572, u32_i16)
    Assert.equals(357278, u32_i32)
    Assert.equals(362445, u32_i64)
    Assert.equals(376212, u32_iN)

    Assert.equals(13, u64_i8)
    Assert.equals(3572, u64_i16)
    Assert.equals(357276, u64_i32)
    Assert.equals(36244593, u64_i64)
    Assert.equals(376280, u64_iN)
}
