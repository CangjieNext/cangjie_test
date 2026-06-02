/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a30_01

  @Level:         1

  @Assertion:    2.3.1(30) The following conversions are accurate: 
                    conversion from UInt8 to Float16, Float32, Float64; 
                    conversion from UInt16 to Float32, Float64; 
                    conversion from UInt32 to Float64.

  @Description:  Check that the listed conversions are accurate for the examples given below

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main(): Unit {

    // from UInt8 to Float16, Float32, Float64
    let u8A: UInt8 = 255
    let u8B: UInt8 = 0
    let u8C: UInt8 = 127

    Assert.approxEquals(255.0000, Float16(u8A), 0.0)
    Assert.approxEquals(0.0000,   Float16(u8B), 0.0)
    Assert.approxEquals(127.0000, Float16(u8C), 0.0)

    Assert.approxEquals(255.0000000, Float32(u8A), 0.0)
    Assert.approxEquals(0.0000000,   Float32(u8B), 0.0)
    Assert.approxEquals(127.0000000, Float32(u8C), 0.0)

    Assert.approxEquals(255.0000000000, Float64(u8A), 0.0)
    Assert.approxEquals(0.0000000000,   Float64(u8B), 0.0)
    Assert.approxEquals(127.0000000000, Float64(u8C), 0.0)

    Assert.notEquals(254.0000, Float16(u8A))
    Assert.notEquals(1.0000,   Float32(u8B))
    Assert.notEquals(128.0000, Float64(u8C))

    // from UInt16 to Float32, Float64
    let u16A: UInt16 = 65535
    let u16B: UInt16 = 0
    let u16C: UInt16 = 32768

    Assert.approxEquals(65535.0000000, Float32(u16A), 0.0)
    Assert.approxEquals(0.0000000,     Float32(u16B), 0.0)
    Assert.approxEquals(32768.0000000, Float32(u16C), 0.0)

    Assert.approxEquals(65535.0000000000, Float64(u16A), 0.0)
    Assert.approxEquals(0.0000000000,     Float64(u16B), 0.0)
    Assert.approxEquals(32768.0000000000, Float64(u16C), 0.0)

    Assert.notEquals(65534.0000, Float32(u16A))
    Assert.notEquals(1.0000,     Float32(u16B))
    Assert.notEquals(32767.0000, Float64(u16C))

    // from UInt32 to Float64.
    let u32A: UInt32 = 4294967295
    let u32B: UInt32 = 0
    let u32C: UInt32 = 2147483648

    Assert.approxEquals(4294967295.0000000000, Float64(u32A), 0.0)
    Assert.approxEquals(0.0000000000,          Float64(u32B), 0.0)
    Assert.approxEquals(2147483648.0000000000, Float64(u32C), 0.0)

    Assert.notEquals(4294967294.0000, Float64(u32A))
    Assert.notEquals(1.0000,          Float64(u32B))
    Assert.notEquals(2147483649.0000, Float64(u32C))
}