/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_08_a01_01

  @Level:         1

  @Assertion: 4.8(1)
              Numeric type conversion expressions are used to implement conversions between numeric types, whose value
              and type are the converted ones respectively.

  @Description: Check conversion expressions usage.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    let i64: Int64 = 10
    let i32: Int32 = 20
    let i16: Int16 = 30
    let i8: Int8 = 5

    let u64: UInt64 = 10
    let u32: UInt32 = 20
    let u16: UInt16 = 30
    let u8: UInt8 = 5

    let f64: Float64 = 10.0
    let f32: Float32 = 20.0
    let f16: Float16 = 30.0

    //
    // Conversion examples from signed int to unsigned int.
    //
    Assert.equals(10, UInt64(i64))
    Assert.equals(20, UInt32(i32))
    Assert.equals(30, UInt16(i16))
    Assert.equals(5, UInt8(i8))

    //
    // Conversion examples from signed int to floating point.
    //
    Assert.equals(10.0, Float64(i64))
    Assert.equals(20.0, Float32(i32))
    Assert.equals(30.0, Float16(i16))

    //
    // Conversion examples between signed ints,
    //
    Assert.equals(10, Int32(i64))
    Assert.equals(20, Int16(i32))
    Assert.equals(30, Int8(i16))
    Assert.equals(5, Int64(i8))

    //
    // Conversion examples from unsigned int to signed int.
    //
    Assert.equals(10, Int64(u64))
    Assert.equals(20, Int32(u32))
    Assert.equals(30, Int16(u16))
    Assert.equals(5, Int8(u8))

    //
    // Conversion examples from unsigned int to floating point.
    //
    Assert.equals(10.0, Float64(u64))
    Assert.equals(20.0, Float32(u32))
    Assert.equals(30.0, Float16(u16))

    //
    // Conversion examples between unsigned ints.
    //
    Assert.equals(10, UInt32(u64))
    Assert.equals(20, UInt16(u32))
    Assert.equals(30, UInt8(u16))
    Assert.equals(5, UInt64(u8))

    //
    // Conversion examples from floating point to signed int.
    //
    Assert.equals(10, Int64(f64))
    Assert.equals(20, Int32(f32))
    Assert.equals(30, Int16(f16))

    //
    // Conversion examples between floating point types.
    //
    Assert.equals(10.0, Float32(f64))
    Assert.equals(20.0, Float64(f32))
}

