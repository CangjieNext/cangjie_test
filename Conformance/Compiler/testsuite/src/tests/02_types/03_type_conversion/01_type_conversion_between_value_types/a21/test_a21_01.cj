/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a21_01

  @Level:         1

  @Assertion:    2.3.1(21) The following conversions are always accurate: 
                    conversion from Int8 to Float16, Float32, Float64; 
                    conversion from Int16 to Float32, Float64; 
                    conversion from Int32 to Float64.

  @Description:  Check that the listed conversions are always accurate

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main(): Unit {
    // from Int8 to Float16, Float32, Float64
    var i8_0: Int8 = -128
    let i8_1: Int8 = 0
    let i8_2: Int8 = 127

    Assert.approxEquals(-128.0000, Float16(i8_0), 0.0)
    Assert.approxEquals(0.0000,    Float16(i8_1), 0.0)
    Assert.approxEquals(127.0000,  Float16(i8_2), 0.0)

    Assert.approxEquals(-128.0000000, Float32(i8_0), 0.0)
    Assert.approxEquals(0.0000000,    Float32(i8_1), 0.0)
    Assert.approxEquals(127.0000000,  Float32(i8_2), 0.0)

    Assert.approxEquals(-128.0000000000, Float64(i8_0), 0.0)
    Assert.approxEquals(0.0000000000,    Float64(i8_1), 0.0)
    Assert.approxEquals(127.0000000000,  Float64(i8_2), 0.0)

    // from Int16 to Float32, Float64
    var i16_0: Int16 = -32768
    let i16_1: Int16 = 0
    let i16_2: Int16 = 32767

    Assert.approxEquals(-32768.0000000, Float32(i16_0), 0.0)
    Assert.approxEquals(0.0000000,      Float32(i16_1), 0.0)
    Assert.approxEquals(32767.0000000,  Float32(i16_2), 0.0)

    Assert.approxEquals(-32768.0000000000,  Float64(i16_0), 0.0)
    Assert.approxEquals(0.0000000000,       Float64(i16_1), 0.0)
    Assert.approxEquals(32767.000000000,    Float64(i16_2), 0.0)

    // from Int32 to Float64
    var i32_0: Int32 = -2147483648
    let i32_1: Int32 = 0
    let i32_2: Int32 = 2147483647

    Assert.approxEquals(-2147483648.0000000, Float64(i32_0), 0.0)
    Assert.approxEquals(0.0000000,           Float64(i32_1), 0.0)
    Assert.approxEquals(2147483647.0000000,  Float64(i32_2), 0.0)
}