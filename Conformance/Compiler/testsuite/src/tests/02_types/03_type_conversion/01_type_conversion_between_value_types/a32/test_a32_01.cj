/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a32_01

  @Level:         1

  @Assertion:    2.3.1(32) The following conversions may result in loss of precision and the result may be infinity
                 (when the value is beyond the range of the target type): 
                    conversion from UInt16 to Float16; 
                    conversion from UInt32 to Float16; 
                    and conversion from UInt64 to Float16.

  @Description:  Check that the listed conversions may result in loss of precision and the result may be infinity

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

main(): Unit {

    // UInt16 to Float16
    let u16A: UInt16 = 65535
    let u16B: UInt16 = 32768

    Assert.isTrue(Float16(u16A).isInf())
    Assert.approxEquals(32768.0000,  Float16(u16B - 3), 0.0)

    // from UInt32 to Float16
    let u32A: UInt32 = 4294967295
    let u32B: UInt32 = 32768

    Assert.isTrue(Float16(u32A).isInf())
    Assert.approxEquals(32768.0000,  Float16(u32B - 3), 0.0)

    // from UInt64 to Float16
    let u64A: UInt64 = 18446744073709551615
    let u64B: UInt64 = 32768

    Assert.isTrue(Float16(u64A).isInf())
    Assert.approxEquals(32768.0000,  Float16(u64B - 3), 0.0)
}