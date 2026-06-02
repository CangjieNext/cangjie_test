/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_03_01_a14_02

  @Level:         1

  @Assertion:    2.3.1(14) Bidirectional conversion between unsigned integers: The rules are the same as conversion
                 between singed integers.

  @Description:  Check that the value is unchanged when it is converted from a bigger type to a smaller type for
                 unsigned integers when the value is within the range of the smaller type

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

let u8_u16 = UInt8(34_u16)
let u8_u32 = UInt8(35_u32)
let u8_u64 = UInt8(36_u64)
let u8_uN = UInt8(UIntNative(37))

var u16_u32 = UInt16(3572_u32)
var u16_u64 = UInt16(3624_u64)
var u16_uN = UInt16(UIntNative(3762))

var u32_u64 = UInt32(362456123_u64)
var u32_uN = UInt32(UIntNative(376225124))

main(): Unit {
    Assert.equals(34, u8_u16)
    Assert.equals(35, u8_u32)
    Assert.equals(36, u8_u64)
    Assert.equals(37, u8_uN)
    Assert.equals(3572, u16_u32)
    Assert.equals(3624, u16_u64)
    Assert.equals(3762, u16_uN)
    Assert.equals(362456123, u32_u64)
    Assert.equals(376225124, u32_uN)
}
